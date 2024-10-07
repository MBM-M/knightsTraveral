BOARD_SIZE = 8

def inbound(row, col, size)
  row >= 0 && row < size && col >= 0 && col < size
end

def path_list(end_cor, dictionary)
  path = []

  while dictionary.include?(end_cor)
    path << end_cor
    end_cor = dictionary[end_cor]
  end
  path << end_cor

  path.reverse
end

def knight_moves(first_cor, second_cor)
  directions = [[1, 2], [2, 1], [1, -2], [-1, 2], [-2, 1], [2, -1], [-1, -2], [-2, -1]]
  visited = Set[first_cor.freeze]

  dictionary = {}

  que = [first_cor]
  until que.empty?
    xi, yi = que.pop
    break if second_cor == [xi, yi]

    directions.each do |add_x, add_y|
      new_x = xi + add_x
      new_y = yi + add_y
      next unless inbound(new_x, new_y, BOARD_SIZE) && !visited.include?([new_x, new_y].freeze)

      que.unshift([new_x, new_y])
      visited << [new_x, new_y].freeze
      dictionary[[new_x, new_y].freeze] = [xi, yi].freeze
    end
  end

  path = path_list(second_cor.freeze, dictionary)

  puts "You made it in #{path.length - 1} moves! Here's your path: "
  path.each do |vertex|
    p vertex
  end
end

knight_moves([7, 7], [2, 6])