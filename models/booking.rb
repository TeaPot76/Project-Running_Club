require_relative( '../db/sql_runner' )

class Booking
  attr_reader :id
  attr_accessor :instructor_name, :members_id, :sessions_id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @instructor_name = options['instructor_name']
   @members_id = options['members_id'].to_i
   @sessions_id = options['sessions_id'].to_i

 end

 def save()
   sql = "INSERT INTO bookings
   (
     instructor_name, members_id, sessions_id

   )
   VALUES
   (
     $1, $2, $3
   )
   RETURNING id"
   values = [@instructor_name, @members_id, @sessions_id]
   results = SqlRunner.run(sql, values)
   @id = results.first()['id'].to_i
 end

 def update
   sql = 'UPDATE bookings SET
   (instructor_name, members_id, sessions_id) =
   ($1, $2, $3) WHERE id=$4'
   values = [@instructor_name, @members_id, @sessions_id, @id]
   SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@members_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def session()
    sql = 'SELECT * FROM sessions
    WHERE id = $1'
    values = [@sessions_id]
    results = SqlRunner.run( sql, values )
    return Session.new( results.first )
  end

 def delete
   sql = 'DELETE FROM bookings WHERE id = $1'
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def self.delete_all
   sql = 'DELETE FROM bookings'
   SqlRunner.run(sql)
 end

 def self.find(id)
   sql = 'SELECT * FROM bookings WHERE id = $1'
   values = [id]
   result = SqlRunner.run(sql, values)
   booking = Booking.new(result.first)
   return booking
 end

 def self.all
   sql = 'SELECT * FROM bookings'
   bookings = SqlRunner.run(sql)
   return bookings.map{|booking| Booking.new(booking)}
 end



end
