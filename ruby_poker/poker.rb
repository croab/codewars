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
    if (hand_values.uniq.size == hand_values.size && hand_suits.uniq.size > 1 && !consecutive)
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
    hand_values = hand_array_detailed.map { |card| CARD_VALS[card[0]] }.sort_by { |num| -num }
    other_values = other_array_detailed.map { |card| CARD_VALS[card[0]] }.sort_by { |num| -num }
    p hand_values
    p other_values
    for i in 0...5
      if hand_values[i] > other_values[i]
        return "Win"
      elsif hand_values[i] < other_values[i]
        return "Loss"
      end
    end
    return "Tie"
  end
end

p "Expect loss"
p PokerHand.new("2H 3H 4H 5H 6H").compare_with("KS AS TS QS JS")
p "Expect win"
p PokerHand.new("2H 3H 4H 5H 6H").compare_with("AS AD AC AH JD")
p "Expect win"
p PokerHand.new("AS AH 2H AD AC").compare_with("JS JD JC JH 3D")
p "Expect loss"
p PokerHand.new("2S AH 2H AS AC").compare_with("JS JD JC JH AD")
p "Expect win"
p PokerHand.new("2S AH 2H AS AC").compare_with("2H 3H 5H 6H 7H")
p "Expect win"
p PokerHand.new("AS 3S 4S 8S 2S").compare_with("2H 3H 5H 6H 7H")
p "Expect win"
p PokerHand.new("2H 3H 5H 6H 7H").compare_with("2S 3H 4H 5S 6C")
p "Expect tie"
p PokerHand.new("2S 3H 4H 5S 6C").compare_with("3D 4C 5H 6H 2S")
p "Expect win"
p PokerHand.new("2S 3H 4H 5S 6C").compare_with("AH AC 5H 6H AS")
p "Expect loss"
p PokerHand.new("2S 2H 4H 5S 4C").compare_with("AH AC 5H 6H AS")
p "Expect win"
p PokerHand.new("2S 2H 4H 5S 4C").compare_with("AH AC 5H 6H 7S")
p "Expect loss"
p PokerHand.new("6S AD 7H 4S AS").compare_with("AH AC 5H 6H 7S")
p "Expect loss"
p PokerHand.new("2S AH 4H 5S KC").compare_with("AH AC 5H 6H 7S")
p "Expect loss"
p PokerHand.new("2S 3H 6H 7S 9C").compare_with("7H 3C TH 6H 9S")
p "Expect win"
p PokerHand.new("4S 5H 6H TS AC").compare_with("3S 5H 6H TS AC")
p "Expect tie"
p PokerHand.new("2S AH 4H 5S 6C").compare_with("AD 4C 5H 6H 2C")