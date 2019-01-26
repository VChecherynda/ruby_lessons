require 'mysql2'

QUERY = "SELECT companies.name AS name_of_the_company, employees.name, employees.salary 
                        FROM companies
                        INNER JOIN employees
                        ON companies.id = employees.company_id"


client = Mysql2::Client.new(:host => "localhost", :port => '3306', :username => "root", :database => "comapnies_and_employees")
results = client.query(QUERY)

results.each do |row|
  puts row
end

