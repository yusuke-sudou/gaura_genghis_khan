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