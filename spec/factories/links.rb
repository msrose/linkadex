# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do |f|
    f.group_id { FactoryGirl.create(:group).id }
    f.color_id { FactoryGirl.create(:color).id }
    f.border_color_id { FactoryGirl.create(:color).id }
    f.background_color_id { FactoryGirl.create(:color).id }
    f.href { Faker::Internet.url }
    f.title { Faker::Lorem.words(1).first.capitalize }
    f.target { %w(blank self).sample }
    f.order_rank { rand(1..3) }
  end
end
