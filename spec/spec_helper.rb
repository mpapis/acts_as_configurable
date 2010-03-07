require 'rubygems'
require 'active_support'
require File.join(File.dirname(__FILE__), '..', 'lib', 'acts_as_configurable')

RAILS_ROOT=File.dirname(__FILE__)

Object.send :include, ActsAsConfigurable

class Settings1
  acts_as_configurable
end
class Settings2
  acts_as_configurable
end
class Settings30
  acts_as_configurable :for => 'settings'
end
class Settings31
  acts_as_configurable :for => :settings
end
class Settings4
  acts_as_configurable :for => Settings2
end
class Settings50
  acts_as_configurable 'conf'
end
class Settings51
  acts_as_configurable :conf
end
class Settings52
  acts_as_configurable :name=>'conf', :default=>'settings'
end
class Settings53
  acts_as_configurable :name=>:conf, :default=>'settings'
end
class Settings60
  acts_as_configurable :name=>'conf', :for => Settings1, :default=>'settings'
end
class Settings61
  acts_as_configurable :name=>'conf', :for => Settings1, :default=>:settings
end
class Settings7
  acts_as_configurable :name=>'conf', :for => Settings2, :default=>'settings'
end
class Settings8
  acts_as_configurable :name=>'conf1', :for => Settings1
  acts_as_configurable :name=>'conf2', :for => Settings2
end
