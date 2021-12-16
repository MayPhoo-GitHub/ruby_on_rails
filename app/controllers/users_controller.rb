class UsersController < ApplicationController
  def index
    @users = UserService.getAllUsers
  end
  
  # function : new
  # show user create
  # @return [<Type>] <description>
  def new
    @user = User.new
  end
  
  # function : new_user
  # create user
  # @return [<Type>] <user>
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_back(fallback_location: '/users')
    else
      render :new
    end
  end

  # function :show
  # show user detail
  # @return [<Type>] <user>
  #
  def show
    @user = UserService.getUserByID(params[:id])
  end
  
  private
  # set user parameters
  # @return [<Type>] <description>
  def user_params
    params.require(:user).permit(:id, :name, :email, :password,:password_confirmation,
    :phone, :address, :birthday, :super_user_flag)
  end

  
  # function :edit
  # show edit user
  # @return [<Type>] <edit user>
  #
  def edit
    add_breadcrumb "User Detail", :user_path
    add_breadcrumb "Edit User", :edit_user_path
    @user = UserService.getUserByID(params[:id])
  end

  #
  # function :update
  # update user
  # @return [<Type>] <redirect>
  #
  def update
    @user = UserService.getUserByID(params[:id])
    @is_user_update = UserService.updateUser(@user, user_params)
    if @is_user_update
      redirect_to @user
    else
      render :edit
    end
  end

  #
  # function destroy
  #
  # @return [<Type>] <description>
  #
  def destroy
    @user = UserService.getUserByID(params[:id])
    UserService.destroyUser(@user)
  end
end
