class AuthenticationController < ApplicationController
  before_action :authenticate_request

  private

  def authenticate_request
    auth_header = request.headers['Authorization']

    if auth_header && auth_header.start_with?('Bearer ')
      token = auth_header.split(' ')[1]
      
      decoded_token = TokenServico.decode(token)
      if decoded_token.blank?
        return render json: { error: 'Acesso negado' }, status: 401
      end
    else
      render json: { error: 'Acesso negado' }, status: 401
    end
  end
end
