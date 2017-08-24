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
    'https://s-media-cache-ak0.pinimg.com/736x/97/79/0c/97790cf4d9bac1be384ad4e75e6ca193--gretsch-drums-drum-sets.jpg',
    'https://de.yamaha.com/de/files/Junior_Kit_540x540_396x396_3fd7dfa87f41b96b09838060b7c9d668.jpg',
    'https://www.native-instruments.com/typo3temp/pics/img-ce-03_the_drum_kits-2de169605538cc37b6cdd14691429fd6-d.jpg'
    ],
  bass: [
    'https://cdn.shopify.com/s/files/1/0775/5481/products/IMG_0296_grande.jpg?v=1495131494',
    'https://static1.squarespace.com/static/55db79dfe4b01e5be14e4925/55db7c69e4b068214f73ebc5/567848a2a12f4431fe783aab/1450723491283/C-Ken-Smith-94-6-String-Bass-tp.jpg?format=500w',
    'https://s-media-cache-ak0.pinimg.com/736x/36/7e/9a/367e9a70ca33f734310ff8117e0f8ed6--bass-guitars-for-sale-instruments.jpg',
    ],
  brass: [
    'https://imgix.ranker.com/list_img_v2/1509/161509/original/brass-instrument-instruments-in-this-family-u1?w=817&h=427&fm=jpg&q=50&fit=crop',
    'https://irp-cdn.multiscreensite.com/fe3fcbe5/dms3rep/multi/mobile/84653445_Trumpet-500x333.jpg',
    'http://www.miraphone.de/files/bilder/home/teaser/xEuphonium,P20breit,P20Kopie.jpg.pagespeed.ic.fy9gmN9Gyx.jpg'
    ],
  strings: [
    'http://www.abc.net.au/news/image/6926544-3x2-700x467.jpg',
    'https://welltempered.files.wordpress.com/2013/09/string-trio-violin-viola-and-cello.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/15/img17/musical-instruments/content-grid/mi_vertical_band_tall_2._V503595518_.jpg'
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

