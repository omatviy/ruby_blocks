class Phone
  attr_accessor :airplane_mode

  def initialize
    @airplane_mode = false
  end

  def text(message)
    puts @airplane_mode ? "Saved text: #{message}" : "Sent text: #{message}"
  end

  def in_airplane_mode
    @airplane_mode = true
    yield
  rescue Exception => e
    puts e.message
  ensure
    @airplane_mode = false
  end
end

phone = Phone.new

phone.in_airplane_mode do
  phone.text("Just took off")
  phone.text("At 8000 meters")
  raise "Whoops!"
end

phone.text("Just landed")
