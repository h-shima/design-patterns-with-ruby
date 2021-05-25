class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def on_button_push
    @command.execute if @command
  end
end

# コマンドパターンを使って動作用のコードをオブジェクトに抜き出す
## ボタンがクリックされたら文書を保存するコマンド
class SaveCommand
  def execute
    # 文書保存処理
    puts "文書を保存します"
  end
end

## ボタンが押されたら新しい文書を作成するコマンド
class CreateCommand
  def execute
    # 文書作成処理
    puts "新しい文書を作成します"
  end
end

save_button = SlickButton.new(SaveCommand.new)
save_button.on_button_push

create_button = SlickButton.new(CreateCommand.new)
create_button.on_button_push