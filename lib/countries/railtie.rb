require "countries/rails/countries_select_helper"

module Countries
  class Railtie < ::Rails::Railtie
    
    initializer "countries.initialize" do

      if defined? ActionView::Base
        ActionView::Base.send(:include, Countries::Rails::CountriesSelectHelper)
      end
      
      Countries.configure do |config|
        config.locale = I18n.locale
      end
    end
  end
end