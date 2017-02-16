require_relative('../db/sql_runner.rb')


class Venue

  attr_reader :id 
  attr_accessor :name, :location

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
  end

  def self.delete_all()
    sql = "DELETE FROM venues;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM venues;" 
    self.get_many(sql)
  end
 

  def save()
    sql = "INSERT INTO venues ( name, location) VALUES ('#{@name}', '#{@location}') RETURNING id;"
    venue = SqlRunner.run(sql)[0]
    @id = venue['id'].to_i
  end

  def delete()
    sql = "DELETE FROM venues WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE venues SET (name,location) = ('#{@name}', '#{@location}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    venues = SqlRunner.run(sql)
    result = venues.map {|venue| Venue.new(venue)}
    return result  
  end

  def artist
    sql = "SELECT artists.* FROM artists
      INNER JOIN gigs ON gigs.artist_id = artists.id
    WHERE gigs.venue_id = #{@id};"
    result = Artist.get_many(sql)
    return result
  end

  def gig_dates
    sql = " SELECT gigs.* FROM gigs
            INNER JOIN venues ON gigs.venue_id = venues.id
            WHERE gigs.venue_id = #{@id}"
    result = Gig.get_many(sql)
    return result.map {|gig| gig.gig_date}
  end


  end