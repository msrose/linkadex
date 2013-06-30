# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do |f|
    f.title { Faker::Lorem.words(1).first.capitalize }
    f.color { '#' + ['A'..'F', '0'..'9'].map(&:to_a).flatten.sample(6).join }
    f.collapsed { [true, false].sample }
  end
end
