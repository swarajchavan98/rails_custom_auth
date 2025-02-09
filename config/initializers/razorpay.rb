require "razorpay"

if Rails.env.test?
  key_id = "dummy_key_id"
  key_secret = "dummy_key_secret"
else
  key_id = Rails.application.credentials[:razorpay][:key_id]
  key_secret = Rails.application.credentials[:razorpay][:key_secret]
end

Razorpay.setup(key_id, key_secret)
