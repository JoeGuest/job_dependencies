#Coding Exercise Tests
 
require_relative "../coding_exercise"
require "minitest/autorun"
 
class TestSort < MiniTest::Test
  
  def test_is_hash #Is hash
    assert_raises( RuntimeError ) {SortAlgorithm.new.check_if_hash(5)}
  end
  
  def test_1 #Empty String
    assert_equal([], SortAlgorithm.new.SortJobs({}))
  end
  
  def test_2 #Single job, no dependency
    assert_equal(['a'], SortAlgorithm.new.SortJobs({'a' => ''}))
  end
  
  def test_3 #Multiple jobs, no dependency
    assert_equal(['a','b','c'], SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => '',
        'c' => ''} ))
  end
  
  def test_4 #Multiple jobs, one dependency
    assert_equal(['a','c','b'], SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => 'c',
        'c' => ''} ))
  end
  
  def test_mod_4 #Multiple jobs, one dependency (b dependent on a)
    assert_equal(['a','b','c'], SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => 'a',
        'c' => '' } ))
  end
  
  def test_5 #Multiple jobs, multiple dependencies
    assert_equal(['a','d','f','c','b','e'], SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => 'c',
        'c' => 'f',
        'd' => 'a',
        'e' => 'b',
        'f' => '' } ))
  end
  
  def test_6 #Jobs with same dependency, error result
    assert_raises( RuntimeError ) {SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => '',
        'c' => 'c' } )}
  end
  
  def test_7 #Jobs with circular dependency - error result
    assert_raises( RuntimeError ) {SortAlgorithm.new.SortJobs(
      { 'a' => '',
        'b' => 'c',
        'c' => 'f',
        'd' => 'a',
        'e' => '',
        'f' => 'b' } )}
  end
 
end

=begin
#Is hash
fakejobs = 'Not a job'
puts 'Is Hash?'
puts SortJobs fakejobs
puts

#Empty string
jobs1 = {
  }
puts 'Test 1: Empty string'
puts SortJobs jobs1
puts

#Single job, no dependency
jobs2 = {
  'a' => ''
  }
puts 'Test 2: Single job, no dependency'
puts SortJobs jobs2
puts

#Multiple jobs, no dependencies
jobs3 = {
  'a' => '',
  'b' => '',
  'c' => ''
  }
puts 'Test 3: Multiple jobs, no dependency'
puts SortJobs jobs3
puts

#Multiple jobs, one dependency
jobs4 = {
  'a' => '',
  'b' => 'c',
  'c' => ''
  }
puts 'Test 4: Multiple jobs, one dependency'
puts SortJobs jobs4
puts

#Modified Test 4, b dependent on a
modjobs4 = {
  'a' => '',
  'b' => '',
  'c' => 'a'
  }
puts 'Modified Test 4: Multiple jobs, one dependency added previously to sorted array'
puts SortJobs modjobs4
puts

#Multiple jobs, multiple dependencies
jobs5 = {
  'a' => '',
  'b' => 'c',
  'c' => 'f',
  'd' => 'a',
  'e' => 'b',
  'f' => ''
  }
puts 'Test 5: Multiple jobs, multiple dependencies'
puts SortJobs jobs5
puts

#Jobs with same dependency - error result
jobs6 = {
  'a' => '',
  'b' => '',
  'c' => 'c'
  }
puts 'Test 6: Same dependency'
puts SortJobs jobs6
puts

#Jobs with circular dependency - error result
jobs7 = {
  'a' => '',
  'b' => 'c',
  'c' => 'f',
  'd' => 'a',
  'e' => '',
  'f' => 'b'
  }
puts 'Test 7: Circular dependency'
puts SortJobs jobs7
=end