class User < ApplicationRecord
  has_secure_password
  has_many :work_logs
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
