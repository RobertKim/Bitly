require 'securerandom'
require 'faker'

10.times do
  Url.create(:url => Faker::Internet.url, :short_url => "/nate.ly/" + SecureRandom.hex(3))
end