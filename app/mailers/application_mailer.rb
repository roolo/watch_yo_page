# frozen_string_literal: true

# Base class for application's mails
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
