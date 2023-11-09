# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##############管理者情報###########
Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'adminmin',
  password: 'adminmin',
  password_confirmation: 'adminmin',
)

##############ジャンル#############
Genre.create!(name: "メイン")
Genre.create!(name: "食べ放題")
Genre.create!(name: "追加メニュー（ジンギスカン）")
Genre.create!(name: "追加メニュー（もつ鍋）")

#############メニュー###############

#####メイン#########
genre1 = Genre.find_by(name: "メイン")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre1.id,
  name: "ジンギスカンセット", 
  explanation: "",
  price: 990
)

Menu.create!(
  genre_id: genre1.id,
  name: "もつ鍋セット", 
  explanation: "",
  price: 990
)

#####食べ放題#########
genre2 = Genre.find_by(name: "食べ放題")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre2.id,
  name: "ジンギスカンコース", 
  explanation: "",
  price: 3980
)

Menu.create!(
  genre_id: genre2.id,
  name: "もつ鍋コース", 
  explanation: "",
  price: 3980
)

#####追加メニュー（ジンギスカン）#########
genre3 = Genre.find_by(name: "追加メニュー（ジンギスカン）")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre3.id,
  name: "ラムショルダー", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "ラム肩ロース", 
  explanation: "",
  price: 880
)

Menu.create!(
  genre_id: genre3.id,
  name: "ラムチョップ", 
  explanation: "",
  price: 880
)

Menu.create!(
  genre_id: genre3.id,
  name: "ラムウインナー3本", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "ホルモン", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "ミノ", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "豚ロース", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "鶏もも", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre3.id,
  name: "野菜各種", 
  explanation: "もやし・玉ねぎ・長ネギ・ジャガイモ",
  price: 250
)

#####追加メニュー（ジンギスカン）#########
genre4 = Genre.find_by(name: "追加メニュー（もつ鍋）")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre4.id,
  name: "牛もつ", 
  explanation: "",
  price: 780
)

Menu.create!(
  genre_id: genre4.id,
  name: "豚バラ", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre4.id,
  name: "鶏もも", 
  explanation: "",
  price: 680
)

Menu.create!(
  genre_id: genre4.id,
  name: "スープ", 
  explanation: "",
  price: 300
)

Menu.create!(
  genre_id: genre4.id,
  name: "ウインナー3本", 
  explanation: "",
  price: 480
)

Menu.create!(
  genre_id: genre4.id,
  name: "豆腐", 
  explanation: "",
  price: 230
)

Menu.create!(
  genre_id: genre4.id,
  name: "トッピング各種", 
  explanation: "チーズ・バター・コーン・キムチ",
  price: 380
)

Menu.create!(
  genre_id: genre4.id,
  name: "野菜各種", 
  explanation: "もやし・キャベツ・長ネギ・にら・にんにく",
  price: 250
)

Menu.create!(
  genre_id: genre4.id,
  name: "〆雑炊", 
  explanation: "",
  price: 350
)

Menu.create!(
  genre_id: genre4.id,
  name: "〆ラーメン", 
  explanation: "",
  price: 350
)