class UserService
    class << self
        # function :getAllUsers
        # select all users
        # @return [<Type>] <users>
        def getAllUsers
            @users = UserRepository.getAllUsers
        end
        # function :createUser
        # create user
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def createUser(user)
            @is_user_create = UserRepository.createUser(user)
        end
        # function getUserByID
        # select user by user id
        # @param [<Type>] id <description>
        # @return [<Type>] <user>
        def getUserByID(id)
            @user = UserRepository.getUserByID(id)
        end

        # function :updateUser
        # update user
        # @param [<Type>] user <description>
        # @param [<Type>] user_params <description>
        # @return [<Type>] <description>
        def updateUser(user, user_params)
            @is_user_update = UserRepository.updateUser(user, user_params)
        end
        
       # function :destroyUser
        # delete user
        # @param [<Type>] user <description>
        # @return [<Type>] <description>
        def destroyUser(user)
            UserRepository.destroyUser(user)
        end
    end
end