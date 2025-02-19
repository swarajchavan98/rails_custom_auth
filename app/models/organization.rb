class Organization < ApplicationRecord
  has_many :organization_users, dependent: :destroy
  has_many :users, through: :organization_users

  belongs_to :created_by, class_name: "User", foreign_key: "created_by"

  def name_initials
    name_parts = name.strip.split

    if name_parts.size == 1
      name_parts.first[0, 2].upcase
    else
      "#{name_parts.first[0]}#{name_parts.last[0]}".upcase
    end
  end
end
