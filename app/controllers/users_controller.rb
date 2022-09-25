class UsersController < ApplicationController
  before_action :getUser, only: [:showUser, :updateUser, :deleteUser]
  protect_from_forgery with: :null_session
  def getUsers
    @users = User.all
    if @users
      render json: @users, status: :ok
    else
      render json: {msg: "Users is empty"}, status: :unprocessable_entity
    end
  end
  def showUser
    if @user
      render json: @user, status: :ok
    else
      render json:{msg: "User not found"}, status: :unprocessable_entity
    end
  end
  def addUser
    user = User.new(userparams)
    if user.save()
      render json: user, status: :ok
    else
      render json: {msg: "User not added", error: user.errors}, status: :unprocessable_entity
    end
  end
  def updateUser
    if @user
      if @user.update(userparams)
        render json: @user, status: :ok
      else
        render json:{msg: "Updated user failed", error: @user.errors},status: :unprocessable_entity
      end
    else
      render json:{msg: "User not found"},status: :unprocessable_entity
    end
  end
  def deleteUser
    if @user
      if @user.destroy()
        render json:{msg: "Deleted user successfully"},status: :ok
      else
        render json:{msg: "Deleted user failed"},status: :unprocessable_entity
      end
    else
      render json:{msg: "User not found"},status: :unprocessable_entity
    end
  end
  private
  def userparams
    params.permit(:name, :email)
  end
  def getUser
    @user = User.find(params[:id])
  end
end