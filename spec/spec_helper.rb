module Helpers
  def fixture_path(name)
    File.expand_path(File.join(__dir__, 'fixtures', name))
  end
end

RSpec.configure do |c|
  c.include Helpers
end
