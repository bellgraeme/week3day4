require_relative('artist.rb')
require_relative('gig.rb')
require_relative('venue.rb')
require('pry')

Gig.delete_all
Artist.delete_all
Venue.delete_all

artist1 = Artist.new('name' => 'REM', 'genre' => 'alt')
artist1.save()

artist2 = Artist.new('name' => 'Pearl Jam', 'genre' => 'alt')
artist2.save()

artist3 = Artist.new('name' => 'Oasis', 'genre' => 'brit-pop')
artist3.save()



venue1 = Venue.new('name' => 'Usher Hall', 'location' => 'Edinburgh')
venue2 = Venue.new('name' => 'Wembley', 'location' => 'London')
venue3 = Venue.new('name' => 'Hydro', 'location' => 'Glasgow')

venue1.save()
venue2.save()
venue3.save()



gig1 = Gig.new('artist_id' => artist1.id, 'venue_id' => venue1.id, 'gig_date' => '2017-02-10')
gig2 = Gig.new('artist_id' => artist2.id, 'venue_id' => venue2.id, 'gig_date' => '2017-02-11')
gig3 = Gig.new('artist_id' => artist3.id, 'venue_id' => venue3.id, 'gig_date' => '2017-02-12')
gig4 = Gig.new('artist_id' => artist1.id, 'venue_id' => venue2.id, 'gig_date' => '2017-02-13')
gig5 = Gig.new('artist_id' => artist2.id, 'venue_id' => venue3.id, 'gig_date' => '2017-02-15')
gig6 = Gig.new('artist_id' => artist3.id, 'venue_id' => venue1.id, 'gig_date' => '2017-02-14')

gig1.save()
gig2.save()
gig3.save()
gig4.save()
gig5.save()
gig6.save()


binding.pry
nil