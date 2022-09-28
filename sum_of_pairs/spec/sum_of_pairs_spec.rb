require "sum_of_pairs"

describe "#sum_pairs" do

  it "should return [1, 7] when the sum is 8 and the array is [1, 4, 8, 7, 3, 15]" do
    array = [1, 4, 8, 7, 3, 15]
    sum = 8
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [1, 7]
  end

  it "should return [1, -6] when the sum is -5 and the array is [1, -2, 3, 0, -6, 1]" do
    array = [1, -2, 3, 0, -6, 1]
    sum = -5
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [1, -6]
  end

  it "should return nil when the sum is 30 and the array is [20, -13, 40]" do
    array = [20, -13, 40]
    sum = 30
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to be_nil
  end

  it "should return [1, 4] when the sum is 5 and the array is [1, 2, 3, 4, 1, 0]" do
    array = [1, 2, 3, 4, 1, 0]
    sum = 5
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [1, 4]
  end

  it "should return [5, 3]] when the sum is 8 and the array is [10, 5, 2, 3, 7, 5]" do
    array = [10, 5, 2, 3, 7, 5]
    sum = 8
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [5, 3]
  end

  it "should return [-2, 3] when the sum is 1 and the array is [4, -2, 3, 3, 4]" do
    array = [4, -2, 3, 3, 4]
    sum = 1
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [-2, 3]
  end

  it "should return [2] when the sum is 2 and the array is [0, 2, 0]" do
    array = l7= [0, 2, 0]
    sum = 2
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [2]
  end

  it "should return [13, -3] when the sum is 10 and the array is [5, 9, 13, -3]" do
    array = l7= [0, 2, 0]
    sum = 10
    pair_of_values = sum_pairs(array, sum)
    expect(pair_of_values).to eq [13, -3]
  end
end
