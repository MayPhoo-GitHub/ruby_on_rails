class PostService
    class << self

        # function getAllPosts
        # get posts
        # @return @posts
        def getAllPosts()
            @posts = PostRepository.getAllPosts
        end
    end
end
