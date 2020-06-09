require 'pry'
require 'date'
module Encryption
  module_function

  def character_set
    ("a".."z").to_a << " "
  end

  def split_keys(key)
    arr = []
    for i in 0..(key.length-2) do
      arr << key.slice(i,2).to_i
    end
    arr
  end

  def create_offset(date)
    return nil if date.length != 6
    return nil if date[0,2].to_i > 12
    return nil if date[2,2].to_i > 31
    ((date.to_i ** 2).to_s[-4..-1]).split("").map {|num| num.to_i}
  end

  def final_shift(split_key, offset)
    split_key.map.with_index { |v,i| v + offset[i] }
  end

  def shift(key, date)
    final_shift(split_keys(key), create_offset(date))
  end

  def total_shift(shift, char, index)
    @offset = shift[index % 4]
    @original = character_set.find_index(char)
  end

  def prepare_message(message)
    @split_message = message.downcase.split("")
  end

  def encrypted_message(message, shift)
    prepare_message(message)
    @split_message.map.with_index do |char, index|
      if character_set.include?(char)
        total_shift(shift, char, index)
        new_char_index = (@original + @offset) % 27
        character_set[new_char_index]
      else
        char
      end
    end.join
  end

  def decrypted_message(message, shift)
    prepare_message(message)
    @split_message.map.with_index do |char, index|
      if character_set.include?(char)
        total_shift(shift, char, index)
        new_char_index = (@original - @offset) % 27
        character_set[new_char_index]
      else
        char
      end
    end.join
  end

  def generate_key
    random_number = rand(100000).to_s
    random_number = random_number.rjust(5,"0") if random_number.length < 5
    random_number
  end

  def date_today
    date = Date.today.strftime("%m%d%y")
  end

end
