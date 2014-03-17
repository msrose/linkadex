# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clone do |f|
    f.user_id { FactoryGirl.create(:user).id }
    f.group_id { FactoryGirl.create(:group).id }
  end
end
