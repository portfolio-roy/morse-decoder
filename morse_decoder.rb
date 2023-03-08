MORSE_CODE = {
  '.-' => 'A',
  '-...' => 'B',
  '-.-.' => 'C',
  '-..' => 'D',
  '.' => 'E',
  '..-.' => 'F',
  '--.' => 'G',
  '....' => 'H',
  '..' => 'I',
  '.---' => 'J',
  '-.-' => 'K',
  '.-..' => 'L',
  '--' => 'M',
  '-.' => 'N',
  '---' => 'O',
  '.--.' => 'P',
  '--.-' => 'Q',
  '.-.' => 'R',
  '...' => 'S',
  '-' => 'T',
  '..-' => 'U',
  '...-' => 'V',
  '.--' => 'W',
  '-..-' => 'X',
  '-.--' => 'Y',
  '--..' => 'Z',
  '-----' => '0',
  '.----' => '1',
  '..---' => '2',
  '...--' => '3',
  '....-' => '4',
  '.....' => '5',
  '-....' => '6',
  '--...' => '7',
  '---..' => '8',
  '----.' => '9'
}.freeze

# Decode
# ======
def decode_char(morse_char)
  MORSE_CODE[morse_char]
end

def decode_word(morse_word)
  morse_word.split.map { |morse_char| decode_char(morse_char) }.join
end

def decode(message)
  message.split('   ').map { |morse_word| decode_word(morse_word) }.join(' ')
end

# Encode
# ======
MORSE_CODE_REVERSE = MORSE_CODE.invert.freeze
def encode_char(char)
  MORSE_CODE_REVERSE[char.upcase]
end

def encode_word(word)
  word.chars.map { |char| encode_char(char) }.join(' ')
end

def encode(message)
  message.split.map { |word| encode_word(word) }.join('   ')
end

# Example:
# irb -r ./morse_decoder.rb
#  > decode(".-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...")
#  => "A BOX FULL OF RUBIES"
# > encode("A BOX FULL OF RUBIES")
# => ".-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ..."
