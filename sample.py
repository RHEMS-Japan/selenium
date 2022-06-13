from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument('--headless')
options.add_argument('--no-sandbox')

driver_path = "./chromedriver"
driver = webdriver.Chrome(executable_path=driver_path, options=options)

driver.get("https://www.google.co.jp/")
print(driver.title)