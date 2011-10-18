module Countries
  module Rails
    module CountriesSelectHelper
      
      def country_select(object, method, options = {}, html_options = {})
        select(object, method, Countries.all.collect { |c| [ c[:name], c[:code] ]}, options, html_options)
      end
    end
  end
end