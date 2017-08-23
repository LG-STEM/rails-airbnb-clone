# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting database..."

Instrument.delete_all
User.delete_all

puts 'Creating 20 fake instruments...'

INSTRUMENTS = {
  piano: [
    'https://usa.yamaha.com/files/DF3BBFBAC0EB418EAA55B39BBDE6691D_12073_2787x2296_b0d03a194b23e7cf85e62e1a36a7c1ab.jpg',
    'http://bestdigitalpiano.net/wp-content/uploads/2013/09/Roland-RD-300NX-Digital-Piano-1024x515.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/01/img16/musical-instruments/vertical-store/keyboards/mi_vertical_keyboards_short_2._CB278962455_.jpg'
    ],
  guitar: [
    'https://www.taylorguitars.com/sites/default/files/TaylorGuitars-New-for-17-Browse.jpg',
    'https://cdn.pixabay.com/photo/2015/08/29/14/18/bass-913092_960_720.jpg',
    'https://www.mopop.org/media/2628/gibson_les_paul_goldtop_guitar_gallery.jpg'
    ],
  drums: [
    'https://s-media-cache-ak0.pinimg.com/736x/97/79/0c/97790cf4d9bac1be384ad4e75e6ca193--gretsch-drums-drum-sets.jpg'
    ]

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
  instrument.photo_url = INSTRUMENTS[instrument.name.to_sym].sample
  instrument.save!
end
puts 'Finished!'

