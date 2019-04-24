require'pry'

class Board
  attr_accessor :grid
  def initialize
    grid = [[]]
    100.times do |x|
      grid[x] = []
      100.times do |y|
        grid[x] << "off"
      end
    end
    @grid = grid
  end


  def compare(x, y)
    if x>=0 && y>=0 && x<100 && y<100
      if @grid[x][y] == "on"
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def countNeighbors(x, y)
    count = 0
    if compare(x-1,y-1) then count += 1 end
    if compare(x,y-1) then count += 1 end
    if compare(x+1,y-1) then count += 1 end
    if compare(x-1,y) then count += 1 end
    if compare(x+1,y) then count += 1 end
    if compare(x-1,y+1) then count += 1 end
    if compare(x,y+1) then count += 1 end
    if compare(x+1,y+1) then count += 1 end
    return count
  end

  def stepForward
    tempgrid = @grid.clone
    100.times do |x|
      100.times do |y|
        neighbors = countNeighbors(x, y)
        if neighbors == 3 && tempgrid[x][y] == "off"
          tempgrid[x][y] = "on"
        end
        if neighbors < 2 && tempgrid[x][y] == "on"
          tempgrid[x][y] = "off"
        end
        if neighbors > 3 && tempgrid[x][y] == "on"
          tempgrid[x][y] = "off"
        end
      end
    end
    @grid = tempgrid
  end

  def toggleTile(x, y)
    if @grid[x][y] == "off"
      @grid[x][y] = "on"
    else
      @grid[x][y] = "off"
    end
  end
end
