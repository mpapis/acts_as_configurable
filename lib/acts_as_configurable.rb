module ActsAsConfigurable
  def self.included(receiver)
    receiver.extend ActMethods
  end
  module ActMethods
    def acts_as_configurable(options=nil)
      options[:name]=options[:for]=options[:field] if options.kind_of?(Hash) and options[:field]
      default_method_name = Configuration.default_method_name || 'configuration'
      default_klass_name = Configuration.default_klass_name || self
      default_key_name= Configuration.default_key_name || 'default'
      method_name = if options.kind_of? Hash
        options[:name] || default_method_name
      elsif options.kind_of? String
        options.blank? ? default_method_name : options
      elsif options.instance_of? Symbol
        options
      else
        default_method_name
      end
      method_name = method_name.to_s if method_name.instance_of?(Symbol)
      klass_name = options.kind_of?(Hash) ? (options[:for] || default_klass_name) : default_klass_name
      klass_name = klass_name.name if klass_name.instance_of?(Class)
      default_key = options.kind_of?(Hash) ? (options[:default] || default_key_name) : default_key_name
      cattr_accessor method_name.to_sym
      instance_eval do
        method_name+='='
        send(method_name.to_sym,Configuration.settings(klass_name.to_s,default_key.to_s))
      end
    end
  end
  class Configuration
    cattr_accessor :default_method_name
    cattr_accessor :default_klass_name
    cattr_accessor :default_key_name
    def self.settings(name='default',default=nil)
      default||=default_key_name
      @@settings ||= YAML.load_file("#{RAILS_ROOT}/config/configuration.yml")
      @@settings.has_key?(name)  ? @@settings[name] : @@settings[default]
    end
  end
end
