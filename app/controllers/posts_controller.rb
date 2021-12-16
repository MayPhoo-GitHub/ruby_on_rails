class PostsController < ApplicationController

  def index
    @posts = PostService.getAllPosts
  end
end
