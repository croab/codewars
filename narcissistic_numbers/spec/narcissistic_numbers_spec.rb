require "narcissistic_numbers"

describe "#narcissistic?" do

  it "should return true for single-digit integers" do
    single_digit_number = rand(9)
    expect(narcissistic?(single_digit_number)).to be_truthy
  end

  it "should return true for a value of 153" do
    expect(narcissistic?(153)).to be_truthy
  end

  it "should return false for a value of 153" do
    expect(narcissistic?(1633)).to be_falsey
  end

end
