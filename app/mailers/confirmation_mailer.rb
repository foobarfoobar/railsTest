class ConfirmationMailer < ActionMailer::Base
  default from: "ahohman@imn.htwk-leipzig.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.confirmation.subject
  #
  def confirmation
    @greeting = "Hi"

    mail to: "andre-hohmann@gmx.de",
    from: "ahohman@imn.htwk-leipzig.de",
    subject: "Test"
  end
end