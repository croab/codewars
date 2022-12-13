class Sudoku
  def initialize(data)
    @blocks = data
    grid_size = data.size
    number_row_or_col = Math.sqrt(data.size)

    row_array = []
    row_number = 0
    start_of_slice = 0
    data.each_with_index do |block1, index|
      data.each do |block2|
        # p block2
        row_fraction = block2.slice(start_of_slice, number_row_or_col)
        # p row_fraction
        row_array.push(row_fraction)
      end
      index % number_row_or_col == 1 ? start_of_slice = 0 : start_of_slice += number_row_or_col
    end
    row_array = row_array.each_slice(number_row_or_col).to_a
    @rows = row_array.map {|array| array.flatten}
    # Use transpose?
    column_array = []
    column_number = 0
    start_of_slice = 0
    data.each_with_index do |block1, index|
      data.each do |block2|
        # p block2
        column_fraction = block2.slice(start_of_slice, number_row_or_col)
        # p column_fraction
        column_array.push(column_fraction)
      end
      index % number_row_or_col == 1 ? start_of_slice = 0 : start_of_slice += number_row_or_col
    end
    column_array = column_array.each_slice(number_row_or_col).to_a
    @columns = column_array.map {|array| array.flatten}
  end
  def valid?
    p @columns
  end
end

item = Sudoku.new([
  [7,8,4,  1,5,9,  3,2,6],
  [5,3,9,  6,7,2,  8,4,1],
  [6,1,2,  4,3,8,  7,5,9],

  [9,2,8,  7,1,5,  4,6,3],
  [3,5,7,  8,4,6,  1,9,2],
  [4,6,1,  9,2,3,  5,8,7],

  [8,7,6,  3,9,4,  2,1,5],
  [2,4,3,  5,6,1,  9,7,8],
  [1,9,5,  2,8,7,  6,3,4]
])

item.valid?