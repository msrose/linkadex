# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tile do |f|
    f.group_id { FactoryGirl.create(:group).id }
    f.border_color_id { FactoryGirl.create(:color).id }
    f.background_color_id { FactoryGirl.create(:color).id }
  end
end
