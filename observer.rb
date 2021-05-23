# オブザーバーパターンを提供するRuby標準モジュールも存在する
# https://docs.ruby-lang.org/ja/latest/class/Observable.html

# observable module
module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

# observable
class Employee
  include Subject

  attr_reader :name, :address, :salary

  def initialize(name, address, salary)
    super()
    @name = name
    @address = address
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

# observer
class Payroll
  def update(changed_employee)
    puts "#{changed_employee.name}のための昇給手続きを行います"
    puts "#{changed_employee.name}の給料は今#{changed_employee.salary}です!"
  end
end

# example
ken = Employee.new('ken', 'tokyo', 5_000_000)
payroll = Payroll.new

ken.add_observer(payroll)
ken.salary = 6_000_000
