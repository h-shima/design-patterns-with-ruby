# component
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class AddDryIngredients < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up')
  end

  def get_time_required
    3.0
  end
end

# composite
class CompositeTask
  def initialize(name)
    @name = name
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end

  alias_method :<<, :add_sub_task
  alias_method :delete, :remove_sub_task
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    add_sub_task(AddDryIngredients.new)
    add_sub_task(MixTask.new)
    # 他にも生地作りを構成するタスクを追加する
  end
end

make_batter = MakeBatterTask.new
puts make_batter.get_time_required
