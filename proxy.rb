require 'etc'

class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  private

  def method_missing(name, *args)
    check_access
    @subject.send(name, *args)
  end

  def check_access
    # if Etc.getlogin != @owner_name
    if 'oshima' != @owner_name
      raise "#{@owner_name} にはアクセス権がありません"
    end
  end
end

# 文字列オブジェクトに対するメソッド呼び出しを AccountProtectionProxy でプロキシしてみる
subject = 'a simple string'
proxy = AccountProtectionProxy.new(subject, 'oshima')

puts proxy.length
