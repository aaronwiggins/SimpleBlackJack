require './deck'
require './player'
require './dealer'

class CardGame
    attr_accessor :card_value_key

    # CARDS_IN_DECK = 52.freeze!

    def initialize
        @cards_in_deck = 52
        @player_count = 5
        @players = []
        @dealer_count = 1
        @dealer = []
        # @card_value_key = card_value_key
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
                player.create_hand(card_for_player)
            end
            # deal to dealer last
            card_for_dealer = the_deck.get_card_from_deck
            # only one dealer
            @dealer[0].create_hand(card_for_dealer)
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
        # can also create the hash with assigning it to a variable and it'd return
        # "values" would return without using the word "return"
        # return values
    end

    def evaluate_card_values
        # hash object to determine value of cards
        card_key = card_value_key
        all_participants = (@players << @dealer[0])# if not using dealer[0], need to flatten
        participants_with_scores = {}
        # {
        #     "Player1": "12"},
        #     "Player2": "13"}
        # }
        # return the numeric value of the card (suit doesnt matter)
        # build hash
        all_participants.each_with_index do |person, index| 
            values = person.card_values
            participants_with_scores["#{person.show_name}"] = values.map{|val| card_key[val]}.reduce(:+)
        end
        # sort everyone by score
        sorted_participants = participants_with_scores.sort_by {|k, v| -v}
        # [["player1", "12"],["player2","12"]]
        # call function to output scores
        show_final_participant_scores(sorted_participants)
        # call function to output the winner
        declare_winner(sorted_participants)
    end

    def show_final_participant_scores(final_hands)
        $stdout.puts "Final Hand Totals #{final_hands}"
    end

    def declare_winner(sorted_participants)
        ties = []
        sorted_participants.each_with_index{ |item, index|
                if index == sorted_participants.length-1
                    break
                end
                if sorted_participants[index][1] == sorted_participants[index + 1][1] 
                    ties << item << sorted_participants[index + 1]
                end   
        }

        # puts "ties: #{ties.uniq}"# quick and dirty way to figure ties and unique values
        # would get issue if there were 3 ties sequentially 

        if ties.length > 0
            ties.uniq!
            $stdout.puts "these are the ties: #{ties}"
            if ties[0].include?(sorted_participants[0][0]) 
                # if first tie number matches first in list of final scores, the winners tied
                 $stdout.puts "winners tied"
                 winning_value = ties[0][1]#winning value
                 puts "winning_value: #{winning_value}"
                 potato = []
                 tied_winners = ties.select{ |item| item[1] == winning_value }
                 puts tied_winners
            else
                $stdout.puts "not a winner tie"
                really_log_the_winner(sorted_participants)
            end
        else
            really_log_the_winner(sorted_participants)
        end
       
        # puts sorted_participants.length
        
        # winner = sorted_participants.first
        # $stdout.puts "first participan #{winner}"
        # $stdout.puts "The winner is #{winner[0]} with a score of #{winner[1]}"
    end

    def really_log_the_winner(participant_results)
        winner = participant_results.first
        if winner[0].include? "Player"
            $stdout.puts "Good job, you beat the dealer! #{winner[0]} with a score of #{winner[1]}"
        else 
            $stdout.puts "The Dealer Wins"
        end
    end

end
