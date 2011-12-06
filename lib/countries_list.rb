require "yaml"
require "countries_list/version"
require "countries_list/configuration"
require "countries_list/railtie" if defined? Rails

module CountriesList
  
  def self.configure
    yield(config)
  end
  
  def self.config
    @configuration ||= Configuration.new
    @configuration
  end
  
  def self.all
    unless @countries
      load
    end
    
    @countries
  end
  
  def self.find_by_code(country_code)
    unless @countries
      load
    end
    
    code = country_code.to_s.upcase
    { :code => code, :name => @countries_hash[code] }
  end
  
  def self.find(id)
    if id == :all
      return all
    else
      return find_by_code(id)
    end
  end
  
protected

  def self.load
    @countries_hash = YAML.load_file(config.file_path)
    countries = []
    @countries_hash.each_pair do |code, name|
      countries << { :code => code, :name => name }
    end
    
    if config.priority
      config.priority.each do |code|
        code = code.to_s.upcase
        name = @countries_hash[code]
        if name
          countries.unshift({ :code => code, :name => name })
        end
      end
    end
    
    @countries = countries
  end
end
