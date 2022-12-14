defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    :world
  end
end
defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    cards = ["King", "Queen", "Jack"]
    suits =  ["Diamonds", "Clubs", "Hearts", "Spades"]

    for card <- cards, suit <- suits do
      "#{card} of #{suit}"
    end
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. `hand_size` indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["King of Diamonds"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Returns a deck with its cards shuffled.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a card is present in a deck.

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "King of Diamonds")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Saves a deck to a binary file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads and returns a file.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file #{filename} does not exist."
    end
  end

  @doc """
    Reference `Cards.create_deck`, `Cards.shuffle`, and `Cards.deal`.
  """
  def create_hand(hand_size) do
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end
end
