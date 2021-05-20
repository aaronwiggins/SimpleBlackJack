require './blackjackparticipant'
# dealer created as separate class in case additional, unique functionality was needed
class Dealer < BlackJackParticipant
    # attr_accessor :me
    def initialize(name)
        # @me = BlackJackParticipant.new(name)
        super
    end

    # def assign_card(card)
    #     create_hand(card)
    #     # @me.create_hand(card)
    # end

    # def return_card_values
    #     card_values
    # end
    
    # def show_name
    #     @me.show_name
    # end
end