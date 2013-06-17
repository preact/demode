require 'demode/generator/person'
require 'demode/generator/company'

module Demode
  module Generate
    class << self

      def get(id, field)
        if Generator.respond_to? field
          return Generator.send(field, normalize_id(id))
        end
      end

      def normalize_id(id)
        return 1
      end

    end
  end
end