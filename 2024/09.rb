require_relative "../advent_of_code"

input = "2333133121414131402"

input = @input.chars.map(&:to_i)

def parse(input)
  storage = []
  storage_index = 0
  input.each_with_index do |elem, idx|
    elem.times do |i|
      storage[storage_index + i] = idx.even? ? idx / 2 : "."
    end
    storage_index += elem
  end

  free_space_pointer = storage.find_index { _1 == "." }
  data_pointer = storage.size - 1

  [storage, free_space_pointer, data_pointer]
end

def checksum(storage)
  sum = 0
  storage.each_with_index do |elem, idx|
    sum += elem == "." ? 0 : elem * idx
  end
  sum
end

storage, free_space_pointer, data_pointer = parse(input)

until free_space_pointer > data_pointer
  storage[free_space_pointer] = storage[data_pointer]
  storage[data_pointer] = "."
  data_pointer -= 1 until storage[data_pointer] != "."
  free_space_pointer += 1 until storage[free_space_pointer] == "."
end

print_part1 checksum(storage)

######

storage, free_space_pointer, data_pointer = parse(input)

until free_space_pointer > data_pointer
  data_size = 0
  data_block_pointer = data_pointer
  data = storage[data_block_pointer]
  while storage[data_block_pointer] == data
    data_size += 1
    data_block_pointer -= 1
  end
  data_block_pointer += 1

  free_size = 0
  free_block_pointer = free_space_pointer
  until free_size >= data_size || free_block_pointer >= storage.size
    free_block_pointer += 1 until storage[free_block_pointer] == "."
    free_size = 0
    while storage[free_block_pointer] == "."
      free_size += 1
      free_block_pointer += 1
    end
  end

  if free_size >= data_size && free_block_pointer <= data_block_pointer
    free_block_pointer -= free_size
    data_size.times do |n|
      storage[free_block_pointer + n] = storage[data_block_pointer + n]
      storage[data_block_pointer + n] = "."
    end
  else
    data_pointer -= data_size
  end

  data_pointer -= 1 until storage[data_pointer] != "."
  free_space_pointer += 1 until storage[free_space_pointer] == "."
end

print_part2 checksum(storage)
