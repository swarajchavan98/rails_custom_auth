class Session < ApplicationRecord
  belongs_to :user
  belongs_to :organization, optional: true
end
