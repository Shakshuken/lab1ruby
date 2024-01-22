require_relative 'main_application'

url = 'http://quotes.toscrape.com/js/'
output_filename = 'quotes'

username = 'denys'
password = 'yakubishyn'

app = MainApplication.new(url, output_filename, username, password)


driver = Selenium::WebDriver.for :chrome
Parser.login(driver, username, driver)

app.run