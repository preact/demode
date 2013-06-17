require 'demode/configuration'

require 'demode/generate'

module Demode

  class << self
    # A configuration object. Must like a hash and return sensible values for all
    # configuration options. See Demode::Configuration
    attr_accessor :configuration

    # Call this method to modify the configuration in your initializers
    def configure
      self.configuration ||= Configuration.new

      yield(configuration) if block_given?
      
      configuration.validate!

      setup if configuration.enabled?
    end

    def setup
      self.configuration.replacements.each do |klass, method, replacement|

        # alias the method we're about to replace
        replaced_method = "_old_#{method}".to_sym
        klass.send(:alias_method, replaced_method, method)

        # replace the method with a call to our generator
        klass.send(:define_method, method) do
          Demode::Generate.get(self.id, replacement)
        end

      end
    end

  end
end