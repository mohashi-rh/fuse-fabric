# fuse-server

# Introdução

Projeto para criação de uma image docker com JBoss Fuse instalado.

O projeto instala a imagem em um CentOS.

# Passos para instalação

1. Fazer o download do pacote Fuse Server do repositório da Red Hat;
2. Copiar para dentro do diretorio do projeto;
3. Executar o build.sh para executar a criação da imagem;
```
$ ./build.sh
```
4. Executar o run da seguinte forma
```
$ docker run -itd --name fuse -p 61616:61616 -p 8181:8181 fuse-server
```