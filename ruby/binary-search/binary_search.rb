class BinarySearch
  # attr_reader :list, :middle

  # def initialize(array)
  #   raise ArgumentError, 'Array is not sorted' unless sorted?(array)

  #   @list = array
  #   @middle = @list.size / 2
  # end

  # def search_for(number)
  #   raise 'Number not in Array' unless @list.include? number

  #   search_collection(number, @list)
  # end

  # def search_collection(number, collection = @list)
  #   require 'pry'; binding.pry
  #   median_index = collection.size / 2
  #   median_number = collection[median_index]
  #   return median_index if number == median_number

  #   if number < median_number
  #     search_collection(number, collection[0..median_index])
  #   else
  #     search_collection(number, collection[median_index..-1])
  #   end
  # end

  # private

  # def sorted?(array)
  #   array == array.sort
  # end

  attr_reader :list

  def initialize(list)
    @list = list
    make_sure_list_sorted
  end

  def search_for(number)
    if list[middle] == number
      require 'pry'; binding.pry
      return middle
    elsif number > list[middle]
      new_list = list[middle..-1]
      raise "This number => #{number} is not in the list" if list == new_list
      require 'pry'; binding.pry
      BinarySearch.new(new_list).search_for(number) + middle
    else
      new_list = list[0..middle]
      raise "This number => #{number} is not in the list" if list == new_list
      require 'pry'; binding.pry
      BinarySearch.new(new_list).search_for(number)
    end
  end

  def middle
    @middle ||= (list.size / 2)
  end

  private

  def make_sure_list_sorted
    raise ArgumentError if list != list.sort
  end

  private

  def sorted?
    list.reduce { |a, e| return false if e < a; e }
  end

  def element_absent?(value, coll)
    coll.length.zero? || coll.length == 1 && coll[0] != value
  end

end
