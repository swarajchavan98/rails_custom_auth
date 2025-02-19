class Current < ActiveSupport::CurrentAttributes
  attribute :user, :organization, :session
end
