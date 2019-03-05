require "io/console"
system "clear"

puts "Press any two keys to pick a card... OR SPEAK VERY LOUDLY"

console = IO.console
input_1 = console.getch.downcase
input_2 = console.getch.downcase

input_1_mapping = {
  "a" => "A",
  "1" => "A",
  "2" => "2",
  "3" => "3",
  "4" => "4",
  "5" => "5",
  "6" => "6",
  "7" => "7",
  "8" => "8",
  "9" => "9",
  "0" => "T",
  "t" => "T",
  "j" => "J",
  "q" => "Q",
  "k" => "K",
  "?" => "?",
}

input_2_mapping = {
  "s" => "♠",
  "c" => "♣",
  "d" => "♦",
  "h" => "♥",
  "?" => "?",
}

CARD = <<~CARD
┌────────────┐
│%{num}           │
│            │
│    %{suit}%{suit}%{suit}     │
│    %{suit}%{suit}%{suit}     │
│    %{suit}%{suit}%{suit}     │
│            │
│          %{num} │
└────────────┘
CARD

def format_card(num, suit)
  format(CARD, num: num, suit: suit)
end

num = input_1_mapping.fetch(input_1, input_1_mapping.values.sample)
suit = input_2_mapping.fetch(input_2, input_2_mapping.values.sample)

puts format_card(num, suit)
