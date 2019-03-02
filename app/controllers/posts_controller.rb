class PostsController < ApplicationController  
  def create
    @post = Post.create(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    render 'edit' if current_user != post.user
    if post.update(post_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.(:post).permit(:text, :event_id).merge(user_id: current_user.id)
  end

end
