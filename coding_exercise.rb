#Method to perform sorting
def SortJobs (jobs)
  #Arrays for final sorted and temporary storing
  sortedjobs = []
  tempjobs =[]
  
  #Check if job structure is a hash, return error if not
  if !jobs.is_a? Hash
    puts 'Argument is not a hash'
  else
    puts '  Start of dependency checking'
    
    #Continue with loop + sorting
    jobs.each do | job, dependency |
      #If no dependency, append to end
      if dependency.empty?
        sortedjobs.push({
          'job' => job,
          'dependency' => dependency
          })
        puts 'No dependency'
      #if dependency, add after dependent job
      else
        sortedjobs.push({
          'job' => job,
          'dependency' => dependency
          })
        puts 'Dependency'
      end
    end
    
    puts '  End of dependency checking'
  end
    
  return sortedjobs
    
end

###
#Test cases (same as bullet points in exercise) to build to
###

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