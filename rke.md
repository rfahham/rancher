# RKE (Rancher na linha de comando)

RKE1 - Homologação
RKE2 - PRODUÇÃO (Segurança)

Instalação

https://rke.docs.rancher.com/

Steps

- Criar uma instância para o Control Plane e outra para o Worker
- Instalar o docker
- Configurar o RKE
- Rodar o RKE

Configuração

```bash
rke config
```

Vai criar o arquivo cluster.yml

- cluster.yml (Arquivo com a configuração para criação do cluster)

Criar o Cluster

```bash
rke up --ssh-agent-auth
```

Irá criar os arquivos

- cluster.rkestate (estado atual do cluster)
- kube_config_cluster.yml (arquivo de configuração para colocar no kubectl)

Copiar o arquivo de configuração para a pasta padrão de configuração do cluster ~/.kube/config

```bash
cp kube_config_cluster.yml ~/.kube/config
```

Verificar os nodes

```bash
kubectl get nodes -o wide
```

Próximo passo... [deploy do projeto](deployment.md)

## Criando mais 2 workers

Criar mais duas instâncias

Instalar o docker

Alterar o arquivo de configuração

- 1 Control Plane
    - com o IP de uma instância
    - Deixar o controlplane e o etcd
    - Remover o worker
- 2 worker
    - com o IP de uma instância
    - Deixar o worker
    - Remover, controlplane e etcd
    - Nomear, worker1 e worker2

Executar o arquivo de configuração do cluster novamente

```bash
rke up --ssh-agent-auth
```

A aplicação não cairá !!!


Backup do etcd (snapshot)

```bash
rke etcd snapshot-save --config cluster.yml --name snapshot-001 --ssh-agent-auth
```

O arquivo será enviado para a instância do Controlplane

```bash
ls /opt/rke/etcd-snapshots

snapshot-001.zip
```

Copiar o arquivo da instância para local

```bash
scp <usuario>@<servidor>:/opt/rke/etcd-snapshots/snapshot-001.zip ./snapshot-001.zip
```

No caso de desastre: Destruir as instâncias

Recriar atraves do `snapshot-001.zip`

Criar as instâncias

Instalar o Docker nelas

Alterar os ips das instâncias no arquivo de config do cluster

Remover qualquer info no Cluster

```bash
rke remove --ssh-agent-auth
```

Criar o Cluster

```bash
rke up --ssh-agent-auth
```

Copiar o arquivo `snapshot-001.zip` para o controlplane

```bash
scp ./snapshot-001.zip <usuario>@<servidor>:/opt/rke/etcd-snapshots/snapshot-001.zip 
```

Restaurar o backup do etcd

```bash
rke etcd snapshot-restore --config cluster.yml --name snapshot-001 --ssh-agent-auth
```

Copiar o arquivo de configuração para a pasta padrão de configuração do cluster ~/.kube/config

```bash
cp kube_config_cluster.yml ~/.kube/config
```

## Certificados / Unidades Certificadores

Verificar a data dos certificados

```bash
kubectl config view --raw -o jsonpath="{.clusters[?(@.name == '')].cluster.certificate-authority-data}" | base64 -d | openssl x509 -text | grep -A2 Validity
```
Verificar a data de validade do certificado do servidor de API

```bash
curl https://{apiserver-fqdn} -k -v 2>&1 | grep expire
```

Atualizando o certificado

```bash
rke cert rotate --config cluster.yaml --ssh-agent-auth 
```

Atualizando o CA
```bash
rke cert rotate --config cluster.yaml --ssh-agent-auth --rotate--ca 
```

Vai dar erro 509, tem que atualizar o kube/config

```bash
cp kube_config_cluster.yml ~/.kube/config
```
