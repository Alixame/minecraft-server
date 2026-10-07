#!/bin/bash
# Cria SG, EC2 e Elastic IP na AWS (profile artisaan, us-east-1)
set -e
export AWS_PROFILE=${AWS_PROFILE:-artisaan} AWS_REGION=${AWS_REGION:-us-east-1}
DIR=$(cd "$(dirname "$0")" && pwd)
MYIP=$(curl -s https://checkip.amazonaws.com)
AMI=$(aws ssm get-parameter --name /aws/service/canonical/ubuntu/server/24.04/stable/current/arm64/hvm/ebs-gp3/ami-id --query Parameter.Value --output text)
VPC=$(aws ec2 describe-vpcs --filters Name=isDefault,Values=true --query 'Vpcs[0].VpcId' --output text)
SG=$(aws ec2 create-security-group --group-name minecraft-sg --description "Minecraft server" --vpc-id "$VPC" --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id "$SG" --protocol tcp --port 25565 --cidr 0.0.0.0/0 >/dev/null
aws ec2 authorize-security-group-ingress --group-id "$SG" --protocol tcp --port 22 --cidr "$MYIP/32" >/dev/null
UD=$(mktemp); { cat "$DIR/user-data.sh"; echo 'cat > /opt/minecraft/run.sh <<"RUN"'; cat "$DIR/run.sh"; echo 'RUN'; echo 'chmod +x /opt/minecraft/run.sh && /opt/minecraft/run.sh'; } > "$UD"
IID=$(aws ec2 run-instances --image-id "$AMI" --instance-type t4g.medium --key-name artisaan-access \
  --security-group-ids "$SG" \
  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=30,VolumeType=gp3}' \
  --user-data "file://$UD" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=minecraft-server},{Key=Project,Value=minecraft-server},{Key=Owner,Value=ignatioon}]' \
  --query 'Instances[0].InstanceId' --output text)
aws ec2 wait instance-running --instance-ids "$IID"
ALLOC=$(aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=Name,Value=minecraft-eip}]' --query AllocationId --output text)
aws ec2 associate-address --instance-id "$IID" --allocation-id "$ALLOC" >/dev/null
echo "Instance: $IID  IP: $(aws ec2 describe-addresses --allocation-ids "$ALLOC" --query 'Addresses[0].PublicIp' --output text)"
