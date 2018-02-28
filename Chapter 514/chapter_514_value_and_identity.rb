ShoppingList = Struct.new( :name, :items) do
  def initialize_dup(orig)
    self.name = orig.name
    self.items = orig.items.dup
  end
end

MASTER_LIST = ShoppingList.new("Master List",
                               ["Bread",
                                "Milk",
                                "Beer"]  )


#How dup works
today_list = MASTER_LIST.dup

#Same value
puts MASTER_LIST
puts today_list

#Different identities by calling dup
puts MASTER_LIST.object_id
puts today_list.object_id

today_list.name = "Wednesday Shopping"

today_list.items << "Eggs"

puts today_list
puts MASTER_LIST


#When not using dup
old_value = [today_list.name, today_list.items]
old_id = today_list.object_id

today_list.name = "Thursday Shopping"

new_value = [today_list.name, today_list.items]
new_id = today_list.object_id

#Same identity
puts old_id
puts new_id

#Different values
puts old_value
puts new_value




