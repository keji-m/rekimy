class HistoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @history = History.new
  end

  def create
    @history = current_user.histories.build(history_params)
    
    if @history.save
      flash[:success] = '職務経歴詳細を追加しました'
      redirect_to mypage_url
    else
      flash.now[:danger] = '職務経歴詳細を追加できませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def history_params
    params.require(:history).permit(:began_at, :ended_at, :company, :department, :detail)
  end
end
