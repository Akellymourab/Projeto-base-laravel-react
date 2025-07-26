# Projeto-Base: API Laravel (MongoDB) com Frontend React

Este é um projeto-base conteinerizado com Docker, projetado para acelerar o início do desenvolvimento de aplicações modernas. Ele une um backend robusto em Laravel, focado em ser uma API pura, com um frontend dinâmico em React, servido por um proxy reverso Nginx.

O objetivo principal é fornecer um ambiente de desenvolvimento completo, padronizado e de fácil configuração, eliminando a necessidade de instalar PHP, Node, Nginx ou MongoDB localmente. Basta ter o Docker.

---

## Tecnologias Utilizadas

| Tecnologia         | Função                                                        |
|--------------------|--------------------------------------------------------------|
| Docker & Docker Compose | Orquestração de todo o ambiente em contêineres isolados.    |
| Nginx              | Servidor web e proxy reverso. Direciona o tráfego para o React ou para a API Laravel. |
| Laravel            | Backend configurado como uma API pura para fornecer e receber dados. |
| PHPUnit            | Framework de testes para garantir a qualidade e o funcionamento da API. |
| React              | Frontend para a criação da interface do usuário (SPA - Single Page Application). |
| MongoDB            | Banco de dados NoSQL para a persistência dos dados da aplicação. |
| Swagger (OpenAPI)  | Documentação interativa e automática para os endpoints da API. |
| Makefile           | Automação de comandos para setup, execução e manutenção do projeto. |

---

## Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados na sua máquina:

- Docker  
- Docker Compose (geralmente já vem com o Docker Desktop)  
- make (geralmente já vem instalado em sistemas Linux e macOS)  

---

## Como Executar o Projeto

Com o Makefile, a configuração do ambiente é feita com um único comando.

### 1. Clone o Repositório

```bash
git clone https://github.com/Akellymourab/Projeto-base-laravel-react.git
cd projeto-base
````

### 2. Crie o Arquivo de Ambiente do Laravel

Este é o único passo manual obrigatório. Crie o arquivo `backend/.env` e cole o conteúdo presente no arquivo `backend/.env.example` . O Makefile precisa deste arquivo para funcionar.


### 3. Execute o Comando de Setup

Este comando mágico fará todo o resto: subir os contêineres, instalar dependências, gerar chaves, rodar migrations e ajustar permissões.

```bash
make setup
```

Aguarde o processo terminar. Ao final, seu ambiente estará 100% funcional.

Pronto! O ambiente está no ar.

---

## Endpoints Disponíveis

* Aplicação React: [http://localhost:8080](http://localhost:8080)
* Documentação da API: [http://localhost:8080/api/documentation](http://localhost:8080/api/documentation)
* Exemplo de Rota da API: [http://localhost:8080/api/hello](http://localhost:8080/api/hello)

---

## Comandos Úteis (Makefile)

Use o comando `make help` para ver a lista completa de atalhos disponíveis.

* Subir os contêineres:

```bash
make up
```

* Parar todos os contêineres:

```bash
make down
```

* Reconstruir e subir os contêineres:

```bash
make build
```

* Executar os testes (PHPUnit):

```bash
make test
```

* Executar um comando Artisan específico:

```bash
make artisan cmd="migrate:fresh --seed"
```

* Acompanhar os logs de todos os serviços:

```bash
make logs
```

