class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      flash[:errors] = @errors
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      flash[:errors] = @errors
      redirect_to edit_user_path
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio)
  end

end
