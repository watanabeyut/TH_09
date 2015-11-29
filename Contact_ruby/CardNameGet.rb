#! /bin/ruby
#登録カードの一覧を表示する部品
require 'kintone'
require 'io/console'
require 'readline'

#パスワードのみ入力を促す
puts "パスワードを入力してください"
password = STDIN.noecho { Readline.readline("Password: ").tap { puts } }

#ログイン
api = Kintone::Api.new("altobuns.cybozu.com", "kanai.toui@tsunolab.net", password)

#作成したアプリ番号
app = 20  # アプリのURL末尾を確認

#とりあえずフィールド番号50までのカード名を表示
for id_num in 1..50 do
  id = id_num
  recorddata = api.record.get(app, id)
#カード名を削除し，フィールド番号に欠番がある場合の処理
  if recorddata["record"].nil?
    next
#カード情報は登録されているが，カード名が未入力の場合の処理
  elsif recorddata["record"]["文字列__1行_"]["value"].empty?
    puts "カード名未入力"
#カード名表示
  else
    wallet = recorddata["record"]["カテゴリー"]["value"].to_s
    wallet_split = wallet.split('"')
    print  wallet_split[1]+"\t"
    puts recorddata["record"]["文字列__1行_"]["value"]
  end
end
