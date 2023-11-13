# Prometheus Service for 2 Servers
This project sets up two AWS **EC2** t.2-micro Servers with Monitoring through **Prometheus** , **Grafana**, **Alertmanager** and **Node_Exporter**.

## How to use:
### Set Up of Credentials
- Replace SSH Key Path in inventory.yml
- Set up your AWS credentials
- Put your local IP in at [terraform_ec2/modules/ec2/variables.tf](./terraform_ec2/modules/ec2/variables.tf) 

### Download this folder
### Initialize and deploy through Terraform
### Run Ansible-Playbook
### Set Up Visualisation
- the public IP of the prometheus monitoring server will be printed out to [./terraform_ec2/ip_0](./terraform_ec2/ip_0)
- access grafana with the public IP of the server on port 3000
```bash
http://#{prometheus_ip}:3000
```
