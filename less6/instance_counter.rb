module InstanceCounter
  def self.included(base) # сюда передаем сам класс!!!
    base.extend(ClassMethods)
    base.include(InstanceMethods) # подключаем согласно комментария к заданию - без отправки через send
  end  

  module ClassMethods
    attr_reader :instances

    def add_count
      @instances ||= 0
      @instances += 1
    end
  end

  private

  module InstanceMethods
    def register_instances
      self.class.add_count
    end
  end
end
