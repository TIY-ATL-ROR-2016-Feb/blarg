class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  # validates :password, format: { with: /[A-Z]{1,}[a-z][3,][0-9][1,]/,
  #                                message: "must be at least "}
  validates :email, format: {
              with: /.+@.+\..+/,  message: "Must have an @ symbol and a period."
            }

  has_many :posts
end
