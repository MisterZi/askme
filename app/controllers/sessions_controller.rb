class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'вы успешно залогинились'
    else
      flash.new.alert = 'Неправильный мэйл или пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Вы разлогинились! Приходите еще!'
  end
end
