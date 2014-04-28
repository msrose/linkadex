# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do |f|
    f.group_id { FactoryGirl.create(:group).id }
    f.user_id { FactoryGirl.create(:user).id }
    f.body { Faker::Lorem.sentence }
  end
end
