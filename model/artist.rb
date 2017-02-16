require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']    
  end

  def self.delete_all
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;" 
    self.get_many(sql)
  end

  def save()

    sql = "INSERT INTO artists ( name, genre) VALUES ('#{@name}', '#{@genre}') RETURNING id;"
    artist = SqlRunner.run(sql)[0]
    @id = artist['id'].to_i
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE artists SET (name,genre) = ('#{@name}', '#{@genre}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result   
  end

  def venue()
    sql = "SELECT v.* FROM venues v
            INNER JOIN gigs g ON g.venue_id = v.id
            WHERE g.artist_id = #{@id};"
    result = Venue.get_many(sql)
    return result
  end

  def gig_dates
    sql = " SELECT gigs.* FROM gigs
            INNER JOIN artists ON gigs.artist_id = artists.id
            WHERE gigs.artist_id = #{@id}"
    result = Gig.get_many(sql)
    return result.map {|gig| gig.gig_date}
  end

end