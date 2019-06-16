class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      # redirect_to controller: 'tasks', action: 'index'
      # redirect_to tasks_path
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def show
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(5)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
