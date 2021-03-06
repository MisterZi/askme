# Модель вопроса.
# Каждый экземпляр этого объекта — загруженная из БД информация о конкретном вопросе.
class Question < ActiveRecord::Base
  # эта команда добавляет связь с моделью User на уровне объектов
  # она же добавляет метод .users к данному объекту
  belongs_to :user

  # эта валидация препятствует созданию Вопросов, у которых нет пользователя
  # если задан пустой text, объект не будет сохранен в базу
  validates :text, :user, presence: true

  # если длина текста превышает 255 символа
  # объект не будет сохранен в базу
  validates :text, length: { maximum: 255,
                             too_long: "%{count} characters is the maximum allowed" }

  # добавляем связь с author_id
  belongs_to :author, class_name: 'User'
end
