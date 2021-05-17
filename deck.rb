require './card'
class Deck
    def initialize
        @deck = []
        @card_values = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
        @suits = ["Diamonds", "Hearts", "Spades", "Clubs"]
        build_deck
    end

    def build_deck
        @card_values.each do |card_value|
            @suits.each do |suit_name|
                card = Card.new(suit_name, card_value)
                @deck << card
            end
        end
        suffle_deck
    end

    def suffle_deck
        @deck.shuffle!
    end

    def show_deck
        # used this just to make sure building the deck works as expected
        # not used in the game
        @deck.each { |card| $stdout.puts card.display_card }
    end

    def get_card_from_deck
        @deck.shift()
    end
end
