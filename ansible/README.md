# run a ansible playbook using tags
ansible-playbook -i hosts site.yml --tags "tag1,tag2"
# run ansible commands
ansible-playbook main.yml -i inventory.ini -e ansible_cfg=./ansible.cfg

# run playbook on a specific host
ansible-playbook main.yml -i inventory.ini --limit HOSTNAME/IP -e ansible_cfg=./ansible.cfg -vv

# reference links:
# https://www.ansible.com/blog/connecting-to-a-windows-host
# https://geekflare.com/connecting-windows-ansible-from-ubuntu/
# https://docs.ansible.com/ansible/latest/collections/ansible/

# prepare ansible for windows

sudo apt-get update
sudo apt-get install gcc python-dev
sudo apt install python3-pip
sudo apt-get install python3-winrm

# download powershell script

invoke-webrequest -uri https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -outfile ConfigureRemotingForAnsible.ps1

# run powershell script

powershell -ExecutionPolicy Bypass -File ConfigureRemotingForAnsible.ps1

# install windows.feature

ansible-galaxy collection install ansible.windows


# desafio

Crear un pipeline de jenkins que ejecute un playbook de ansible que instale un servicio en un servidor linux.

* Hay que levantar stack (jenkins, imagen docker agent, maquina linux).
* Crear un jenkins file que ejecute el playbook de ansible.
* Pueden usar el plugin de ansible de jenkins o ejecutar en anget (docker).

Opcional:

* implementar el dinamyc inventory (https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html)

Resultado:
Luego de ejecutar el pipeline, el servidor destino tiene que tener docker corriendo.

