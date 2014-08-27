#Method to perform sorting
def SortJobs (jobs)
  #Arrays for final sorted and temporary storing
  sortedjobs = []
  tempjobs = []
  
  #Check if job structure is a hash, return error if not
  if !jobs.is_a? Hash
    puts 'Argument is not a hash'
  else
    #Continue with loop + sorting
    
    #Initial sort from hash
    jobs.each do | job, dependency |
      #If no dependency, append to end
      if dependency.empty?
        sortedjobs.push({
          'job' => job,
          'dependency' => dependency
          })
      #If dependency, add after dependent job
      else
        #Search for index location within array already
        existingindex = sortedjobs.find_index { |search| search['job'] == dependency }
        #If dependency within sorted array already, insert to index location + 1
        if existingindex
          sortedjobs.insert(existingindex + 1, {
            'job' => job,
            'dependency' => dependency
            })
        #If dependency not within array, write to temp
        else
          tempjobs.push({
            'job' => job,
            'dependency' => dependency
            })
        end
      end
    end
  end
  
  #AFTER INITIAL SORT - TESTING
  puts ['INITIAL SORT','Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array:', tempjobs]
  puts

  
  #Checking what structure the array has
  puts tempjobs[1]
  
  
  #Loop of temp array, to insert into sorted array (if temp array contains jobs with dependencies)
  until tempjobs.empty?
    tempjobs.each_index do | index | 
      #puts "I'm in the temp jobs array! #{tempjobs[index]}"
      job = tempjobs[index]['job']
      dependency = tempjobs[index]['dependency']
      existingindex = sortedjobs.find_index { |search| search['job'] == dependency }
      if existingindex
        sortedjobs.insert(existingindex + 1, {
          'job' => job,
          'dependency' => dependency
        })
        tempjobs.delete_at(index)
      end
    end

  end

  #AFTER TEMP SORT - TESTING
  puts ['AFTER TEMP SORT','Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array:', tempjobs]
  puts
  
  #Return final value
  #return ['Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array', tempjobs]
  
end

###
#Test cases (same as bullet points in exercise) to build towards
###

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
=end
#Jobs with same dependency - error result
jobs6 = {
  'a' => '',
  'b' => '',
  'c' => 'c'
  }
puts 'Test 6: Same dependency'
puts SortJobs jobs6
puts
=begin
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