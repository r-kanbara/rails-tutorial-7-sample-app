class ApplicationMailer < ActionMailer::Base
  default from: "user@realdomain.com"  # 本番環境では user@realdomain.com を自分が使用しているメールアドレスに変更する必要がある
  layout "mailer"
end
