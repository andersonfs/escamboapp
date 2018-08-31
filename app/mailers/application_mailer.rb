# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@tornado.com.br'
  layout 'mailer'
end
