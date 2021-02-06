class CertificatesController < ApplicationController
  before_action :require_user_logged_in

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = current_user.certificates.build(certificate_params)
    
    if @certificate.save
      flash[:success] = '資格・免許を追加しました'
      redirect_to mypage_certificates_url
    else
      flash.now[:danger] = '資格・免許を追加できませんでした'
      render :new
    end
  end
  
  def show
    @user = current_user
    @certificates = @user.certificates.order(date: :desc)
  end

  def edit
    @certificate = Certificate.find(params[:id])
  end

  def update
    @certificate = Certificate.find(params[:id])
    
    if @certificate.update(certificate_params)
      flash[:success] = '資格・免許を変更しました'
      redirect_to mypage_certificates_url
    else
      flash.now[:danger] = '資格・免許を変更できませんでした'
      render :edit
    end
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    
    flash[:success] = '資格・免許を削除しました'
    redirect_to mypage_certificates_url
  end
  
  private
  
  def certificate_params
    params.require(:certificate).permit(:name, :date)
  end
end
