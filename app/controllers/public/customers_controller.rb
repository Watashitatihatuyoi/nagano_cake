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
    redirect_to  customers_my_page_path, notice: "登録情報を更新しました。"
  end

  def confirm_withdraw

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_admission: true)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました。ご利用いただきありがとうございました。"
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end

end





