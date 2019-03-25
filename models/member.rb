require_relative( '../db/sql_runner' )

class Member
  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :level, :town, :sessions_id, :sessions_id
 def initialize(options)
   @id = options['id'].to_i if options['id']
   @first_name = options['first_name']
   @last_name = options['last_name']
   @age = options['age'].to_i
   @level = options['level'].to_i
   @town = options['town']
   @sessions_id = options['sessions_id']
end

def save()
  sql = "INSERT INTO members
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
  sql = 'UPDATE members SET (first_name, last_name, age, level, town) = ($1, $2, $3, $4, $5) WHERE id=$6'
  values = [@first_name, @last_name, @age, @level, @town, @id]
  SqlRunner.run(sql, values)
end

def delete
  sql = 'DELETE FROM members WHERE id = $1'
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all
  sql = 'DELETE FROM members'
  SqlRunner.run(sql)
end

def self.find(id)
  sql = 'SELECT * FROM members WHERE id = $1'
  values = [id]
  result = SqlRunner.run(sql, values)
  member = Member.new(result.first)
  return member
end

def self.all
  sql = 'SELECT * FROM members'
  members = SqlRunner.run(sql)
  return members.map{|member| Member.new(member)}
end


end
