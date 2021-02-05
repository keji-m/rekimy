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
    @user = current_user
  end
  
  def editoutline
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'アカウントを設定しました'
      redirect_to mypage_url
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :edit
    end
    
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
