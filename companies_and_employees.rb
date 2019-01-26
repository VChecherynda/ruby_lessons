require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :port => '3306', :username => "root", :database => "comapnies_and_employees")
results = client.query("SELECT companies.name, employees.name, employees.salary 
                        FROM companies
                        INNER JOIN employees
                        ON companies.id = employees.company_id")

results.each do |row|
  puts row
end

