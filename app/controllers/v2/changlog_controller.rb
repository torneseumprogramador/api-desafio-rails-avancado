module V2
  class ChanglogController < ApplicationController
    def index
      render json: {
        changelog: [
          "29/06/2023 - Criando rotas para v2",
          "29/06/2023 - Adaptando novo contrato de clientes para v2",
          "29/06/2023 - Foi removido no endpoint de clientes o updated_at, created_at e url"
        ]
      }
    end
  end
end