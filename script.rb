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

$possibilities_stats = {calls: 0, nodes: 0, cuts: 0, match: 0, unmatch: 0}
$possibilities_memory = {}
def possibilities(seq)
  $possibilities_stats[:calls] += 1
  return 1 if seq.size == 0

  if $possibilities_memory.has_key?(seq)
    $possibilities_stats[:cuts] += 1
    return $possibilities_memory[seq]
  end

  $possibilities_stats[:nodes] += 1

  result = $dico.reduce(0) do |total, word|
    if word == seq[0, word.size]
      total += possibilities(seq[word.size, seq.size - word.size])
      $possibilities_stats[:match] += 1
    else
      $possibilities_stats[:unmatch] += 1
    end
    total
  end

  $possibilities_memory[seq] = result
end

puts possibilities($sequence)
STDERR.puts $possibilities_stats.inspect
