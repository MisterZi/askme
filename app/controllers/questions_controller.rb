class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]

  before_action :authorize_user, except: [:create]
  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.author = current_user if current_user.present?

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: 'Вопрос задан'
    else
      render :edit
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранён'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: 'Вопрос удален'
  end

  private
    def load_question
      @question = Question.find(params[:id])
    end

    def authorize_user
      reject_user unless @question.user == current_user
    end

    def question_params
      # защита от уязвимости -- пользователь может менять ответы только у собственных вопросов
      if current_user.present? && params[:question][:user_id].to_i == current_user.id
        params.require(:question).permit(:user_id, :text, :answer)
      else
        params.require(:question).permit(:user_id, :text)
      end
    end

    # Метод, который проверяет капчу с использованием гема recaptcha
    def check_captcha(model)
      verify_recaptcha(model: model) unless current_user.present?
    end
end
