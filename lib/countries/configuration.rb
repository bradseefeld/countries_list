module Countries
  class Configuration
    
    attr_accessor :priority, :locale, :file_path
    
    def initialize
      self.locale = :en
    end
    
    def file_path
      return @file_path if @file_path
      File.expand_path("../../locale/#{Countries.config.locale}.yml", __FILE__)
    end
  end
end