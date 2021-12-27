# FactoryBot.define do
#   factory :post do
#     image_id { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
#     title { Faker::Lorem.characters(number: 10) }
#     explanation { Faker::Lorem.characters(number: 20) }
#     prefecture_id { "0" }
#     place { Faker::Lorem.characters(number: 20) }
#     address { "東京都大田区" }
#     genre { "0" }
#     user
#   end
# end