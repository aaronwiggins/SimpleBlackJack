class Card

    def initialize(card_suit, card_value)
        @card = {
            :suit => card_suit,
            :value => card_value
        }
        # @suit = card_suit
        # @value = card_value
        # these were separate values at first, combined to hash for single call to pull data
    end

    def display_card
        $stdout.puts "Card: #{@card[:value]} of #{@card[:suit]}"
    end

    def return_card_value
        return @card[:value]
    end
end

# example structure of @card
# @card = {
#     "suit" => "Spades",
#     "value" => "K"
# }