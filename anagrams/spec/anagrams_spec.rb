require "anagrams"

describe "#find_anagrams" do

  it "should return an array of anagrams from a list (array)" do
    list = %w[ knee keen kene knot knut ]
    expected_result = %w[ keen kene ]
    test = find_anagrams("knee", list)
    expect(test).to eq(expected_result)
  end

end
