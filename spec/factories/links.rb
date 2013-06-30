# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do |f|
    f.tile_id { FactoryGirl.create(:tile).id }
    f.href { Faker::Internet.url }
    f.title { Faker::Lorem.words(1).first.capitalize }
    f.color { '#' + ['A'..'F', '0'..'9'].map(&:to_a).flatten.sample(6).join }
    f.target { %w(blank self).sample }
  end
end
