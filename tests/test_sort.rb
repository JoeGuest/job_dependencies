#Coding Exercise Tests
 
require_relative "../coding_exercise"
require "minitest/autorun"
 
class TestSort < MiniTest::Test
  
  def test_is_hash #Is hash
    assert_raises(TypeError) {SortAlgorithm.new(5).run}
  end

  def test_1 #Empty String
    assert_equal([], SortAlgorithm.new({}).run)
  end
  
  def test_2 #Single job, no dependency
    assert_equal(['a'], SortAlgorithm.new({'a' => ''}).run)
  end
  
  def test_3 #Multiple jobs, no dependency
    assert_equal(['a','b','c'], SortAlgorithm.new(
      { 'a' => '',
        'b' => '',
        'c' => ''} ).run)
  end
  
  def test_4 #Multiple jobs, one dependency
    assert_equal(['a','c','b'], SortAlgorithm.new(
      { 'a' => '',
        'b' => 'c',
        'c' => ''} ).run)
  end
  
  def test_mod_4 #Multiple jobs, one dependency (b dependent on a)
    assert_equal(['a','b','c'], SortAlgorithm.new(
      { 'a' => '',
        'b' => 'a',
        'c' => '' } ).run)
  end
  
  def test_5 #Multiple jobs, multiple dependencies
    assert_equal(['a','d','f','c','b','e'], SortAlgorithm.new({
      'a' => '',
      'b' => 'c',
      'c' => 'f',
      'd' => 'a',
      'e' => 'b',
      'f' => ''
    }).run)
  end
  
  def test_6 #Jobs with same dependency, error result
    assert_raises(RuntimeError) {
      SortAlgorithm.new({
        'a' => '',
        'b' => '',
        'c' => 'c'
      }).run}
  end
  
  def test_7 #Jobs with circular dependency - error result
    assert_raises(RuntimeError) {SortAlgorithm.new({
      'a' => '',
      'b' => 'c',
      'c' => 'f',
      'd' => 'a',
      'e' => '',
      'f' => 'b' } ).run}
  end
 
end