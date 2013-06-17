module Demode
  module Generator
    class << self

      def company_name(id)
        Fields.get(id,:company_names)
      end

      def company_domain(id)
        domain_suffix = Fields.get(id,:domain_suffixes)
        [company_name(id).downcase, domain_suffix].join('.')
      end
      
    end
  end
end