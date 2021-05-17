# testing
# puts "I'm here"
# thoughts on how to run game
# class called Game which has basci properties of blackjack
    # number of cards/deck
    # number of cards to deal
    # has many players (5)
    # has one dealer
    # deal order
    # will list out hand/score of each player after everyone has been dealt
    # will announce winner (player or dealer)
require './deck'
require './player'
require './dealer'

class CardGame

    def initialize
        @cards_in_deck = 52
        @player_count = 5
        @players = []
        @dealer_count = 1
        @dealer = []
        @card_value_key = card_value_key
        init_deck
    end

    def hello_game
        $stdout.puts "Welcome to BlackJack: #{@players} players, #{@dealer} dealer"
    end

    def init_deck
        # this function will call methods to start and finish the game
        # Deck.new
        the_deck = Deck.new
        # create players
        init_players
        # create dealer
        init_dealer
        # need to deal cards to players randomly, then the dealer
        deal_the_deck_to_everyone(the_deck)
        #start determining values of each participants hand
        evaluate_card_values
    end

    def init_players
        # create a new player for the amount of players in the game
        (1..@player_count).each { |index| @players << Player.new("Player#{index}") }
    end

    def init_dealer
        # create one dealer
        @dealer << Dealer.new('The Dealer')
    end

    def deal_the_deck_to_everyone(the_deck)
        # shuffle deal order (round robin?), but always give card to dealer last
        # @players.shuffle! 
        # 2 cards per player
        $stdout.puts "Dealing the cards"
        2.times do |count|
            @players.each_with_index do |player, index| 
                card_for_player = the_deck.get_card_from_deck
                player.assign_card(card_for_player)
            end
            # deal to dealer last
            card_for_dealer = the_deck.get_card_from_deck
            # only one dealer
            @dealer[0].assign_card(card_for_dealer)
        end
    end

    def card_value_key
        values = {
            "2" => 2,
            "3" => 3,
            "4" => 4,
            "5" => 5,
            "6" => 6,
            "7" => 7,
            "8" => 8,
            "9" => 9,
            "10" => 10,
            "J" => 10,
            "Q" => 10,
            "K" => 10,
            "A" => 11,
        }
        return values
    end

    def evaluate_card_values
        # hash object to determine value of cards
        card_key = card_value_key
        all_participants = (@players << @dealer).flatten
        participants_with_scores = {}
        # {
        #     "Player1": "12"},
        #     "Player2": "13"}
        # }
        # return the numeric value of the card (suit doesnt matter)
        # build hash
        all_participants.each_with_index do |person, index| 
            values = person.return_card_values
            participants_with_scores["#{person.show_name}"] = values.map{|val| card_key[val]}.reduce(:+)
        end
        # sort everyone by score
        sorted_participants = participants_with_scores.sort_by {|k, v| -v}
        # call function to output scores
        show_final_participant_scores(sorted_participants)
        # call function to output the winner
        declare_winner(sorted_participants)
    end

    def show_final_participant_scores(final_hands)
        $stdout.puts "Final Hand Totals #{final_hands}"
    end

    def declare_winner(sorted_participants)
        winner = sorted_participants.first
        $stdout.puts "The winner is #{winner[0]} with a score of #{winner[1]}"
        if winner[0].include? "Player"
            $stdout.puts "Good job, you beat the dealer!"
        else 
            $stdout.puts "The Dealer Wins"
        end
    end

end
