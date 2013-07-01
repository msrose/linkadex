# Read about factories at https://github.com/thoughtbot/factory_girl

def random_hex
  '#' + ['A'..'F', '0'..'9'].map(&:to_a).flatten.sample(6).join
end

FactoryGirl.define do
  factory :color do |f|
    f.hex_val { random_hex }
  end
end
