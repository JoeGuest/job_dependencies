#Create method to perform sorting
def SortJobs (jobs)
  #Arrays for final sorted and temporary storing
  sortedjobs = []
  tempjobs =[]
  
  #Testing to loop through tests and write to sortedjobs array
  jobs.each do | job, dependency |
    sortedjobs.push({
      'job' => job,
      'dependancy' => dependency
      })
  end
    
#Check if job structure is a hash, return error if not
    
#Loop through the hash
    
#If job has dependency, add after dependent job
    
#If no dependency, append to end
    
  return sortedjobs
    
end


#Test cases (same as bullet points in exercise) to build to

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