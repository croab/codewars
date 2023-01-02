class PokerHand

  CARD_VALS = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  def initialize(hand)
    @hand_array_simple = hand.split(" ")
    @hand_array_detailed = @hand_array_simple.map{ |card| [card[0], card[1]] }
    # Hash of keys and number of their occurances
    @hand_hash = hashify_hand(@hand_array_detailed)
    # Type is returned as int
    @hand_type = hand_type(@hand_array_detailed, @hand_hash)
  end

  def compare_with(other)
    other_array_detailed = other.split(" ").map{ |card| [card[0], card[1]] }
    other_hash = hashify_hand(other_array_detailed)
    other_type = hand_type(other_array_detailed, other_hash)
    # p @hand_type
    # p other_type
    if @hand_type > other_type
      return "Win"
    elsif @hand_type < other_type
      return "Loss"
    elsif @hand_type == other_type
      return compare_equal_types(@hand_array_detailed, other_array_detailed)
    end
  end

  private

  def hashify_hand(hand_array_detailed)
    hand_hash = {}
    hand_array_detailed.each do |card_array|
      hand_hash.key?(card_array[0]) ? hand_hash[card_array[0]] += 1 : hand_hash[card_array[0]] = 1
    end
    return hand_hash
  end

  def hand_type(hand_array_detailed, hand_or_other_hash)
    hand_values = hand_array_detailed.map { |card| CARD_VALS[card[0]]}
    # p hand_values
    hand_suits = hand_array_detailed.map { |card| card[1]}
    num_pairs = 0
    num_triplets = 0
    num_quadruplets = 0
    consecutive = hand_values.sort.each_cons(2).all? { |x,y| y == x + 1 }
    same_suit = hand_suits.all? { |suit| hand_suits[0] == suit }
    hand_or_other_hash.values.each do |val|
      if val == 2
        num_pairs += 1
      elsif val == 3
        num_triplets += 1
      elsif val == 4
        num_quadruplets += 1
      end
    end
    if (hand_values.uniq.size == hand_values.size && hand_suits.uniq.size > 1)
      p "1"
      return 1
    elsif num_pairs == 1 && num_triplets == 0
      p "2"
      return 2
    elsif num_pairs == 2
      p "3"
      return 3
    elsif num_triplets == 1 && num_pairs == 0
      p "4"
      return 4
    elsif consecutive && !same_suit
      p "5"
      return 5
    elsif same_suit && !consecutive
      p "6"
      return 6
    elsif num_pairs == 1 && num_triplets == 1
      p "7"
      return 7
    elsif num_quadruplets == 1
      p "8"
      return 8
    elsif same_suit && consecutive
      p "9"
      return 9
    end
  end

  def compare_equal_types(hand_array_detailed, other_array_detailed)

  end
end

new_hand = PokerHand.new("1S 2H 2H 6H 6H")
# new_hand2 = PokerHand.new("2H 3H 2H 5H 6H")
p new_hand.compare_with("KS AS TS QS JS")

#  NEED TO CONVERT K A Q ETC INTO NUMBERS