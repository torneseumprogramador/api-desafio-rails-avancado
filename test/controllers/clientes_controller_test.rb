require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get v1_clientes_url, as: :json
    assert_response :success
  end

  test "should create cliente" do
    assert_difference("Cliente.count") do
      post v1_clientes_url, params: { cliente: { nome: @cliente.nome, observacao: @cliente.observacao, telefone: @cliente.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show cliente" do
    get v1_cliente_url(@cliente), as: :json
    assert_response :success
  end

  test "should update cliente" do
    patch v1_cliente_url(@cliente), params: { cliente: { nome: @cliente.nome, observacao: @cliente.observacao, telefone: @cliente.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy cliente" do
    assert_difference("Cliente.count", -1) do
      delete v1_cliente_url(@cliente), as: :json
    end

    assert_response :no_content
  end
end
