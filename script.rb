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

class Word
  attr_reader :morse

  def initialize(ascii_text)
    @morse = ''
    ascii_text.each_char{ |char| @morse << $ascii_morse_mapping.fetch(char) }
  end
end

class Dictionnary
  def initialize
    @_hash = {}
  end

  def push(word)
    @_max_size = nil
    @_min_size = nil
    morse = word.morse
    @_hash[morse] = count(morse) + 1
  end

  def count(morse)
    @_hash[morse] || 0
  end

  def max_size
    @_max_size ||= @_hash.keys.max_by(&:size).size
  end

  def min_size
    @_min_size ||= @_hash.keys.min_by(&:size).size
  end
end

class Problem
  def initialize(dict, sequence)
    @dict     = dict
    @sequence = sequence
    @_memory  = {}
  end

  def solve
    solve_subsequence(@sequence)
  end

  protected

    def solve_subsequence(seq)
      return 1 if seq.size == 0

      # Memoize the calls to solve_subsequence
      return @_memory[seq] if @_memory.has_key?(seq)

      possibilities = 0
      min = @dict.min_size
      max = [@dict.max_size, seq.size].min
      for size in (min..max)
        count = @dict.count(seq[0, size])
        if count > 0
          possibilities += count * solve_subsequence(seq[size, seq.size - size])
        end
      end

      @_memory[seq] = possibilities
    end
end

sequence = gets.chomp
dict     = Dictionnary.new

# Fill the dictionnary
gets.to_i.times { dict.push Word.new(gets.chomp) }

# Solve the problem
problem  = Problem.new(dict, sequence)
solution = problem.solve

# Print the solution
puts solution
