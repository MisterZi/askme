# Контроллер, управляющий сессиями
# 1. Показывает страницу логина
# 2. Создает новую сессию (логин)
# 3. Позволяет разлогиниваться (удаляет сессию)
#
class SessionsController < ApplicationController

  # пустой экшен, только показывает свой шаблон
  def new
  end

  # создает в объекте session новый факт залогиненности пользователя
  # если он правильно сообщил мэйл/пароль
  def create
    @user = User.authenticate(params[:email], params[:password])

    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'вы успешно залогинились'
    else
      flash.now.alert = 'Неправильный мэйл или пароль'
      render :new
    end
  end

  # удаляет сессию залогиненного юзера
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Вы разлогинились! Приходите еще!'
  end

end
