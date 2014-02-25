require 'pathname'
$:.unshift( Pathname.new(__FILE__).join('..', '..', 'lib').expand_path.to_s )
require 'chord_progression_generator'

RSpec.configure do |config|
  config.order = :random
end
