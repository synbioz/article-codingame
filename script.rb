$ascii_morse_mapping = {
  'A' => '.-',
  'B' => '-...',
  'C' => '-.-.',
  'D' => '-..',
  'E' => '.',
  'F' => '..-.',
  'G' => '--.',
  'H' => '....',
  'I' => '..',
  'J' => '.---',
  'K' => '-.-',
  'L' => '.-..',
  'M' => '--',
  'N' => '-.',
  'O' => '---',
  'P' => '.--.',
  'Q' => '--.-',
  'R' => '.-.',
  'S' => '...',
  'T' => '-',
  'U' => '..-',
  'V' => '...-',
  'W' => '.--',
  'X' => '-..-',
  'Y' => '-.--',
  'Z' => '--..'
}

$sequence = gets.chomp
$dico = (1..gets.to_i).map do
  result = ''
  gets.chomp.each_char{ |char| result << $ascii_morse_mapping.fetch(char) }
  result
end

$possibilities_memory = {}
def possibilities(seq)
  return 1 if seq.size == 0
  return $possibilities_memory[seq] if $possibilities_memory.has_key?(seq)

  result = $dico.reduce(0) do |total, word|
    if word == seq[0, word.size]
      total += possibilities(seq[word.size, seq.size - word.size])
    end
    total
  end

  $possibilities_memory[seq] = result
end

puts possibilities($sequence)
