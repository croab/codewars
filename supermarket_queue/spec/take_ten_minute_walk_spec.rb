# require "take_ten_minute_walk"

# describe "#convert_directions" do

#   it "should return the correct unit value going north" do
#     unit_value = convert_directions('n')
#     expect(unit_value).to eq 1
#   end

#   it "should return the correct unit value going west" do
#     unit_value = convert_directions('w')
#     expect(unit_value).to eq -1
#   end
# end

# describe "#is_valid_walk" do

#   it "should return false if the walk contains 3 directions" do
#     walk_possible = is_valid_walk(['n', 's', 'e'])
#     expect(walk_possible).to be_falsey
#   end

#   it "should return false if the walk does not end at the start point" do
#     walk_possible = is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])
#     expect(walk_possible).to be_falsey
#   end

#   it "should return true if the walk ends at the start point and if the walk contains 10 directions" do
#     walk_possible = is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])
#     expect(walk_possible).to be_truthy
#   end
# end
