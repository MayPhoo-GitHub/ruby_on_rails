require 'logger'
class PostRepository
    class << self

        # function getAllPosts
        # get post
        # @return [<Type>] @posts
        def getAllPosts()
                @posts = Post.all.order("created_at DESC")
        end
        # function getPostById
        # @param [<int>] id <postID>
        # @return [<Type>] <post>
        def getPostById(id)
            @post = Post.find(id)
        end

        # function createPost
        # @param [<Type>] post <description>
        # @return [<Type>] <is_save_post>
        def createPost(post)
            @is_save_post = post.save
        end
    end
end
