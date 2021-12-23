class PostsController < ApplicationController
  before_action :authorized?
  
  def index
    @posts = PostService.getAllPosts(current_user).paginate(page: params[:page], per_page: 5)
  end
  # function : show
  # show post
  # param : post_id
  # @return [<Type>] <post>
  def show
    @post = PostService.getPostById(params[:id])
  end
  # function : new
  # show create post
  # @return [<Type>] <post>
  def new
    @post = Post.new
    # logger.info(@post)
  end
  
  # function : create
  # param : post_params
  # create post
  # @return redirect
  def new_post
    params[:post][:created_user_id] ||= current_user.id
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

 # function : edit
  # param : post_id
  # show edit post
  # @return [<Type>] <post>
  def edit
    @post = PostService.getPostById(params[:id])
  end

  # function : update
  # param : post_id, post_params
  # @return [<Type>] redirect
  def update
    @post = PostService.getPostById(params[:id])
    params[:post][:updated_user_id] = current_user.id
    @is_post_update = PostService.updatePost(@post, post_params)
    if @is_post_update
      redirect_to posts_path
    else
      render :edit
    end
  end

  # function : destory
  # delete post
  # param : post_id
  # @return [<Type>] redirect
  def destroy
    @post = PostService.getPostById(params[:id])
    PostService.destroyPost(@post)
    redirect_to posts_path
  end

  # function :search
  # search posts
  # @return [<Type>] <posts>
  def search
    @search_keyword = params[:search_keyword]
    @posts = PostService.search(@search_keyword,current_user).paginate(page: params[:page], per_page: 5)
    @last_search_keyword = @search_keyword
    render :index
  end   

  # function filter
  # filter posts
  # param : filter_by
  # @return [<Type>] <posts>
  def filter
    @user_id = current_user.id
    @posts = PostService.filter(@user_id).paginate(page: params[:page], per_page: 5)
    render :index
  end
  private
  # set post parameters
  # @return [<Type>] <description>
  def post_params
    params.require(:post).permit(:title, :description, :public_flag,:created_user_id, :updated_user_id)
  end
end

