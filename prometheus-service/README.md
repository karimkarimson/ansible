# Prometheus Service for 2 Servers
This project sets up two AWS **EC2** t.2-micro Servers with **Prometheus** and **Node_Exporter**.
On the *prometheus* server, grafana will be installed along to visualize the data

## How to use:
### Set Up of Credentials
- Replace SSH Key Path in inventory.yml
- Set up your AWS credentials

### Use the scripts
- access this directory
    `cd #{path to the prometheus-service directory}`
- deploy infrastructre with terraform:
    ```bash
    terraform init
    terraform plan --out tfplan.out
    terraform apply tfplan.out
    ```
- run ansible playbook:
    ```bash
    ansible-playbook -i inventory.yml playbook.yml
    ```

### Set Up Visualisation
- the public IP of the prometheus server will be printed out to [prometheus_ip](./prometheus_ip)
- access grafana with the public IP of the prometheus server on port 3000
```bash
http://#{prometheus_ip}:3000
```