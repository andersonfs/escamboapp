PagSeguro.configure do |config|
  config.token      = Rails.application.secrets.PAGSEGURO_TOKEN
  config.email      = Rails.application.secrets.PAGSEGURO_EMAIL
  config.environment = :sandbox
  config.encoding   = "UTF-8"
end