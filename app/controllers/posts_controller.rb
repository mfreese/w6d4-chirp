class PostsController < ApplicationController
before_action :required_user, only:[:create]

def index
if current_user
  @post = Post.timeline(current_user)
else
  @post = Post.all
end
render json: @post
end


def create
  if current_user
    @current_user.posts << Post.create(post_params)
    render json: @current_user.posts.last
  else
     render json: @post.errors.full_messages, status: :unprocessable_entity
   end
  # post_params[:user] = current_user
  # @post = Post.new(post_params)
  #   if @post.save
  #     render json: @post
  #   else
  #     render json: @post.errors.full_messages, status: :unprocessable_entity
  #   end

end

def show
  @post = Post.find params[:id]
  render json: @post
end




private

def post_params
  params.permit(:chirp, :name, :avatar)

end
end
