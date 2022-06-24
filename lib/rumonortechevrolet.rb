require_relative 'rumonortechevrolet/version'
require 'f1sales_custom/hooks'

module Rumonortechevrolet
  class Error < StandardError; end

  class F1SalesCustom::Hooks::Lead
    def self.switch_product_name(lead)
      product_name = lead.product.name || ''
      source_name = lead.source.name.downcase || ''

      if source_name.include?('leadster')
        product_name.split('/').last || ''
      else
        product_name || ''
      end
    end
  end
end
