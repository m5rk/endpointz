RSpec.configure do |config|
  config.filter_run focused: true
  config.alias_example_to :fit, :focused => true
  config.run_all_when_everything_filtered = true
end
