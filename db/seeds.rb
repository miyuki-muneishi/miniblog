# coding: utf-8

20.times do |cnt|
  Article.create( text: "#{cnt+1}件目のテストデータです", title: "Art_No.#{cnt+1}", user_id: 2 )
end