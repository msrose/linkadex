# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do |f|
    f.tile_id { FactoryGirl.create(:tile).id }
    f.href { Faker::Internet.url }
    f.title { Faker::Lorem.words(1).first.capitalize }
    # f.color { random_hex }
    f.target { %w(blank self).sample }
  end
end
