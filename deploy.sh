#!/bin/bash
echo "Iniciando deploy para Oracle Cloud..."

# Configura a chave SSH
mkdir -p ~/.ssh
echo "$DEPLOY_KEY" > ~/.ssh/deploy_key
chmod 600 ~/.ssh/deploy_key

# Adiciona o host como conhecido
ssh-keyscan -H 137.131.130.119 >> ~/.ssh/known_hosts

# Envia os arquivos para o Oracle
rsync -avz --delete \
  -e "ssh -i ~/.ssh/deploy_key -o StrictHostKeyChecking=no" \
  public/ \
  ubuntu@137.131.130.119:/var/www/ospechincheiros/

echo "Deploy concluído!"