require_relative( '../db/sql_runner' )

class Customer
  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :level, :town
 def initialize(options)
   @id = options['id'].to_i if options['id']
   @first_name = options['first_name']
   @last_name = options['last_name']
   @age = options['age'].to_i
   @level = options['level'].to_i
   @town = options['town']
end

def save()
  sql = "INSERT INTO customers
  (
    first_name, last_name, age, level, town

  )
  VALUES
  (
    $1, $2, $3, $4, $5
  )
  RETURNING id"
  values = [@first_name, @last_name, @age, @level, @town]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end


def update
  sql = 'UPDATE customers SET (first_name, last_name, age, level, town) = ($1, $2, $3, $4, $5) WHERE id=$6'
  values = [@first_name, @last_name, @age, @level, @town, @id]
  SqlRunner.run(sql, values)
end

def self.delete(id)
  sql = 'DELETE FROM customers WHERE id = $1'
  values = [id]
  SqlRunner.run(sql, values)
end

def self.delete_all
  sql = 'DELETE FROM customers'
  SqlRunner.run(sql)
end

def self.find(id)
  sql = 'SELECT * FROM customers WHERE id = $1'
  values = [id]
  result = SqlRunner.run(sql, values)
  customer = Customer.new(result.first)
  return customer
end

def self.all
  sql = 'SELECT * FROM customers'
  customers = SqlRunner.run(sql)
  return customers.map{|customer| Customer.new(customer)}
end


end
