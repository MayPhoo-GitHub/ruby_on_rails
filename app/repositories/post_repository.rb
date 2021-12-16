require 'logger'
class PostRepository
    class << self

        # function getAllPosts
        # get post
        # @return [<Type>] @posts
        def getAllPosts()
                @posts = Post.all.order("created_at DESC")
        end
    end
end
