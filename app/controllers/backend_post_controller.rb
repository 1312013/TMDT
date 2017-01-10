class BackendPostController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to '/backend_post', :notice => "Đã hủy bài đăng"
  end
end
