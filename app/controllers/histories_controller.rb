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
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    
    if @history.update(history_params)
      flash[:success] = '職務経歴詳細を変更しました'
      redirect_to mypage_url
    else
      flash.now[:danger] = '職務経歴詳細を変更できませんでした'
      render :edit
    end
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy
    
    flash[:success] = '職務経歴詳細を削除しました'
    redirect_to mypage_url
  end
  
  private
  
  def history_params
    params.require(:history).permit(:began_at, :ended_at, :company, :department, :detail)
  end
end
