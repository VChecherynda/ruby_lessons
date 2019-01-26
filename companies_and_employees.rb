require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :port => '3306', :username => "root", :database => "comapnies_and_employees")
results = client.query("SELECT * FROM employees")

puts results

