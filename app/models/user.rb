class User < ActiveRecord::Base
  validates_presence_of :password, :email
  # validates :password, format: { with: /[A-Z]{1,}[a-z][3,][0-9][1,]/,
  #                                message: "must be at least "}
  validates :password, length: { minimum: 8 }
  validates :email, format: {
              with: /.+@.+\..+/,  message: "Must have an @ symbol and a period."
            }
end
