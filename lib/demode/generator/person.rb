module Demode
  module Generator
    class << self

      def name(id)
        first_name = Fields.get(id,:first_names)
        last_name  = Fields.get(id,:last_names)
        [first_name, last_name].join(' ')
      end

      def email(id)
        prefix = username(id)
        suffix = Fields.get(id,:free_emails)
        [prefix, suffix].join('@')
      end

      def username(id)
        format = Fields.get(id,:username_formats)
        first_name = Fields.get(id,:first_names)
        last_name  = Fields.get(id,:last_names)
        format.call(first_name,last_name)
      end

    end
  end
end