# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_hex
  '#' + ['A'..'F', '0'..'9'].map(&:to_a).flatten.sample(6).join
end

Color.destroy_all
Group.destroy_all
Link.destroy_all

10.times do
  Color.create(:hex_value => random_hex,
               :alias => [nil, Faker::Lorem.words(1).first.capitalize].sample)
end

9.times do
  Group.create(:title => Faker::Lorem.words(1).first.capitalize,
               :color_id => Color.all.sample.id,
               :collapsed => [true, false].sample,
               :order_rank => rand(1..3))
end

Group.all.each do |group|
  (rand(5) + 5).times do
    group.links.create(:title => Faker::Lorem.words(1).first.capitalize,
                      :href => Faker::Internet.url,
                      :color_id => Color.all.sample.id,
                      :background_color_id => Color.all.sample.id,
                      :border_color_id => Color.all.sample.id,
                      :target => Link::TARGETS.sample,
                      :order_rank => rand(1..3))
  end
end
