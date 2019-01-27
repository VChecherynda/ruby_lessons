require 'mysql2'
require 'pry'

QUERY = "SELECT companies.name AS name_of_the_company, employees.name, employees.salary 
                        FROM companies
                        INNER JOIN employees
                        ON companies.id = employees.company_id"


client = Mysql2::Client.new(:host => "localhost", :port => '3306', :username => "root", :database => "comapnies_and_employees")
results = client.query(QUERY)

@prev_name_of_the_company 
@new_table = []

results.each_with_index do |row,index|

  current_name_of_the_company = row["name_of_the_company"]

  if @prev_name_of_the_company != current_name_of_the_company

    @prev_name_of_the_company = current_name_of_the_company

    @new_table << {
      "name_of_the_company" => current_name_of_the_company,
      "total_number_of_employees" => @new_table[index] ? @new_table[index]["total_number_of_employees"] + 1 : 0,
      "total_salary" => @new_table[index] ? @new_table[index]["total_salary"] + 1 : 0
    }
  end

end

puts @new_table
