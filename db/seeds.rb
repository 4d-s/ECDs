# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.delete_all
Artist.delete_all
Genre.delete_all
Label.delete_all

Artist.create([
	{
		artist_name: "4Ds"
	},
	{
		artist_name: "yassann"
	},
	{
		artist_name: "J.suzuki"
	},
	{
		artist_name: "SMAP"
	},
	{
		artist_name: "嵐"
	},
	{
		artist_name: "宇多田ヒカル"
	}
])

Genre.create([
	{
		genre_name: "ロック"
	},
	{
		genre_name: "J-POP"
	},
	{
		genre_name: "ジャズ"
	},
	{
		genre_name: "演歌"
	},
	{
		genre_name: "K-POP"
	}
])

Label.create([
	{
		label_name: "WEB CAMP"
	},
	{
		label_name: "ジャニーズ事務所"
	},
	{
		label_name: "長野・ミュージックダイレクト"
	},
	{
		label_name: "エピックレコードジャパン"
	}
])

Item.create([
	{
		item_name: "我らが4Ds!!",
		stock: "12",
		price: "4980",
		is_sold: "true",
		genre_id: '1',
		artist_id: '1',
		label_id: '1'
	},
	{
		item_name: "進撃のやっさん",
		stock: "2",
		price: "9800",
		is_sold: "true",
		genre_id: '1',
		artist_id: '2',
		label_id: '1'
	},
	{
		item_name: "Let's go Programming!",
		stock: "5",
		price: "700",
		is_sold: "true",
		genre_id: '2',
		artist_id: '3',
		label_id: '1'
	}
])

p "Artistを#{Artist.count}件、作成完了"
p "Genreを#{Genre.count}件、作成完了"
p "Labelを#{Label.count}件、作成完了"
p "Itemを#{Item.count}件、作成完了"