module V2
  class AdministradoresController < ApplicationController
    def login
      begin
        adm, token = LoginServico.login(params[:email], params[:senha])
        render json: { 
          adm: {
            id: adm.id,
            nome: adm.nome,
            email: adm.email,
          },
          token: token
        }, status: 200
      rescue LoginError => erro
        render json: { erro: erro.message }, status: 401
        # render json: { erro: "Login ou senha inválido" }, status: 401
      rescue Exception => erro
        render json: { erro: erro.message }, status: 400
      end
    end
  end
end
