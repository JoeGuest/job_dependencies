require 'tsort'
class TsortableHash < Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

dhash = TsortableHash.new
dhash.update({
  'a' => [],
  'b' => ['c'],
  'c' => ['f'],
  'd' => ['a'],
  'e' => [],
  'f' => ['a']
})

puts dhash.tsort