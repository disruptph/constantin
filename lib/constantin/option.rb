module Constantin
  class Option
    # Supports array of strings or hash
    # ex.
    # define_options('PH', 'TH', {'USA' => 'US'})
    #
    # define_option_group 'ASIA' do
    #   [PH, TH]
    # end
    class << self
      def define_options(*constants)
        # Transform to key value format
        # key as the constant name value as the constant value duh.
        constants_dictionary = {}
        constants.map do |constant|
          if constant.is_a? String
            constants_dictionary[transform_key(constant)] = constant
          elsif constant.is_a?(Hash)
            constants_dictionary.merge!(constant.transform_keys { |key| transform_key(key) })
          else
            raise 'Not a valid constant'
          end
        end

        constants_dictionary.each do |key, val|
          add_value(val)
          const_set(key, val)
        end

        remove_const('ALL') if self.const_defined?('ALL')
        const_set('ALL', all_values)
      end

      def define_option_group(name)
        const_set(transform_key(name), yield)
      end

      def add_value(val)
        @all_values ||= []
        @all_values << val
      end

      def all_values
        @all_values.uniq
      end

      def transform_key(key)
        key.to_s.parameterize.underscore.upcase
      end

      def lookup(name)
        self.const_get(transform_key(name))
      end
    end
  end
end
