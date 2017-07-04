defmodule Cards do
  @moduledoc """
    Provide method for creating and handling deck of cards
  """

  @doc """
  Return a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace","King","Ten","Jacks","Queens","Six"]
    suits = ["Heart","Clubs","Diamond","Spade"]

    for value <- values , suit <- suits do
      "#{value} of #{suit}"
    end
  end

    def shuffle(deck) do
      Enum.shuffle(deck)
    end

    def contains?(deck,card) do
      Enum.member?(deck,card)
    end
  @doc """
    Divide the deck into a hand and the remainder of the deck .
    the `hand_size` arguments indicate how many cards should be in the hand.
  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
    def deal(deck,hand_size) do
      Enum.split(deck,hand_size)
    end

    def save(deck, filename) do
       binary = :erlang.term_to_binary(deck)
       File.write(filename, binary)
   end

   def load(filename) do
     case File.read(filename) do
       {:ok, binary} -> :erlang.binary_to_term binary
       {:error, _reason} -> "That file does not exist"
     end
   end

   def create_hand(hand_size) do
     Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
   end
end
