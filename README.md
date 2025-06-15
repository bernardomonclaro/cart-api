# Carrinho de Compras API

API RESTful para simular o funcionamento de um carrinho de compras em um sistema de e-commerce.  
Permite criar carrinhos, adicionar/remover produtos, visualizar itens e controlar carrinhos inativos de forma automatizada.

---

## Funcionalidades

- Criar um carrinho de compras
- Adicionar produtos ao carrinho
- Atualizar quantidade de produtos
- Remover produtos do carrinho
- Visualizar o conteúdo do carrinho
- Job automático (Sidekiq) para:
  - Marcar como *abandonado* carrinhos inativos por 3h
  - Excluir carrinhos abandonados por mais de 7 dias

---

## Tecnologias e Dependências

- **Ruby** 3.3.1  
- **Rails** 7.1.3.2  
- **PostgreSQL** 16  
- **Redis** 7.0.15  

### Gems Principais

| Gem                  | Função                                                                 |
|----------------------|------------------------------------------------------------------------|
| `active_model_serializers` | Serialização de objetos para respostas JSON                      |
| `factory_bot_rails`        | Geração de dados para testes                                     |
| `shoulda-matchers`         | Matchers para testes de validações e associações                |
| `byebug`                   | Depuração de código                                              |
| `rubocop`                  | Análise estática de código para garantir boas práticas          |

---

## Collection de Testes de API

O arquivo `cart_api.json` (incluso no projeto) pode ser importado no **Postman** para testar todos os endpoints da aplicação.

---

## Executando com Docker

### Build do ambiente:

```bash
docker-compose build
```

### Subir os containers:

```bash
docker-compose up
```

### Rodar Rubocop (lint):

```bash
docker-compose run web bundle exec rubocop
```

### Rodar os testes:

```bash
docker-compose run test
```

---

## Executando localmente (sem Docker)

> Certifique-se de ter o Ruby, PostgreSQL e Redis instalados.

### Instalar dependências:

```bash
bundle install
```

### Executar o Sidekiq:

```bash
bundle exec sidekiq
```

### Iniciar o servidor:

```bash
bundle exec rails server
```

### Rodar os testes:

```bash
bundle exec rspec
```

### Executar análise de código:

```bash
bundle exec rubocop
```

## Limpeza automática de carrinhos

Usando **Sidekiq + Sidekiq-Scheduler**, o sistema executa periodicamente:

- A cada 1 hora:
  - Marca carrinhos como **abandonados** após 3 horas sem interação
  - Remove carrinhos **abandonados há mais de 7 dias**

Mantém o banco limpo e organizado sem intervenção manual.

---

## Autor

Desenvolvido por **Bernardo Monclaro**  
📫 [LinkedIn](https://www.linkedin.com/in/bernardomonclaro) • ✉️ bernardomonclaro@gmail.com