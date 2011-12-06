require "countries_list/rails/countries_select_helper"

module CountriesList
  class Railtie < ::Rails::Railtie
    
    initializer "countries_list.initialize" do

      if defined? ActionView::Base
        ActionView::Base.send(:include, CountriesList::Rails::CountriesListSelectHelper)
      end
      
      CountriesList.configure do |config|
        config.locale = I18n.locale
      end
    end
  end
end