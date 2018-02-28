#By restricting the value of an object to never change, we prevent bugs and tracking how and when an object changed
#These objects are called value objects

#No writers
#Array and STring are both mutable in Ruby

#An object is a value only when its constituent parts are values
class NewShoppingList
  attr_reader :name, :items

  def initialize(name, items)
    @name = name.freeze
    @items = items.freeze
  end

  def with_name(name)
    self.class.new(name, items)
  end

  def add_item(item)
    self.class.new(name, items + [item])
  end

end

MASTER_LIST = NewShoppingList.new("Master List", ["Bread" "Milk", "Beer"])

puts MASTER_LIST
puts MASTER_LIST.name
puts MASTER_LIST.items

today_list = MASTER_LIST

puts today_list.with_name("Wednesday Shopping")

#Today list has same value as master list
#This is a feature not a bug, unless you update today list explicitly it will remain its original value
puts today_list
puts today_list.name
puts today_list.items

today_list = today_list.with_name("Wednesday Shopping")
puts today_list
puts today_list.name
puts today_list.items


today_list = MASTER_LIST.with_name("Friday Shopping").add_item("Tea").add_item("Coffee")

#Builder Pattern
#By introducing unchangeable value objects, easy to determine
#Since identity becomes constant and only value changes over time

