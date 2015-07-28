require 'watir-webdriver'
require 'test-unit'
class TC_myTest < Test::Unit::TestCase
	$browser = Watir::Browser.new
	def login_dev(username, password)
		$browser.driver.manage.timeouts.implicit_wait = 3
		$browser.goto 'https://jnjdev.appiancloud.com/suite/portal/login.jsp'

		$browser.text_field(:name, "un").set username

		$browser.text_field(:name, "pw").set password

		$browser.button(:value, "Sign In").click
	end
	
	def initiate_action_project_budget_setup(projectID)
		$browser.link(:href, "/suite/tempo/actions/").wait_until_present

		$browser.link(:href, "/suite/tempo/actions/").click

		$browser.link(:text, "Project Budget Set Up").wait_until_present

		$browser.link(:text, "Project Budget Set Up").click

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[2]/div[3]/div/div/div[1]/div/div/div/div/div/div/div[1]/div/input").wait_until_present

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[2]/div[3]/div/div/div[1]/div/div/div/div/div/div/div[1]/div/input").set projectID

		$browser.button(:value, "Search").click
	end
	
	def project_budget_type_setup(fundedBy, budgetType)
		$browser.radio(:label, fundedBy).set

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[8]/div[3]/div/div/div/div/div/div[2]/div/div/div/div[1]/div/select").wait_until_present

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[8]/div[3]/div/div/div/div/div/div[2]/div/div/div/div[1]/div/select").select(budgetType)

		$browser.button(:value, "Setup Project Budget").click
	end
	
	def investment_details_setup(investmentReason, investmentComments)
		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[3]/div/div/div[1]/div/div/div/div/div/div/div[1]/div/select").wait_until_present

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[3]/div/div/div[1]/div/div/div/div/div/div/div[1]/div/select").select(@investmentReason)

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[3]/div/div/div[2]/div/div/div[2]/div/div/div/div[1]/div/textarea").set @investmentComments
	end
	
	def project_budget_information_setup(aCARNumber, aCARTitle, totalCARCapexBudget, totalCARCapexExpense, region, country, fiscalYear)
		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/input").wait_until_present

		$browser.link(:text, "+Add New Country/Year").click

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[1]/div/div/div/div/div[1]/div/select").wait_until_present

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[1]/div/div/div/div/div[1]/div/select").select(region)
		
		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/input").set aCARNumber

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[2]/div/div/div[1]/div/div/div/div[1]/div/input").set aCARTitle

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[1]/div/div/div[2]/div/div/div/div[1]/div/input").set totalCARCapexBudget

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[2]/div/div/div[2]/div/div/div/div[1]/div/input").set totalCARCapexExpense

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[2]/div/div/div/div/div[1]/div/select").select(country)

		$browser.select_list(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[3]/div/div/div/div/div[1]/div/select").select(fiscalYear)

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[4]/div/div/div/div/div[1]/div/input").set totalCARCapexBudget

		$browser.text_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div/div/div/div[1]/div/div/div[3]/div/table/tbody/tr/td[5]/div/div/div/div/div[1]/div/input").set totalCARCapexExpense
	end
	
	def upload_CARDocument()
		$browser.file_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[8]/div[3]/div/div/div/div/div/div[1]/div/div/div[1]/div/div/div/form/input[3]").wait_until_present

		$browser.file_field(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[8]/div[3]/div/div/div/div/div/div[1]/div/div/div[1]/div/div/div/form/input[3]").set(
		'C:\test.txt')
	end 
	
	def validate_project_selection(projectID)
		$browser.button(:value, "Setup Project Budget").wait_until_present
		assert($browser.span(:id, "label-Project-Name").text.include?("Project Name"))
		assert($browser.div(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[1]/div[1]").text.include?("Project Search Results for ID: " + projectID))
		
		
		assert($browser.span(:id, "label-Project-Description").text.include?("Project Description"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[3]/div/div/div/div/div/div[2]/div/div/div/div[1]/div/p").text.include?("Migration of eNable 4.9 to version 5.0"))
		
		assert($browser.span(:id, "label-Project-Status").text.include?("Project Status"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/p").text.include?("Approved"))

		assert($browser.span(:id, "label-Project-Progress").text.include?("Project Progress"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[3]/div/div/div[1]/div/div/div[2]/div/div/div/div[1]/div/p").text.include?("Started"))
		
		assert($browser.span(:id, "label-Project-Manager-Name").text.include?("Project Manager Name"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/p").text.include?("SCRUGGS, REGAN"))
		
		assert($browser.span(:id, "label-Project-Manager-WWID").text.include?("Project Manager WWID"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[5]/div[3]/div/div/div[1]/div/div/div[2]/div/div/div/div[1]/div/p").text.include?("361117"))
		
		assert($browser.span(:id, "label-Project-Start-Date").text.include?("Project Start Date"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div[1]/div/div/div/div/div/div/div[1]/div/p").text.include?("Feb 5, 2013"))
		
		assert($browser.span(:id, "label-Organizational-Breakdown-Structure").text.include?("Organizational Breakdown Structure"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[7]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/p").text.include?("Global Orthopaedics"))
		
		assert($browser.span(:id, "label-GOC").text.include?("GOC"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[7]/div[3]/div/div/div[1]/div/div/div[2]/div/div/div/div[1]/div/p").text.include?("MD&D"))
		
		assert($browser.span(:id, "label-Valid-Project-").text.include?("Valid Project?"))
		
		assert($browser.span(:id, "label-Project-End-Date").text.include?("Project End Date"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[6]/div[3]/div/div/div[2]/div/div/div/div/div/div/div[1]/div/p").text.include?("Aug 27, 2015"))
		
		assert($browser.span(:id, "label-Funded-By").text.include?("Funded By"))		
	end
	
	def validate_investment_details(projectID)
		assert($browser.div(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[1]/div[1]").text.include?("Project Information"))
		
		assert($browser.span(:id, "label-Project-ID").text.include?("Project ID"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[3]/div/div/div[1]/div/div/div[1]/div/div/div/div[1]/div/p").text.include?(projectID))
		
		assert($browser.span(:id, "label-Project-Name").text.include?("Project Name"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[3]/div/div/div[1]/div/div/div[2]/div/div/div/div[1]/div/p").text.include?("Field Automation - Subproject 4.9 - 5.0 migration"))
		
		assert($browser.span(:id, "label-Global-Project-Manager").text.include?("Global Project Manager"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[3]/div/div/div[2]/div/div/div[1]/div/div/div/div[1]/div/p").text.include?("REGAN SCRUGGS"))
		
		assert($browser.span(:id, "label-Funded-By").text.include?("Funded By"))
		
		assert($browser.span(:id, "label-GOC").text.include?("GOC"))
		assert($browser.p(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[3]/div[3]/div/div/div[2]/div/div/div[3]/div/div/div/div[1]/div/p").text.include?("MD&D"))
		
		assert($browser.div(:xpath, "/html/body/div[7]/div[3]/div/div[2]/div/div[2]/div[3]/div/div/div/div/div/form/div[2]/div/div/div/div/div/div/div[4]/div[1]/div[1]").text.include?("Investment Details"))
		
		assert($browser.span(:id, "label-Investment-Reason").text.include?("Investment Reason"))
		
		assert($browser.span(:id, "label-Investment-Category").text.include?("Investment Category"))
		
		assert($browser.label(:id, "label-Comments").text.include?("Comments"))
		
	end
	
	def validate_budget_information(projectID, investmentReason, investmentComments)
		assert($browser.span(:id, "label-Project-ID").text.include?("Project ID"))
		assert($browser.p(:text, projectID).text.include?(projectID))	
		
		assert($browser.span(:id, "label-Project-Name").text.include?("Project Name"))
		assert($browser.p(:text, "Field Automation - Subproject 4.9 - 5.0 migration").exists?)
		
		assert($browser.span(:id, "label-Global-Project-Manager").text.include?("Global Project Manager"))
		assert($browser.p(:text, "REGAN SCRUGGS").exists?)
		
		assert($browser.span(:id, "label-Funded-By").text.include?("Funded By"))
		
		assert($browser.span(:id, "label-GOC").text.include?("GOC"))
		assert($browser.p(:text, "MD&D").exists?)
		
		assert($browser.div(:text, "Investment Details").exists?)
		
		
		assert($browser.span(:id, "label-Investment-Reason").text.include?("Investment Reason"))
		assert($browser.p(:text, investmentReason).exists?)
		
		assert($browser.span(:id, "label-Investment-Category").text.include?("Investment Category"))
		assert($browser.p(:text, "IT Operations - IT Shared Services").exists?)	
		
		assert($browser.span(:id, "label-Comments").text.include?("Comments"))
		assert($browser.p(:text, investmentComments).exists?)	
		
		assert($browser.div(:text, "Project Budget Information").exists?)
		
		assert($browser.label(:id, "label-aCAR-Number").text.include?("aCAR Number"))
		assert($browser.label(:id, "label-aCAR-Title").text.include?("aCAR Title"))
		assert($browser.label(:id, "label-Total-CAR-Capex-Budget-in-USD").text.include?("Total CAR Capex Budget in USD"))
		assert($browser.label(:id, "label-Total-CAR-Expense-Budget-in-USD").text.include?("Total CAR Expense Budget in USD"))
		assert($browser.span(:id, "label-Country-Budget-Information").text.include?("Country Budget Information"))
		assert($browser.h6(:text, "The total capital and expense budgets in USD will update based on country budgets entered above.").exists?)
		assert($browser.span(:id, "label-Total-Capex-Budget-in-USD").text.include?("Total Capex Budget in USD"))
		assert($browser.span(:id, "label-Total-Expense-Budget-in-USD").text.include?("Total Expense Budget in USD"))		
	end
	
	def test_PPP_test2
	
	end
	
	def test_PPPI_Project_Budget_Set_Up_Happy_Path
	
	
		@username = "seyring@kpmg.com"
		@password = "welcome2"
		@projectID = "PRJ-0108316"
		@investmentReason = "Environmental"
		@investmentComments = "test Comments"
		@fundedBy = "Internal ITSS Project"
		@budgetType = "Project Budget"
		@aCARNumber = "aCAR Number"
		@aCARTitle = "aCAR Title"
		@totalCARCapexBudget = 5000
		@totalCARCapexExpense = 6000
		@region = "EMEA"
		@country = "Austria"
		@fiscalYear = 2015
		
		
		login_dev(@username, @password)
		
		initiate_action_project_budget_setup(@projectID)
		
		validate_project_selection(@projectID)
		
		project_budget_type_setup(@fundedBy, @budgetType)
		
		investment_details_setup(@investmentReason, @investmentComments)
						
		validate_investment_details(@projectID)

		$browser.button(:value, "Next").click
		
		project_budget_information_setup(@aCARNumber, @aCARTitle, @totalCARCapexBudget, @totalCARCapexExpense, @region, @country, @fiscalYear)
					
		validate_budget_information(@projectID, @investmentReason, @investmentComments)

		$browser.button(:value, "Next").click

		upload_CARDocument()

		$browser.button(:value, "Next").click

		$browser.button(:value, "Submit").wait_until_present

		$browser.button(:value, "Submit").click
	end
end








