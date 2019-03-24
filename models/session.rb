require_relative( '../db/sql_runner' )

class Session
  attr_reader :id
  attr_accessor :name, :location, :distance, :level, :day, :time_of_day, :price,
  :max_number, :members_id
 def initialize(options)
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @location = options['location']
   @distance = options['distance'].to_i
   @level = options['level'].to_i
   @day = options['day']
   @time_of_day = options['time_of_day'].to_i
   @price = options['price'].to_i
   @max_number = options['max_number'].to_i
   @members_id = options['members_id'].to_i
 end

 def save()
   sql = "INSERT INTO sessions
   (
     name, location, distance, level, day, time_of_day, price, max_number, members_id

   )
   VALUES
   (
     $1, $2, $3, $4, $5, $6, $7, $8, $9
   )
   RETURNING id"
   values = [@name, @location, @distance, @level, @day, @time_of_day, @price, @max_number, @members_id]
   results = SqlRunner.run(sql, values)
   @id = results.first()['id'].to_i
 end

 def update
   sql = 'UPDATE sessions SET
   (name, location, distance, level, day, time_of_day, price, max_number, members_id) =
   ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id=$10'
   values = [@name, @location, @distance, @level, @day, @time_of_day, @price, @max_number, @members_id, @id]
   SqlRunner.run(sql, values)
  end

 def self.delete(id)
   sql = 'DELETE FROM sessions WHERE id = $1'
   values = [id]
   SqlRunner.run(sql, values)
 end

 def self.delete_all
   sql = 'DELETE FROM sessions'
   SqlRunner.run(sql)
 end

 def self.find(id)
   sql = 'SELECT * FROM sessions WHERE id = $1'
   values = [id]
   result = SqlRunner.run(sql, values)
   session = Session.new(result.first)
   return session
 end

 def self.all
   sql = 'SELECT * FROM sessions'
   sessions = SqlRunner.run(sql)
   return sessions.map{|session| Session.new(session)}
 end


end
