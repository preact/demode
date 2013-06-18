require 'demode/version'

module Demode
  class Configuration
    
    attr_accessor :check_enabled

    attr_accessor :id_field
    attr_accessor :replacements

    def initialize
      @check_enabled = nil
      @id_field = :id
      @replacements = []
    end
    
    def validate!
      if @replacements && @replacements.count > 0
        @replacements.each do |r|
          raise "Replacement must specify three parameters: class, method to replace, replacement field" if r.count != 3

          raise "Replacement first param must be a Class: #{r[0]}" if !r[0].is_a?(Class)
          raise "Replacement second param must be a symbol: #{r[1]}" if !r[1].is_a?(Symbol)
          raise "Replacement third param must be a symbol or proc: #{r[2]}" if !r[2].is_a?(Symbol) && !r[2].respond_to?(:call)

          raise "Unknown replacement field: #{r[2]}" if r[2].is_a?(Symbol) && !Generator.respond_to?(r[2])
        end
      end

      raise "Must specify a valid symbol for the id_field" if @id_field.nil? || !@id_field.is_a?(Symbol)

      true
    end
    
    def enabled?
      if check_enabled
        if check_enabled.respond_to?(:call)
          return check_enabled.call
        elsif check_enabled.is_a?(Boolean)
          return check_enabled == true
        else
          raise "check_enabled must be callable or boolean"
        end
      end
      false
    end

  end
end