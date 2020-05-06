# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.chomp         #.chompで文字列で受け取り、文字列で数字を比較する
    while true
      if input_hand == "0" || input_hand =="1" || input_hand =="2"   #文字列形式で数字を比較している
        return input_hand.to_i
      else
        puts  "もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.chomp     #ここで再入力
      end
    end
  end
end

class Enemy
  def hand
    enemy_hand = rand(3)        #引数未満の数字をランダムで生成する。現在時刻をもとにしてランダムな数値を作成している、のかな
    return enemy_hand           #リターンを忘れずに。リターンは関数で処理した値を渡す
  end
end

class Janken
  def pon(input_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です。"        #配列のインデックスにランダム生成した数字を当てはめる
    if input_hand == enemy_hand
      puts "あいこです"
      return true
    elsif input_hand == 0 && enemy_hand == 1 || input_hand == 1 && enemy_hand == 2 || input_hand == 2 && enemy_hand == 0
      puts "あなたの勝ちです"
      return false
    else
      puts "あなたの負けです"
      return false
    end
  end
end
player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true          #最初の一回目にwhile文で使用されるtrue
while next_game           #2回目以降ではJankenのあいこの場合はtrue,勝ち負けの場合はfalseが代入される
  next_game = janken.pon(player.hand, enemy.hand)
end
