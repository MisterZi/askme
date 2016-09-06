# Настройки рекапчи
# Все ключи мы берем из переменных окружения
# На хероку переменные можно настроить с помощью heroku config
Recaptcha.configure do |config|
  config.public_key  = ENV['RECAPTCHA_ASKME_PUBLIC_KEY']
  config.private_key = ENV['RECAPTCHA_ASKME_PRIVATE_KEY']
end