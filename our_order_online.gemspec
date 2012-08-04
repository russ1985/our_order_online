$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "our_order_online/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "our_order_online"
  s.version     = OurOrderOnline::VERSION::STRING
  s.summary     = "Companion To OurOrder App"
  s.description = "Companion To OurOrder App"
  s.authors     = ["Russell Holmes"]
  s.email       = ["ourorderonline@gmail.com"]
  s.homepage    = "http://www.ourorderonline.com"

  s.files = Dir["{public,app,config,db,lib,tasks}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
end
