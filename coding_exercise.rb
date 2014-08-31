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
    @input_hash.each do | job, dependency |
      if dependency.empty?
        add_to_sorted(job, dependency)
      else
        find_index(job, dependency)
        if @existingindex
          add_to_sorted_at_index(job, dependency)
        else
          add_to_temp(job, dependency)
        end
      end
    end
  end
  
  def sort_temp
    until @tempjobs.empty?
      num = @tempjobs.length
      @tempjobs.each_index do | index | 
        job = @tempjobs[index]['job']
        dependency = @tempjobs[index]['dependency']
        find_index(job, dependency)
        if @existingindex
          add_to_sorted_at_index(job, dependency)
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
  
  def add_to_sorted(job, dependency)
    @sortedjobs.push({
          'job' => job,
          'dependency' => dependency
          })
  end
  
  def add_to_temp(job, dependency)
    @tempjobs.push({
            'job' => job,
            'dependency' => dependency
            })
  end
  
  def find_index(job, dependency)
    @existingindex = @sortedjobs.find_index { |search| search['job'] == dependency }
  end
  
  def add_to_sorted_at_index(job, dependency)
    @sortedjobs.insert(@existingindex + 1, {
            'job' => job,
            'dependency' => dependency
            })
  end

  def display_result
    return @sortedjobs.map { | job | job['job'] }
  end
  
end