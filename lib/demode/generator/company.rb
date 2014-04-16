module Demode
  module Generator
    class << self

      def company_name(id)
        first_name = Fields.get(id,:company_names)
        last_name = Fields.get(id,:company_suffixes)
        [first_name, last_name].join(' ')
      end

      def company_domain(id)
        domain_suffix = Fields.get(id,:domain_suffixes)
        [company_name(id).downcase, domain_suffix].join('.')
      end
      
    end
  end
end