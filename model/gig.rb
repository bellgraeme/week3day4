require_relative('../db/sql_runner.rb')


class Gig

  attr_reader :gig_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id']
    @venue_id = options['venue_id']
    @gig_date = options['gig_date']
  end

  def self.delete_all
    sql = "DELETE FROM gigs;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM gigs;" 
    self.get_many(sql)
  end

  def save()
    sql = "INSERT INTO gigs ( artist_id, venue_id, gig_date) VALUES ('#{@artist_id}', '#{@venue_id}', '#{@gig_date}') RETURNING id;"
    gig = SqlRunner.run(sql)[0]
    @id = gig['id'].to_i
  end

  def delete()
    sql = "DELETE FROM gigs WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE gigs SET (artist_id,venue_id,gig_date) = ('#{@artist_id}', '#{@venue_id}', '#{@gig_date}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.get_many(sql)
    gigs = SqlRunner.run(sql)
    result = gigs.map {|gig| Gig.new(gig)}
    return result
    
  end

end