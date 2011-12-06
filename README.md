# CountriesList gem

A gem that maintains a list of country codes to country names. Supports i18n of country names. Provides built-in
helpers for generating select tags of country names for https://github.com/justinfrench/formtastic and standard rails form helpers.

This gem comes with a list of countries built in, but you can provide a custom YML file of country code to country names.

## Installation

    gem "countries_list"
    
## Configuration

CountriesList works out of the box. The below is optional.

    CountriesList.configure do |config|
      config.locale = :en # Use english country names (default)
      config.priority = [:us, :ca, :au] # Copy these countries to the top of the list
    end
    
    # Provide a custom list of countries
    CountriesList.configure do |config|
      config.locale = :fr
      config.file_path = File.join(Rails.root.to_s, "config", "locales", "countries_fr.yml")
    end

## Usage

    # Fetch all countries
    CountriesList.all # Also, CountriesList.find(:all)
    
    # Fetch a specific country
    us = CountriesList.find(:us)
    ca = CountriesList.find("ca")
    au = CountriesList.find("AU")
    
    # In views. This behaves just like select() but you do not have to specificy the options
    <%= country_select("user", "country_code") %>
    
    # With a default value
    <%= country_select("user", "country_code", {:value => "US"})
    
## TODO

* Add formtastic input class
* Add formtastic example
* Support more languages than just en US
* Increase test coverage. Specifically with rails integration