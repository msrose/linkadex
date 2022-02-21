# Added as a hack to get Rails 3.2 to work with Ruby 2.4 since Heroku only
# support down to 2.4 and I don't want to upgrade Rails right now.
# https://stackoverflow.com/questions/44053672/simple-rails-app-error-cannot-visit-integer

module Arel
  module Visitors
    class DepthFirst < Arel::Visitors::Visitor
      alias :visit_Integer :terminal
    end

    class Dot < Arel::Visitors::Visitor
      alias :visit_Integer :visit_String
    end

    class ToSql < Arel::Visitors::Visitor
      alias :visit_Integer :literal
    end
  end
end
