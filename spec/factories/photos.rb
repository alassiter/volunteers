FactoryBot.define do
  factory :photo do
    opportunity_id { 1 }
    caption { "MyString" }
    photographer { "MyString" }
    image_data { "MyText" }
  end
end
