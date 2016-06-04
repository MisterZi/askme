class UserController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Alex',
        username: 'Sheim',
        avatar_url: 'http://cs622918.vk.me/v622918507/4b3f1/JGGrMGKfsWw.jpg'
      ),
      User.new(
        id: 2,
        name: 'Natasha',
        username: 'NataKor'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Alex',
      username: 'Sheim',
      avatar_url: 'http://cs622918.vk.me/v622918507/4b3f1/JGGrMGKfsWw.jpg'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('02.06.2016')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('02.06.2016'))
    ]

    @new_question = Question.new
  end
end
