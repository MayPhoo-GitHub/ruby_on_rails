class PostsController < ApplicationController
  before_action :authorized?
  def index
    @posts = PostService.getAllPosts
  end
end
