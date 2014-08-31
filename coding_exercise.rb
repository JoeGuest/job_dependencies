class SortAlgorithm
   
  def initialize(input_hash)
    @input_hash = input_hash
    #Arrays for final sorted and temporary storing
    @sortedjobs = []
    @tempjobs = []
  end
  
  def run
    check_if_hash
    initial_sort
    sort_temp
    display_result
  end
  
  def initial_sort
    #Initial sort from hash
    @input_hash.each do | job, dependency |
      #If no dependency, append to end
      if dependency.empty?
        @sortedjobs.push({
          'job' => job,
          'dependency' => dependency
          })
      #If dependency, add after dependent job
      else
        #Search for index location within array already
        existingindex = @sortedjobs.find_index { |search| search['job'] == dependency }
        #If dependency within sorted array already, insert to index location + 1
        if existingindex
          @sortedjobs.insert(existingindex + 1, {
            'job' => job,
            'dependency' => dependency
            })
          #If dependency not within array, write to temp
        else
          @tempjobs.push({
            'job' => job,
            'dependency' => dependency
            })
        end
      end
    end
  end
  
  def sort_temp
    until @tempjobs.empty?
      num = @tempjobs.length
      @tempjobs.each_index do | index | 
        #puts "I'm in the temp jobs array! #{tempjobs[index]}"
        job = @tempjobs[index]['job']
        dependency = @tempjobs[index]['dependency']
        existingindex = @sortedjobs.find_index { |search| search['job'] == dependency }
        if existingindex
          @sortedjobs.insert(existingindex + 1, {
            'job' => job,
            'dependency' => dependency
          })
          @tempjobs.delete_at(index)
        end
      end
      if num == @tempjobs.length
        raise 'A job is either dependent on itself, or there is a circular dependency!'
        break
      end
    end
  end
  
  def check_if_hash
    if !@input_hash.is_a? Hash
      raise TypeError, 'Argument is not a hash'
    end
  end
  
  def add_to_sorted
  end
  
  def add_to_temp
  end
  
  def find_index
  end
  
  def add_to_index_plus_1
  end

  def display_result
    return @sortedjobs.map { | job | job['job'] }
  end
  
end