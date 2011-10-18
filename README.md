# Countries gem

A gem that maintains a list of country codes to country names. Supports i18n of country names. Provides built-in
helpers for generating select tags of country names for https://github.com/justinfrench/formtastic and standard rails form helpers.

This gem comes with a list of countries built in, but you can provide a custom YML file of country code to country names.

## Installation

    gem "countries"
    
## Configuration

    Countries.configure do |config|
      config.locale = :en # Use english country names (default)
      config.priority = [:us, :ca, :au] # Copy these countries to the top of the list
    end


## Usage

    # Fetch all countries
    Countries.all # Also, Countries.find(:all)
    
    # Fetch a specific country
    us = Countries.find(:us)
    ca = Countries.find("ca")
    au = Countries.find("AU")
    
    # In views. This behaves just like select() but you do not have to specificy the options
    <%= country_select("user", "country_code") %>
    
    # With a default value
    <%= country_select("user", "country_code", {:value => "US"})