# Remote Grafana Install & SetUp

## How to use:
- access this directory
    `cd #{path to the grafana directory}`
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