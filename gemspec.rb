=begin
class Phone
  attr_accessor :airplane_mode, :name

  def initialize
    @airplane_mode = false
  end

  def set_value
    yield self
  end

  def to_s
    "Name: #{name}"
  end
end

phone = Phone.new

phone.set_value do |ph|
  ph.name = "Air"
end

puts phone
=end

module Gem
    class Specification
        attr_accessor :name, :version, :email, :homepage 

        def initialize
            @version = "1.0"
            yield self if block_given?
        end
    end
end

spec = Gem::Specification.new do |s|
  s.name = "my-gem"
  s.version = "2.0"
  s.email = "om@gmail.com"
  s.homepage = "https://sashasan.com"
end

p spec
