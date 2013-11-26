class PostsController < ApplicationController

  def index
    @posts = Post.order("name").page(params[:page]).per(5)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]

    if @post.save
      redirect_to posts_url, notice: "Post created successfully."
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.content = params[:content]

    if @post.save
      redirect_to posts_url, notice: "Post updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    redirect_to posts_url, notice: "Post deleted."
  end
end
