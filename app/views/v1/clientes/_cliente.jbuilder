json.extract! cliente, :id, :nome, :telefone, :observacao, :created_at, :updated_at
json.url v1_cliente_url(cliente, format: :json)
