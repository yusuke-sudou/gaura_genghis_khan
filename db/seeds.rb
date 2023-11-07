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

###############会員情報#############

yamada_taro_num = 5

yamada_taro_num.times do |num|
  num += 1 #numが「0」スタートなので「1」スタートに調整
  Customer.create!(
    name: "山田太郎#{num}",
    email: "yamada@taro#{num}",
    encrypted_password: 'yamadataro',
    password: 'yamadataro',
    password_confirmation: 'yamadataro',
    is_active: true
  )
end

########################### ジャンル

genres = [
  'メイン',
  '食べ放題',
  '追加メニュー1',
  '追加メニュー2',
  '小鉢',
  'フライ',
  'サラダ',
  '〆料理'
]

genres.each do |genre|
  Genre.create!(
    name: genre
  )
end



########################### アイテム

items_array = [
  # メイン（ジャンルID:1）
  [
    'ジンギスカンセット',
    'もつ鍋セット',
    'よくばりセット'
  ],

  # 食べ放題（ジャンルID:2）
  [
    'ジンギスカンコース',
    'もつ鍋コース'
  ],

  # 追加メニュー1（ジャンルID:3）
  [
    'ラムショルダー',
    'ラム肩ロース',
    'ラムチョップ',
    'ラムウインナー３本',
    'ホルモン',
    'ミノ',
    '豚ロース',
    '鶏もも',
    '野菜各種',
  ],

  # 追加メニュー２（ジャンルID:4）
  [
    '牛もつ',
    '豚バラ',
    '鶏もも',
    'スープ',
    'ウインナー3本',
    '豆腐',
    'チーズ',
    'バター',
    'コーン',
    'キムチ',
    '野菜各種',
    '〆雑炊',
    '〆ラーメン'
  ],
  
  # 小鉢（ジャンルID:4）
  [
    'キムチ',
    'ピリ辛胡瓜',
    'もやしナムル',
    '枝豆',
    '冷奴',
    '納豆',
    'きゅうり漬け',
    '冷やしトマト',
    'チンジャ'
  ],
]

items_array.each_with_index do |items, i| 
  i += 1 #ジャンルID
  items.each do |item|
    item = Item.create!(
      name: item,
      introduction: "#{item}の説明です。とても美味しいですよ。",
      genre_id: i,
      price: (rand(1..50).to_s + '00').to_i,
      is_active: true
    )
    # 画像を登録
    item.image.attach(io: File.open(Rails.root.join("app/assets/images/items/img-#{Item.all.count}.jpg")), filename: "img-#{Item.all.count}.jpg")
  end
end
