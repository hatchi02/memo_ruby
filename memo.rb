require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_s.chomp

if  memo_type == "1"
  puts "------------------------------------------------------------"
  puts "「新規でメモを作成」が選択されました"
  puts "拡張子を除いたファイル名を記入してください"
  file_name = gets.chomp
    
  puts "------------------------------------------------------------"
  puts "メモしたい内容を記入してください"
  puts "完了したら Ctrl + D をおします"
    imput_memo = STDIN.read
    memo = imput_memo.chomp

  CSV.open("#{file_name}.csv" , "w") do |csv|
    csv.puts ["#{memo}"]
  end

elsif memo_type == "2"
  puts "------------------------------------------------------------"  
  puts "「既存のメモを編集する」が選択されました"
    
    Dir.foreach('.') do |item|
      next if item == '.' or item == '..' or item == '.DS_Store' or item == 'memo.rb'
      puts item
    end

  puts "------------------------------------------------------------"
  puts "編集したいファイル名を拡張子（.csv）を除いて記入してください"
  file_name = gets.chomp
    
  puts "------------------------------------------------------------"
  puts "#{file_name}.csv に追記します"
  puts "追記する内容を記入してください。"
  puts "完了したら Ctrl + D をおします。"
    imput_memo = STDIN.read
    memo_edit = imput_memo.chomp

    CSV.open("#{file_name}.csv" , 'a') do |csv|
      csv.puts [memo_edit]
    end
    
#1,2以外
else
  puts "------------------------------------------------------------"
  puts "エラー！！"
  puts "1または2以外の入力はできません。"
end