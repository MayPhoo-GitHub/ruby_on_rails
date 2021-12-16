class UserRepository
    class << self
        # function getAllUsers
        # get all users
        # @return [<Type>] <users>
        def getAllUsers
            @users = User.all.order("id ASC")
        end
        
        # function :createUser
        # create user
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def createUser(user)
            @is_user_create = user.save
        end


        # function :getUserByID
        # select user by user_id
        # @param [<Type>] id <description>
        # @return [<Type>] <user>
        def getUserByID(id)
            @user = User.find(id)
        end

        # function :updateUser
        # update user
        # @param [<Type>] user <description>
        # @param [<Type>] user_params <description>
        # @return [<Type>] <description>
        def updateUser(user, user_params)
            @is_update_user = user.update(user_params)
        end
        
        # function :destroyUser
        # delete User
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def destroyUser(user)
            user.destroy
        end
    end
end