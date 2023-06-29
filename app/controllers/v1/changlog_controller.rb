module V1
  class ChanglogController < ApplicationController
    def index
      render json: {
        changelog: [
          "29/06/2023 - Criando rotas para v1",
          "29/06/2023 - Corrigindo rotas de resource /v1/clientes"
        ]
      }
    end
  end
end