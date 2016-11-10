class User < ApplicationRecord
  has_secure_password

  EMAIL_FORMAT = /
    \A
    [a-z0-9]+
    ([._-][a-z0-9]+)*
    (\+[^@]+)?
    @
    [a-z0-9]+
    ([.-][a-z0-9]+)*
    \.
    ([a-z]{2,6})
    \z
  /ix

  validates_presence_of :name
  validates_format_of :email, with: EMAIL_FORMAT
  validates_uniqueness_of :email
end
