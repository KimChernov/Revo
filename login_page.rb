require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for(:chrome)
driver.get("https://partner-02.st.revoup.ru/session/new")
# определяем время ожидания прогрузки страницы
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
# ввели в поле логина слишком короткий номер телефона
driver.find_element(:name, 'login').send_keys "+790036"
# нажали кнопку "Продолжить"
driver.find_element(:xpath, "//*[@id='app']/div/section[1]/div/div[2]/div/form/div[2]/button").click
puts "Test passed: User clicks button and gets alert: “должен быть либо email либо номер телефона”." if wait.until {
  /должен быть либо email либо номер телефона/.match(driver.page_source)
}
driver.quit