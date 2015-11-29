#! /bin/ruby

# main
puts "操作を選んでください"
handle = -1

# Loop
while true
  puts "0:終了"
  puts "1:登録カードの一覧"
  puts "2:期限切れ間近のカード一覧"
  handle = gets.to_i

#Exit
  if handle == 0 then
    exit
#Error Output
  elsif handle <= 1 && handle >= 2
    puts "数値が正しくありません"
#Get All Card Name
  elsif handle == 1
    require './CardNameGet.rb'
#Get Near Deadline Card
  elsif handle == 2
    require './NearDeadline.rb'
  end

  puts " "
end
