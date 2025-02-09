require "razorpay"

key_id = Rails.application.credentials[:razorpay][:key_id]
key_secret = Rails.application.credentials[:razorpay][:key_secret]

Razorpay.setup(key_id, key_secret)
