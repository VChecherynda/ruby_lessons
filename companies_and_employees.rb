require 'mysql2'
require 'pry'

QUERY = "SELECT 
           companies.id AS company_id,
           companies.name,
           employees.id,
         SUM(employees.salary),
         COUNT(employees.id)
         FROM companies 
         INNER JOIN employees 
         ON companies.id = employees.company_id 
         GROUP BY company_id"

client = Mysql2::Client.new(:host => "localhost", :port => '3306', :username => "root", :database => "comapnies_and_employees")
results = client.query(QUERY)

@f = File.open('emplyees_and_salaries.txt','w')

@f.printf("%-16s %-16s %-16s %1s", "Company name:", "Total employess:", "Total salaries:", "\n\n")

results.each do |row|
  @f.printf("%-16s %-16s %-16s %1s", row["name"], row["SUM(employees.salary)"], row["COUNT(employees.id)"], "\n")
end

@f.close
