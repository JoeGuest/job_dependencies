class SortAlgorithm
  
  def initialize()
  end
  
  #Method to perform sorting
  def SortJobs (jobs)
    #Arrays for final sorted and temporary storing
    sortedjobs = []
    tempjobs = []

    #Check if job structure is a hash, return error if not
    if !jobs.is_a? Hash
      raise 'Argument is not a hash'
      #break
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
    #puts ['INITIAL SORT','Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array:', tempjobs]
    #puts


    #Checking what structure the array has
    #puts tempjobs[1]


    #Loop of temp array, to insert into sorted array (if temp array contains jobs with dependencies)
    until tempjobs.empty?
      num = tempjobs.length
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
      if num == tempjobs.length
        raise 'A job is either dependent on itself, or there is a circular dependency!'
        break
      end
    end

    #AFTER TEMP SORT - TESTING
    #puts ['AFTER TEMP SORT','Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array:', tempjobs]
    #puts

    #Return final value
    #return ['Sorted Jobs array:', sortedjobs,'', 'Temp Jobs array', tempjobs]
  return sortedjobs.map { | job | job['job'] }  
  end
end
