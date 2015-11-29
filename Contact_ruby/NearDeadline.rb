#! /bin/ruby

#登録カードの一覧を表示する部品
require 'kintone'
require 'io/console'
require 'readline'
require 'date'

#パスワードのみ入力を促す
puts "パスワードを入力してください"
password = STDIN.noecho { Readline.readline("Password: ").tap { puts } }

#ログイン
api = Kintone::Api.new("altobuns.cybozu.com", "kanai.toui@tsunolab.net", password)

#作成したアプリ番号
app = 20  # アプリのURL末尾を確認

#id = 10
#recorddata = api.record.get(app,id)
#exit

#とりあえずフィールド番号50までのカード名を対象にする
for id_num in 1..50 do
  id = id_num
  recorddata = api.record.get(app, id)

#カード名を削除し，フィールド番号に欠番がある場合の処理
  if recorddata["record"].nil?
    next

#カード情報は登録されているが，カード名が未入力の場合の処理
   puts  recorddata["record"]["文字列__1行_"]["value"]
    puts "日付情報未入力"

#期限切れ間近のカード名表示
  else
#webから"カード有効期限"の日付を取得
    deadline_s = recorddata["record"]["有効期限"]["value"]
#今日の日付を取得
    today = Date.today
#"カード有効期限"を日付オブジェクトに変換
    deadline_date = Date.strptime(deadline_s,"%Y-%m-%d")
#カード有効期限 - 今日の日付
    sub_days = deadline_date - today
#有効期限まで30日を切っていたカードを表示
    if sub_days.to_i <= 30
      wallet = recorddata["record"]["カテゴリー"]["value"].to_s
      wallet_split = wallet.split('"')
      print  wallet_split[1]+"\t"
      print  recorddata["record"]["文字列__1行_"]["value"]+"\t"
      puts recorddata["record"]["有効期限"]["value"]
    end
  end
end
