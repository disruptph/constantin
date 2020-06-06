require "constantin/version"
require "constantin/option"
require "constantin/active_record"

module Constantin
  class Error < StandardError; end
  # Your code goes here...
  def self.configuration
    @configuration ||= {}
  end

  def self.configure
    yield(configuration)
  end
end

ActiveSupport.on_load(:active_record) do
  ::ActiveRecord::Base.include(::Constantin::ActiveRecord)
end
