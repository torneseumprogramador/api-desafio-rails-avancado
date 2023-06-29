module V2
  class ClientesController < ApplicationController
    before_action :set_cliente, only: %i[ show update destroy ]

    # GET /clientes
    # GET /clientes.json
    def index
      page = params[:pagina].to_i
      page = 1 if page < 1

      limit = 10
      offset = (page - 1) * limit

      @clientes = Cliente.all.offset(offset).limit(limit)
    end

    # GET /clientes/1
    # GET /clientes/1.json
    def show
    end

    # POST /clientes
    # POST /clientes.json
    def create
      @cliente = Cliente.new(cliente_params)

      if @cliente.save
        render :show, status: :created, location: @cliente
      else
        render json: @cliente.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /clientes/1
    # PATCH/PUT /clientes/1.json
    def update
      if @cliente.update(cliente_params)
        render :show, status: :ok, location: @cliente
      else
        render json: @cliente.errors, status: :unprocessable_entity
      end
    end

    # DELETE /clientes/1
    # DELETE /clientes/1.json
    def destroy
      @cliente.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cliente
        @cliente = Cliente.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def cliente_params
        params.require(:cliente).permit(:nome, :telefone, :observacao)
      end
  end
end
