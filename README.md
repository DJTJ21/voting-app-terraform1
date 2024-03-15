# voting-app-terraform1

Deploiement de la Voting-App avec terraform.

## Installation

### Prérequis
- kubernetes
- terraform

### Étapes d'installation
1. Clonez ce dépôt : `git clone https://github.com/DJTJ21/voting-app-terraform1.git
2. Accédez au répertoire du projet : `cd voting-app-terraform1`
3. Obtenez les informations de votre cluster: ` kubectl cluster-info `
4. Allez dans le fichier terraform.tfvars et remplacez les information de connexion au cluster par les votres
5. Initialiser le repertoire de configuration terraform : `terraform init`
6. Générer et afficher un plan d'exécution: ` terraform plan`
7. appliquer tout : `terraform apply`
## Visualisation

Pour voir le resultat faite un ` kubectl get all`
