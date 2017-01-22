class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # redirect_to action necessary to prevent rails from automatically attempting a redirect to a create template
      # redirect_to @post redirects to the post show page
      redirect_to @post, notice: "Your post was created successfully"
    else
      render :new
    end
  end

  def show
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
