require 'watir-webdriver'
@username = "seyring@kpmg.com"
@password = "welcome2"
@code = %q(=if(true, "IT WORKS!", "Always true, this should never happen!"))
$browser = Watir::Browser.new
$browser.driver.manage.timeouts.implicit_wait = 3
$browser.goto 'https://jnjdev.appiancloud.com/suite/portal/login.jsp'
$browser.text_field(:name, "un").set @username
$browser.text_field(:name, "pw").set @password
$browser.button(:value, "Sign In").click

$browser.goto 'https://jnjdev.appiancloud.com/suite/designer'
sleep 2
# print $browser.frame(:name, "fContent").div(:id, "environmentNavigation").lis[4].exists?
$browser.frame(:name, "fContent").div(:id, "environmentNavigation").lis[4].link.click
sleep 1
$browser.frame(:name, "fContent").link(:text, "Create an Expression Rule").click
sleep 2

$browser.frame(:name, "fContent").text_field(:name, "ruleDescription").set "code_writing_code"
$browser.frame(:name, "fContent").text_field(:name, "ruleDefinition").set @code

print $browser.frame(:name, "fContent").button(:value,"Test Rule").click