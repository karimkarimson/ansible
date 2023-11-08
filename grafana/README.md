# Remote Grafana Install & SetUp

## How to use:
- deploy infrastructre with terraform:
    ```bash
    cd #{path to this directory}
    terraform init
    terraform plan --out tfplan.out
    terraform apply tfplan.out
    ```
- run ansible playbook:
    ```bash
    ansible-playbook -i inventory.yml playbook.yml
    ```