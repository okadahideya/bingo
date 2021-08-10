#ビンゴカード取得
S = gets.to_i
bingo_card = Array.new(S){ gets.split } #二次元配列で取得
bingo_card_list = bingo_card.flatten    #二次元配列から１つの配列にまとめる
    
# ワードの取得
N = gets.to_i
hit_word = Array.new(N){ gets.chomp }
    
# ワードとビンゴカードの確認
hit_list = Array.new(S*S)
hit_word.each do |hit|
    if hit_w = bingo_card_list.find_index(hit)  #同じワードがあるか確認
      hit_list[hit_w] = true                    #同じ場合trueの印をつける
    end
end
hit_card = hit_list.each_slice(S).to_a

# true or falseでビンゴの確認を行う
slanting_left = Array.new(S){|i| hit_card[i][i] }.all?      # 斜め
slanting_right = Array.new(S){|i| hit_card[i][-i-1] }.all?  # 斜め
line = hit_card.any?(&:all?)            # 横
row = hit_card.transpose.any?(&:all?)   # 縦
    
# 結果
if line || row || slanting_left || slanting_right
  puts "yes"
else
  puts "no"
end
