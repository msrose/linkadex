# Read about factories at https://github.com/thoughtbot/factory_girl

def random_hex
  '#' + ['A'..'F', '0'..'9'].map(&:to_a).flatten.sample(6).join
end

FactoryGirl.define do
  factory :tile do |f|
    f.group_id { FactoryGirl.create(:group).id }
    f.border_color { random_hex }
    f.background_color { random_hex }
  end
end
