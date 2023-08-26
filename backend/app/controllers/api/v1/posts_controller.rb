class Api::V1::PostsController < Api::V1::ApiController
  def index
    posts = Post.all
    render json: posts
  end
end
