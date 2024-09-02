# Rancher

## O que é o Rancher?

O Rancher é uma ferramenta opensource que serve para administrar uma infraestrutura de docker. Pelo fato dele ser opensource, é possível contribuir com o código, abrir issues ou até mesmo sugerir novas features no GitHub do projeto.

Utilizo ele em produçāo, na versāo 2.3.2 e falo com tranquilidade que ele é muito confiável para ser utilizado de maneira gratuita, existe uma boa documentaçāo sobre o projeto e também alguns fóruns onde eu geralmente tiro dúvidas.

Principais componentes do Rancher
Administraçāo pela UI (User Interface): Você pode administrar todo o seu ambiente através da interface dele que é muito simples e intuitiva.

## Instalação do Docker

```bash
sudo curl https://releases.rancher.com/install-docker/17.03.sh | sh
```

Adicionar usuário docker no grupo de Administrator
(NÃO fazer em Produção)

```bash
sudo usermod -aG docker administrator
```

## Instalação do Rancher

https://www.rancher.com/quick-start

Para instalar e executar o Rancher, execute o seguinte comando Docker no seu host:

## Instalar sem persistência:

```bash
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/rancher:stable
```

## Instalar com persistência:

```bash
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /opt/rancher:/var/lib/rancher rancher/rancher:stable
```


```bash
$ sudo docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
```

## Para acessar o Rancher, insira o ip do host onde o Rancher está instalado com no seu navegador e você já terá acesso a ele e todas as suas configurações.

## Instalação do Rancher na instância

Imagem `ubuntu` na AWS: ami-04a81a99f5ec58529

```bash
sudo curl https://releases.rancher.com/install-docker/17.03.sh | sh
sudo groupadd docker
sudo usermod -aG docker $USER
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher:stable
```

## Instalação do Docker no Amazon Linux

```bash
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/rancher:stable
```


docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher:stable