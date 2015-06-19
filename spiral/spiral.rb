class Spiral
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def order!
    result, x, y = [], 0, 0
    while result.size < data_size
      result, x, y = go_right(result, x, y)
      result, x, y = go_down(result, x, y)
      result, x, y = go_left(result, x, y)
      result, x, y = go_up(result, x, y)
    end
    result
  end

  private

  def go_right(result, x, y)
    while item = data[x][y]
      result << item
      data[x][y] = nil
      y += 1
    end
    return result, x + 1, y - 1
  end

  def go_down(result, x, y)
    while data[x] && item = data[x][y]
      result << item
      data[x][y] = nil
      x += 1
    end
    return result, x - 1, y - 1
  end

  def go_left(result, x, y)
    while item = data[x][y]
      result << item
      data[x][y] = nil
      y -= 1
    end
    return result, x - 1, y + 1
  end

  def go_up(result, x, y)
    while data[x] && item = data[x][y]
      result << item
      data[x][y] = nil
      x -= 1
    end
    return result, x + 1, y + 1
  end

  def data_size
    @data_size ||= data.flatten.size
  end

end
