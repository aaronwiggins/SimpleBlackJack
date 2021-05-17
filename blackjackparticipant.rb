
class BlackJackParticipant

    def initialize(name)
        @name = name
        @cards_in_hand = 0
    end

    def create_hand(card = '')
        if @cards_in_hand == 0
             @card_one = card
             display_card_value(@card_one)
        end
        if @cards_in_hand == 1
            @card_two = card
            display_card_value(@card_two)
        end
        
        @cards_in_hand += 1
    end

    def display_card_value(card)
        $stdout.puts "#{show_name}: "
        $stdout.puts "#{card.display_card}"
    end

    def card_values
        value_array = [@card_one.return_card_value, @card_two.return_card_value]
        return value_array
    end

    def show_name
        return @name
    end
    # def fetch_name
    # # would like this to work and have inherited classes call super to reduce redunancy
    #     return @name
    # end

end