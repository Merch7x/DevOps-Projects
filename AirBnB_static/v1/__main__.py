"""An AWS Python Pulumi program"""

import pulumi
from pulumi_aws import s3, ec2
import pulumi_tls as tls

# Create an AWS resource (S3 Bucket)
bucket = s3.Bucket('my-bucket')

# Export the name of the bucket
pulumi.export('bucket_name', bucket.id)

ssh_key = tls.PrivateKey(
    "generated",
    algorithm="RSA",
    rsa_bits=4096,
)
key_pair = ec2.KeyPair(
    "airbnb-web-key",
    key_name="airbnb-web-key",
    public_key=ssh_key.public_key_openssh,
    opts=pulumi.ResourceOptions(parent=ssh_key),
)

sg = ec2.SecurityGroup(
    'airbnb-web-sg', description="security group for the web-servers")

allow_ssh = ec2.SecurityGroupRule(
    "AllowSSH",
    type="ingress",
    from_port=22,
    to_port=22,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"],
    security_group_id=sg.id
)

allow_http = ec2.SecurityGroupRule(
    "AllowHTTP",
    type="ingress",
    from_port=80,
    to_port=80,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"],
    security_group_id=sg.id
)

allow_http2 = ec2.SecurityGroupRule(
    "Allowhttp2",
    type="ingress",
    from_port=8080,
    to_port=8080,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"],
    security_group_id=sg.id
)

allow_SSL = ec2.SecurityGroupRule(
    "AllowSSL",
    type="ingress",
    from_port=443,
    to_port=443,
    protocol="tcp",
    cidr_blocks=["0.0.0.0/0"],
    security_group_id=sg.id
)

for i in range(0, 2):
    server = ec2.Instance(
        'web-server-{}'.format(i),
        ami="ami-0b9932f4918a00c4f",
        instance_type="t2.micro",
        key_name="airbnb-web-key",
        vpc_security_group_ids=[sg.id],
        tags={
            "Name": "web"
        }
    )
    pulumi.export('public_ip_{}'.format(i), server.public_ip)

pulumi.export('private_key_pem', ssh_key.private_key_pem)
