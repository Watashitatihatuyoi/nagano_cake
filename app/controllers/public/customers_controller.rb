class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    flash[:update] = "登録情報を更新しました。"
    redirect_to  customers_my_page_path
  end

  def confirm_withdraw

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_admission: true)
    reset_session
    flash[:destroy] = "退会処理が完了しました。ご利用いただきありがとうございました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end

end





