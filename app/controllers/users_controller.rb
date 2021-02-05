class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :editoutline, :update, :destroy]
  
  def show
    @user = current_user
    @histories = @user.histories.order(began_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーサーを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
  end
  
  def editoutline
  end

  def update
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
