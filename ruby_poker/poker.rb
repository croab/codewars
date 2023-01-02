class PokerHand

  def initialize(hand)
    @hand_array_simple = hand.split(" ")
    @hand_array_detailed = @hand_array_simple.map{ |card| [card[0], card[1]] }
    # Hash of keys and number of their occurances
    @hand_hash = hashify_hand(@hand_array_detailed)
    # Type is returned as int
    @hand_type = hand_type(@hand_array_detailed)
  end

  def compare_with(other)
    other_array_detailed = other.split(" ").map{ |card| [card[0], card[1]] }
    other_type = hand_type(other_array_detailed)
  end

  private

  def hashify_hand(hand_array_detailed)
    hand_hash = {}
    hand_array_detailed.each do |card_array|
      hand_hash.key?(card_array[0]) ? hand_hash[card_array[0]] += 1 : hand_hash[card_array[0]] = 1
    end
    return hand_hash
  end

  def hand_type(hand_array_detailed)
    hand_values = hand_array_detailed.map { |card| card[0]}
    hand_suits = hand_array_detailed.map { |card| card[1]}
    num_pairs = 0
    num_triplets = 0
    consecutive = hand_values.sort.each_cons(2).all? { |x,y| y.to_i == x.to_i + 1 }
    @hand_hash.values.each do |val|
      if val == 2
        num_pairs += 1
      elsif val == 3
        num_triplets += 1
      end
    end
    if (hand_values.uniq.size == hand_values.size && hand_suits.uniq.size > 1)
      return 1
    elsif num_pairs == 1
      return 2
    elsif num_pairs == 2
      return 3
    elsif num_triplets == 1
      return 4
    elsif consecutive
      p "5"
      return 5
    end
  end
end

new_hand = PokerHand.new("2H 3H 4H 5H 6H")
# new_hand2 = PokerHand.new("2H 3H 2H 5H 6H")
# new_hand.compare_with("KS AS TS QS JS")