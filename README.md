# Carrinho de Compras API

Este projeto é uma API de carrinho de compras desenvolvida com **Ruby on Rails**

---

## Funcionalidades

- Adicionar produtos ao carrinho
- Atualizar a quantidade de produtos
- Remover produtos
- Listar produtos do carrinho
- Cálculo de preço total automático

---

## Estrutura do Projeto

### Controllers

- `CartsController`: expõe endpoints REST para manipular o carrinho de compras (`list_products`, `add_product`, `update_quantity`, `remove_product`).
- Toda a lógica de negócio foi delegada para services, mantendo o controller enxuto.

### Models

- `Cart`: representa o carrinho em si.
- `Product`: representa os produtos disponíveis.
- `CartItem`: representa a associação entre um produto e um carrinho, com quantidade e preço unitário.

### Services

Organizam regras de negócio de forma coesa:

- `AddProductToCartService`: adiciona ou atualiza um produto no carrinho.
- `UpdateCartItemQuantityService`: atualiza a quantidade de um item no carrinho.
- `RemoveProductFromCartService`: remove um produto do carrinho.

### Serializers

- `CartSerializer`: encapsula a resposta JSON do carrinho, formatando produtos e o `total_price`.

## Job de Carrinhos Abandonados (`MarkCartAsAbandonedJob`)

Este job automatiza o gerenciamento de carrinhos abandonados na aplicação.

### O que ele faz?

O `MarkCartAsAbandonedJob` executa duas tarefas principais:

1. **Marca carrinhos como abandonados**  
   Se um carrinho **não tiver sido atualizado nas últimas 3 horas**, ele será marcado como abandonado (`abandoned_at`).

2. **Remove carrinhos abandonados há mais de 7 dias**  
   Para evitar acúmulo no banco de dados, carrinhos que já estão marcados como abandonados **há mais de 7 dias** são removidos automaticamente.

### Execução automática com Sidekiq Scheduler

O job é executado automaticamente **de hora em hora**, graças à integração com a gem [`sidekiq-scheduler`](https://github.com/sidekiq-scheduler/sidekiq-scheduler).

**Agendamento configurado em `config/sidekiq.yml`:**

```yaml
:schedule:
  mark_cart_as_abandoned_job:
    cron: "0 * * * *" # roda de hora em hora
    class: "MarkCartAsAbandonedJob"
    queue: default
```

### Configuração do Sidekiq

Em `config/initializers/sidekiq.rb`:

```ruby
require 'sidekiq/scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq::Scheduler.reload_schedule!
  end
end
```

### Execução manual (opcional)

Você também pode executar o job manualmente pelo console Rails:

```ruby
MarkCartAsAbandonedJob.perform_now
```

Ou enfileirar com Sidekiq:

```ruby
MarkCartAsAbandonedJob.perform_async
```

## Endpoints

| Verbo HTTP | Rota                 | Ação                                 |
|------------|----------------------|--------------------------------------|
| GET        | `/cart/list_products` | Lista produtos no carrinho           |
| POST       | `/cart/add_product`   | Adiciona produto ao carrinho         |
| PATCH      | `/cart/update_quantity` | Atualiza a quantidade de um item    |
| DELETE     | `/cart/remove_product` | Remove um produto do carrinho       |

---

## Testes

Foram utilizados `RSpec` e `FactoryBot`.

### Factories

- `product`, `cart`, `cart_item`: usados para gerar dados consistentes nos testes.

### Exemplos de testes cobertos

- Comportamento do carrinho em todos os endpoints
- Validação de serviços isolados
- Models
- Routes
- Job

Para rodar os testes:

```bash
bundle exec rspec
```

---

## Rodando o Projeto Localmente

1. Instale as dependências:

```bash
bundle install
```

2. Configure o banco:

```bash
rails db:create db:migrate db:seed
```

3. Executar o sidekiq:
```bash
bundle exec sidekiq
```

4. Inicie o servidor:

```bash
rails server
```

A aplicação estará disponível em [http://localhost:3000](http://localhost:3000).

Criei uma collection no postman para testar os endpoints: 

https://universal-sunset-274257.postman.co/workspace/cart-api~525f421c-53d2-4059-a08d-cb976536373e/collection/19576839-3f579059-c668-4b11-a4e4-18c2943d3478?action=share&creator=19576839

---

## Considerações

Este projeto foi estruturado com foco em:

- Clareza e leitura de código
- Separação de responsabilidades via serviços
- Testabilidade de todas as camadas
- Facilitação de manutenção e evolução futura

---

## Requisitos

- Ruby 3.3.x
- Rails 7.x
- PostgreSQL
- Sidekiq + sidekiq-scheduler
- Redis
