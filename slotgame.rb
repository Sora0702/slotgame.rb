def check_coin(coin, bet_coin)
  bet_list = [10, 30, 50]
  if coin < bet_list[bet_coin-1]
    puts "コインが足りません。終了します。"
    exit
  end
end

def create_random_number
  ary = []
  ary << rand(1..9)
  ary << rand(1..9)
  ary << rand(1..9)
  return ary
end

def cheak_result(ary1, ary2, ary3)
  match_count = 0
  if ary1[0] == ary2[0] && ary2[0] == ary3[0]
    match_count += 1
  end
  if ary1[1] == ary2[1] && ary2[1] == ary3[1]
    match_count += 1
  end
  if ary1[2] == ary2[2] && ary2[2] == ary3[2]
    match_count += 1
  end
  return match_count
end

def calc_coin(coin, match_count, bet_coin)
  bet_list = [10, 30, 50]
  if match_count == 0
    coin = coin - bet_list[bet_coin-1]
  else
    add_coin = (bet_list[bet_coin-1] * 2) * match_count
    coin = coin + add_coin
    puts "#{add_coin}コイン獲得！！"
  end
  return coin
end

def calc_point(point, match_count, bet_coin)
  bet_list = [10, 30, 50]
  add_point = (bet_list[bet_coin-1] * 10) * match_count
  point = point + add_point
  if add_point != 0
    puts "#{add_point}ポイント獲得！！"
  end
  return point
end

def slotgame(coin, point)
  puts "------------------"
  puts "残りコイン枚数:#{coin}"
  puts "ポイント:#{point}"
  puts "何コイン入れますか？"
  puts "1:(10コイン), 2:(30コイン), 3:(50コイン), 4:(やめとく)"
  bet_coin = gets.chomp.to_i
  case bet_coin
  when 1,2,3 then
    check_coin(coin, bet_coin)
    puts "エンターを３回押しましょう！"
    enter = gets
    ary1 = create_random_number
    puts "------------------"
    puts "|#{ary1[0]}|||"
    puts "|#{ary1[1]}|||"
    puts "|#{ary1[2]}|||"
    enter = gets
    ary2 = create_random_number
    puts "------------------"
    puts "|#{ary1[0]}|#{ary2[0]}||"
    puts "|#{ary1[1]}|#{ary2[1]}||"
    puts "|#{ary1[2]}|#{ary2[2]}||"
    enter = gets
    ary3 = create_random_number
    puts "------------------"
    puts "|#{ary1[0]}|#{ary2[0]}|#{ary3[0]}|"
    puts "|#{ary1[1]}|#{ary2[1]}|#{ary3[1]}|"
    puts "|#{ary1[2]}|#{ary2[2]}|#{ary3[2]}|"
    if ary1[0] == ary2[0] && ary2[0] == ary3[0]
      puts "初めの行に#{ary1[0]}が揃いました！"
    end
    if ary1[1] == ary2[1] && ary2[1] == ary3[1]
      puts "真ん中の行に#{ary1[1]}が揃いました！"
    end
    if ary1[2] == ary2[2] && ary2[2] == ary3[2]
      puts "最後の行に#{ary1[2]}が揃いました！"
    end
    match_count = cheak_result(ary1, ary2, ary3)
    coin = calc_coin(coin, match_count, bet_coin)
    point = calc_point(point, match_count, bet_coin)
    return coin, point
  when 4 then
    puts "終了します。"
    exit
  else
    puts "1:(10コイン), 2:(30コイン), 3:(50コイン), 4:(やめとく)のいずれかを入力してください。"
    exit
  end
end

coin = 100
point = 0
while coin != 0 do
  coin, point = slotgame(coin, point)
end
puts "------------------"
puts "残りコイン枚数:#{coin}"
puts "ポイント:#{point}"
puts "コインが無くなりました。終了します。"
