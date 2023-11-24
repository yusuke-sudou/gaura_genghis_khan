# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



##########会員#############
User.create!(
  name: "山田　太郎1",
  email: 'yamada@taro1',
  encrypted_password: 'yamadataro',
  password: 'yamadataro',
  password_confirmation: 'yamadataro',
  )
  
User.create!(
  name: "山田　太郎2",
  email: 'yamada@taro2',
  encrypted_password: 'yamadataro',
  password: 'yamadataro',
  password_confirmation: 'yamadataro',
  )

User.create!(
  name: "山田　太郎3",
  email: 'yamada@taro3',
  encrypted_password: 'yamadataro',
  password: 'yamadataro',
  password_confirmation: 'yamadataro',
  )

##############ジャンル#############
Genre.create!(name: "メイン")
Genre.create!(name: "食べ放題")
Genre.create!(name: "追加メニュー（ジンギスカン）")
Genre.create!(name: "追加メニュー（もつ鍋）")
Genre.create!(name: "小鉢")
Genre.create!(name: "フライ")
Genre.create!(name: "サラダ")
Genre.create!(name: "ハイボール")
Genre.create!(name: "ビール")
Genre.create!(name: "サワー")
Genre.create!(name: "ソフトドリンク")

#############メニュー###############

#####メイン#########
genre1 = Genre.find_by(name: "メイン")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre1.id,
  name: "ジンギスカンセット", 
  explanation: "ラムショルダー・生ラム肩ロース・野菜セット（１人前）",
  price: 990
)

Menu.create!(
  genre_id: genre1.id,
  name: "もつ鍋セット", 
  explanation: "牛もつ・キャベツ・ニラ・もやし・豆腐（１人前）",
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

#####小鉢#########
genre5 = Genre.find_by(name: "小鉢")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre5.id,
  name: "キムチ", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "ピリ辛胡瓜", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "もやしナムル", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "枝豆", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "冷奴", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "納豆", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "納豆", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre5.id,
  name: "きゅうり漬け", 
  explanation: "",
  price: 380
)

#####フライ#########
genre6 = Genre.find_by(name: "フライ")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre6.id,
  name: "フライドポテト", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre6.id,
  name: "砂肝唐揚げ", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre6.id,
  name: "ナンコツ揚げ", 
  explanation: "",
  price: 380
)

#####サラダ#########
genre7 = Genre.find_by(name: "サラダ")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre7.id,
  name: "チョレギサラダ", 
  explanation: "",
  price: 600
)

Menu.create!(
  genre_id: genre7.id,
  name: "ラーメンサラダ", 
  explanation: "",
  price: 600
)

Menu.create!(
  genre_id: genre7.id,
  name: "納豆サラダ", 
  explanation: "",
  price: 600
)

#####ハイボール#########
genre8 = Genre.find_by(name: "ハイボール")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre8.id,
  name: "飲み放題（60分）", 
  explanation: "延長30分300円、+300円でレモンサワー飲み放題も追加できます。",
  price: 500
)

Menu.create!(
  genre_id: genre8.id,
  name: "角ハイボール", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre8.id,
  name: "ジムビームハイボール", 
  explanation: "",
  price: 380
)

Menu.create!(
  genre_id: genre8.id,
  name: "メーカーズクラフトハイボール", 
  explanation: "",
  price: 380
)

#####ビール#########
genre9 = Genre.find_by(name: "ビール")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre9.id,
  name: "プレミアムモルツ（小）", 
  explanation: "",
  price: 420
)

Menu.create!(
  genre_id: genre9.id,
  name: "プレミアムモルツ（中）", 
  explanation: "",
  price: 500
)

Menu.create!(
  genre_id: genre9.id,
  name: "アサヒスーパードライ（中）", 
  explanation: "",
  price: 550
)

Menu.create!(
  genre_id: genre9.id,
  name: "オールフリー", 
  explanation: "",
  price: 400
)

#####サワー#########
genre10 = Genre.find_by(name: "サワー")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre10.id,
  name: "レモンサワー", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "グレープフルーツサワー", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "男梅サワー", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "カルピスサワー", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "ウーロンハイ", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "巨峰サワー", 
  explanation: "",
  price: 390
)

Menu.create!(
  genre_id: genre10.id,
  name: "緑茶サワー", 
  explanation: "",
  price: 390
)

#####ソフトドリンク#########
genre11 = Genre.find_by(name: "ソフトドリンク")  # ジャンル名は対応するジャンル名に置き換えてください

Menu.create!(
  genre_id: genre11.id,
  name: "コーラ", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "ラムネ", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "ジンジャエール", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "カルピス", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "オレンジ", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "アップル", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "ウーロン茶", 
  explanation: "",
  price: 280
)

Menu.create!(
  genre_id: genre11.id,
  name: "お茶", 
  explanation: "",
  price: 280
)