class PostsController < ApplicationController
  before_action :authorized?
  
  def index
    @posts = PostService.getAllPosts
  end
  # function : show
  # show post
  # param : post_id
  # @return [<Type>] <post>
  def show
    @post = PostService.getPostById(params[:id])
  end
  # function : create
  # param : post_params
  # create post
  # @return redirect
  def new_post
    params[:post][:created_user_id] ||= current_user.id
    @post = Post.new(post_params)
    @is_save_post = PostService.createPost(@post)
    if @is_save_post
      redirect_to posts_path
    else
      render :new
    end
  end

end
