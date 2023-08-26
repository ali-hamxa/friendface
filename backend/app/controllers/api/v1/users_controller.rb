class Api::V1::UsersController < Api::V1::ApiController
  def index
    users = User.all

    render json: users.to_json
  end
end
