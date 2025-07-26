.PHONY: help setup up down build logs test artisan

help:
	@echo "Comandos disponíveis:"
	@echo "  make setup         - 🚀 Executa a configuração inicial completa do projeto."
	@echo "  make up            - Sobe os contêineres Docker em background."
	@echo "  make down          - Para todos os contêineres."
	@echo "  make build         - Constrói ou reconstrói as imagens e sobe os contêineres."
	@echo "  make logs          - Exibe os logs de todos os serviços."
	@echo "  make test          - Executa os testes do PHPUnit no backend."
	@echo "  make artisan cmd=\"\"    - Executa um comando artisan. Ex: make artisan cmd=\"migrate:fresh --seed\""

setup: build ## Executa a configuração inicial completa do projeto
	@echo "-> Instalando dependências do Composer..."
	@docker compose exec backend composer install
	@echo "-> Gerando chave da aplicação Laravel..."
	@docker compose exec backend php artisan key:generate
	@echo "-> Limpando caches do Laravel..."
	@docker compose exec backend php artisan optimize:clear
	@echo "-> Rodando as migrations do banco de dados..."
	@docker compose exec backend php artisan migrate
	@echo "-> Gerando documentação do Swagger..."
	@docker compose exec backend php artisan l5-swagger:generate
	@echo "-> Ajustando permissões das pastas..."
	@docker compose exec backend chmod -R 777 storage bootstrap/cache
	@echo "\n✅ Projeto configurado com sucesso! Ambiente pronto para uso. ✅\n"

up: ## Sobe os contêineres Docker em background
	@docker compose up -d

down: ## Para todos os contêineres
	@docker compose down

build: ## Constrói ou reconstrói as imagens e sobe os contêineres
	@docker compose up -d --build

logs: ## Exibe os logs de todos os serviços
	@docker compose logs -f

test: ## Executa os testes do PHPUnit no backend
	@echo "-> Executando testes do PHPUnit..."
	@docker compose exec backend ./vendor/bin/phpunit

artisan: ## Executa um comando artisan
	@echo "-> Executando: php artisan $(cmd)"
	@docker compose exec backend php artisan $(cmd)