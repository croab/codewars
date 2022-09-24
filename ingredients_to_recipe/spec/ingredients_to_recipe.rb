# require "supermarket_queue"

# describe "#queue_time" do

#   it "should return 0 if 1 till is open and an empty array is provided" do
#     time_minutes = queue_time([], 1)
#     expect(time_minutes).to eq 0
#   end

#   it "should return 5 if 1 till is open and an array of [5] is provided" do
#     time_minutes = queue_time([5], 1)
#     expect(time_minutes).to eq 5
#   end

#   it "should return 3 if 5 tills are open and an array of [2] is provided" do
#     time_minutes = queue_time([3], 5)
#     expect(time_minutes).to eq 3
#   end

#   it "should return 21 if 1 till is open and an array of [1,2,3,4,5,6] is provided" do
#     time_minutes = queue_time([1,2,3,4,5,6], 1)
#     expect(time_minutes).to eq 21
#   end

#   it "should return 6 if 88 tills are open and an array of [1,2,3,4,5,6] is provided" do
#     time_minutes = queue_time([1,2,3,4,5,6], 88)
#     expect(time_minutes).to eq 6
#   end

#   it "should return 9 if 2 tills are open and an array of [2,2,3,3,4,4] is provided" do
#     time_minutes = queue_time([2,2,3,3,4,4], 2)
#     expect(time_minutes).to eq 9
#   end
# end
