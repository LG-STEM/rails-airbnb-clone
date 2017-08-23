
 puts "Deleting database..."

 Instrument.delete_all
 User.delete_all

 puts 'Creating 20 fake instruments...'

 INSTRUMENTS = {
   piano: ['https://usa.yamaha.com/files/DF3BBFBAC0EB418EAA55B39BBDE6691D_12073_2787x2296_b0d03a194b23e7cf85e62e1a36a7c1ab.jpg',
     'http://bestdigitalpiano.net/wp-content/uploads/2013/09/Roland-RD-300NX-Digital-Piano-1024x515.jpg'],
   guitar: ['https://www.taylorguitars.com/sites/default/files/styles/multi_column_guitar_three/public/responsive-guitar-detail/Taylor-814ce-fr-2015.png?itok=B3YG3tBf']

 }

 20.times do
   user = User.create(
     email: Faker::Internet.email,
     password: "password"
   )

   instrument = Instrument.new(
     name: INSTRUMENTS.keys.sample.to_s,
     description: Faker::Lorem.paragraph,
     price:  (10..90).to_a.sample,
     availibility: Faker::Boolean.boolean

   )

   instrument.user = user
   instrument.photo = INSTRUMENTS[instrument.name.to_sym].sample
   instrument.save!
 end
 puts 'Finished!'

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.fi
