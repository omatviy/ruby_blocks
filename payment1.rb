class PaymentGateway
  attr_accessor :user, :password

  def initialize(user, password)
    @user = user
    @password = password
  end

  def connected
    puts "Connected as #{@user}"
  end

  def disconnected
    puts "DisConnected as #{@user}"
  end

  def submit(type, amount)
    puts "Submitted #{type} #{amount}"
  end

  def self.open(user, password)
    gateway = self.new(user, password)
    gateway.connected
    return gateway unless block_given?

    begin
      yield gateway
    rescue Exception => e
      puts e.message
    ensure
      gateway.disconnected
    end

  end
end

PaymentGateway.open("masha", "secret") do |gw|
  gw.submit(:sale, 12.00)
  gw.submit(:sale, 10.00)
  raise "Server error!"
end
