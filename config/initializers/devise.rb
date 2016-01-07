Devise.setup do |config|

  config.mailer_sender =
    'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.secret_key = 'c8baa311db82fd7c68f24273d872ba041cb5f7aa2dc0f743448ac4cc617b6fe959b2b679d06dc106d9d1fca8022847ebed37d87c167e5344770180fd0413809c'

end
