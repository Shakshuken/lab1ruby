require_relative 'parser'
require_relative 'cart'

class MainApplication
  def initialize(url, output_filename, username, password)
    @url = url
    @output_filename = output_filename
    @username = username
    @password = password
  end

  def run
    items = Parser.parse_item(@url,  @username, @password)
    cart = Cart.new
    items.each { |item| cart.add_item(item) }

    cart.save_to_file("#{@output_filename}.txt")
    cart.save_to_json("#{@output_filename}.json")
    cart.save_to_csv("#{@output_filename}.csv")
  end
end
