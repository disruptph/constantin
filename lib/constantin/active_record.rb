module Constantin
  module ActiveRecord
    extend ActiveSupport::Concern

    included do
    end

    class_methods do
      # Usage
      #
      # class Country < ::HasOptions::Base
      #   define_constant "NZ", "PH"
      # end
      #
      # class User
      #   has_options :country, field: address
      # end
      #
      # user = User.new
      # user.address = "US"
      # user.valid?
      # => true
      #
      # user.address = "NZ"
      # user.valid?
      # => false
      #
      # if field not provided it defaults to option name
      def has_options(option, field: nil, **_options)
        field ||= option

        class_eval do
          option_constant = option.to_s.classify.constantize
          validates field, inclusion: { in: option_constant::ALL }, allow_blank: true
        end
      end
    end
  end
end
