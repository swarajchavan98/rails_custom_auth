class User < ApplicationRecord
  MINIMUM_PASSWORD_LENGTH = 8

  has_secure_password

  generates_token_for :password_reset, expires_in: 1.hour do
    password_salt.last(10)
  end

  validates :password, length: { minimum: MINIMUM_PASSWORD_LENGTH }
  validates :email, presence: true, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  has_many :sessions, dependent: :destroy

  has_many :organization_users, dependent: :destroy
  has_many :organizations, through: :organization_users
  has_many :created_organizations, class_name: "Organization", foreign_key: "created_by"

  def name_initials
    name_parts = full_name.strip.split

    if name_parts.size == 1
      name_parts.first[0, 2].upcase
    else
      "#{name_parts.first[0]}#{name_parts.last[0]}".upcase
    end
  end
end
