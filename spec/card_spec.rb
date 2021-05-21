# require_relative '../library'
require_relative '../Card'

require 'yaml'
describe Card do

    before :each do
        @card = Card.new(:suit => "Spade", :value => "5")
    end

    describe "#new" do
        it "takes 1 parameters and returns a Book object" do
            @card.should be_an_instance_of Card
        end
    end
end