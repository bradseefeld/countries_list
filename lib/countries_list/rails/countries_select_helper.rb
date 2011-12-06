module CountriesList
  module Rails
    module CountriesListSelectHelper
      
      def country_select(object, method, options = {}, html_options = {})
        select(object, method, CountriesList.all.collect { |c| [ c[:name], c[:code] ]}, options, html_options)
      end
    end
  end
end