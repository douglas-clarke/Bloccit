class PostsController < ApplicationController
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
     @post = Post.new
       authorize @post
  end

  def create
     @post = Post.new(post_params)
     authorize @post     
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
     @post = Post.find(params[:id])
     authorize post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end 

end
