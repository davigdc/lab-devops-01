# lab-devops-01

## 💡 Ideia
A ideia desse laboratório é disponibilizar um blog wordpress com mysql em docker, em uma instância EC2 na AWS utilizando ferramentas IaC, como terraform e ansible, sendo objetivo também o mínimo processo manual do usuário durante o provisionamento.

---

### 🛠️ Construído com
* Terraform
* Ansible
* Docker
* AWS
* Script Bash

---

### 📋 Pré-requisitos

- AWS CLI instalado e configurado
- Terraform CLI
- Ansible CLI
- Chave de acesso a instância EC2 na região utilizada e arquivo .pem no diretório de execução (Necessário atualizar o nome em alguns arquivos)

---

### 🚀 Processo

1. Após a configuração das ferramentas solicitadas, iniciamos com o comando ```terraform apply``` no diretório raiz do projeto. Confirme caso solicite a criação de um recurso EC2.

2. Após o terraform criar a infraestrutura, ele chamará localmente (local-exec) o ansible para instalar o docker e suas dependencias no EC2 provisionado.

3. Após instalar o docker, ele irá transferir (file) um script bash de configuração do swarm e o arquivo do compose com os detalhes do container.

4. Após a transferência, será executado o script bash, que irá subir o mysql e wordpress.

5. Dentro poucos minutos desde o comando (terraform apply) o wordpress já estará disponível para acesso pela internet!

---

### 🤔 Algumas considerações do laboratório
Meu principal objetivo com este projeto/laboratório, foi sair do zero com essas ferramentas e começar a utilizar o git e github. Estou iniciando meus estudos para atuar como devops, acredito que tenha formas mais eficientes e seguras de se fazer este processo, mas tenha em mente que foi feito por um estudante com muita vontade de aprender e fazer 😜

---

### Referências:
- Terraform

https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code?in=terraform/aws-get-started
https://hands-on.cloud/terraform-managing-aws-vpc-creating-public-subnet/
https://thecloudbootcamp.com/pt/blog/aws/criando-uma-instancia-ec2-utilizando-o-terraform/
https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
https://www.terraform.io/language/resources

- AWS

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

- Ansible

https://ansible-tips-and-tricks.readthedocs.io/en/latest/ansible/commands/
https://www.the-digital-life.com/deploy-docker-with-ansible/
https://stackoverflow.com/questions/17188147/how-to-run-ansible-without-specifying-the-inventory-but-the-host-directly

- Docker

https://hub.docker.com/_/wordpress
https://livro.descomplicandodocker.com.br/
