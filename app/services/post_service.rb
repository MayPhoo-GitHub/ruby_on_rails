class PostService
    class << self

        # function getAllPosts
        # get posts
        # @return @posts
        def getAllPosts()
            @posts = PostRepository.getAllPosts
        end
        # function getPostById
        # @param [<int>] id 
        # @return [<Type>] post
        def getPostById(id)
            @post = PostRepository.getPostById(id)
        end
        
        # function create post
        # @param [<Type>] post <description>
        # @return [<Type>] is_save_post
        def createPost(post)
            @is_save_post = PostRepository.createPost(post)
        end
    end
end
