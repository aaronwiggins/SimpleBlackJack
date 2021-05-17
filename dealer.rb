require './blackjackparticipant'
# dealer created as separate class in case addistional, unique functionality was needed
class Dealer < BlackJackParticipant
    
    def initialize(name)
        @me = BlackJackParticipant.new(name)
    end

    def assign_card(card)
        @me.create_hand(card)
    end

    def return_card_values
        @me.card_values
    end
    
    def show_name
        @me.show_name
    end
end