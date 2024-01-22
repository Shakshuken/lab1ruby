require 'nokogiri'
require 'selenium-webdriver'
require_relative 'item'

class Parser
  def self.parse_item(url, username, password)
    options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    driver = Selenium::WebDriver.for(:chrome, options: options)
    
    # Логінимося
    driver.get(url)
    login(driver, username, password)
    
    sleep 2  

    parse_page = Nokogiri::HTML(driver.page_source)
    driver.quit

    parse_page.css('.quote').map do |quote_block|
      quote_text = quote_block.css('.text').text.strip
      author = quote_block.css('.author').text.strip
      tags = quote_block.css('.tags .tag').map(&:text)
      Item.new(quote_text, author, tags)
    end
  end

  def self.login(driver, username, password)
    driver.get('http://quotes.toscrape.com/login')

    wait = Selenium::WebDriver::Wait.new(timeout: 1)

    begin
      input_username = wait.until { driver.find_element(css: 'input[name="username"]') }
      input_password = driver.find_element(css: 'input[name="password"]')
      input_username.send_keys(username)
      input_password.send_keys(password)

      driver.find_element(css: 'input[type="submit"]').click
    end
  end
end
