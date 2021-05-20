require './blackjackparticipant'

class Player < BlackJackParticipant
    # attr_accessor :me

    def initialize(name)
        # @me = BlackJackParticipant.new(name)
        super
    end

    # def assign_card(card)
    #     create_hand(card)
    # end

    # def return_card_values
    #     # puts 'in person class'
    #     card_values
    #     # me.return_card_values
    #     # @me.card_values
    #     ## calling method on the parent class
    # end

    # def show_name
    #     @me.show_name
    # end

end

## would like to abstract methods into parent class, for player and dealer class