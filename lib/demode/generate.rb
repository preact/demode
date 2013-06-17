require 'demode/generator/person'
require 'demode/generator/company'
require 'demode/generator/fields'
require 'digest'

module Demode
  module Generate
    class << self

      def get(id, field)
        if Generator.respond_to? field
          return Generator.send(field, normalize_id(id))
        end
      end

      def normalize_id(id)
        Digest::MD5.hexdigest( sigflat id ).hex
      end

      def sigflat(id)
        if id.class == Hash
          arr = []
          id.each do |key, value|
            arr << "#{sigflat key}=>#{sigflat value}"
          end
          id = arr
        end
        if id.class == Array
          str = ''
          id.map! do |value|
            sigflat value
          end.sort!.each do |value|
            str << value
          end
        end
        if id.class != String
          id = id.to_s << id.class.to_s
        end
        id
      end

    end
  end
end