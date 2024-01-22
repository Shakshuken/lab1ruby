require 'json'
require 'csv'
require_relative 'item_container'

class Cart
  include ItemContainer

  def initialize
    @items = []
  end

  def save_to_file(filename)
    File.open(filename, 'w') do |file|
      @items.each { |item| file.puts(item) }
    end
  end

  def save_to_json(filename)
    File.open(filename, 'w') do |file|
      file.write(JSON.pretty_generate(@items.map(&:to_h)))
    end
  end

  def save_to_csv(filename)
    CSV.open(filename, 'w') do |csv|
      csv << ['Quote', 'Author', 'Tags', 'About Author', 'Born Date']
      @items.each { |item| csv << [item.quote, item.author, item.tags.join(','), item.about_author, item.born_date] }
    end
  end
end