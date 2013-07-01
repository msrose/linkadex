# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do |f|
    f.title { Faker::Lorem.words(1).first.capitalize }
    f.color_id { FactoryGirl.create(:color).id }
    f.collapsed { [true, false].sample }
  end
end
