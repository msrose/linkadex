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

if Rails.env.development?
  puts "Destroying all users..."       and User.destroy_all
  puts "Destroying all colors..."      and Color.destroy_all
  puts "Destroying all groups..."      and Group.destroy_all
  puts "Destroying all links..."       and Link.destroy_all
  puts "Destroying clone relations..." and Clone.destroy_all
  puts "Destroying all comments..."    and Comment.destroy_all

  puts "Creating Michael..."
  michael = User.create(:name => 'Michael',
                        :email => 'ekimsc1094@sympatico.ca',
                        :password => 'abc123',
                        :password_confirmation => 'abc123',
                        :username => 'msrose')
  michael.verify!

  puts "Creating users..."
  5.times do
    User.create(:name => Faker::Name.name,
                :email => Faker::Internet.email,
                :password => 'random',
                :password_confirmation => 'random',
                :username => Faker::Name.first_name.downcase)
  end

  puts "Creating colors...", "Creating groups...", "Creating links..."
  User.all.each do |user|
    10.times do
      Color.create(:hex_value => random_hex,
                   :alias => [nil, Faker::Lorem.words(1).first.capitalize].sample,
                   :user_id => user.id)
    end

    (rand(5) + 5).times do
      Group.create(:title => Faker::Lorem.words(1).first.capitalize,
                   :color_id => user.colors.sample.id,
                   :collapsed => [true, false].sample,
                   :order_rank => rand(1..3),
                   :user_id => user.id)
    end

    user.groups.each do |group|
      (rand(5) + 5).times do
        Link.create(:title => Faker::Lorem.words(1).first.capitalize,
                    :href => Faker::Internet.url,
                    :color_id => user.colors.sample.id,
                    :background_color_id => user.colors.sample.id,
                    :border_color_id => user.colors.sample.id,
                    :target => Link::TARGETS.sample,
                    :order_rank => rand(1..3),
                    :group_id => group.id)
      end
    end
  end

  puts "Creating clone relations..."
  User.all.each do |user|
    other_users = User.where("id != ?", user.id)
    rand(5).times do
      group_to_clone = other_users.sample.groups.sample
      Clone.create(:group_id => group_to_clone.id, :user_id => user.id) unless user.cloned_groups.include?(group_to_clone)
    end
  end

  puts "Creating comments..."
  Group.all.each do |group|
    rand(10).times do
      group.comments.create(:user_id => User.all.sample.id, :body => Faker::Lorem.sentence)
    end
  end

  puts "Done."
end
