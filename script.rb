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
    solve_subsequence(0)
  end

  protected

    def solve_subsequence(from)
      return 1 if from == @sequence.size

      # Memoize the calls to solve_subsequence
      return @_memory[from] if @_memory.has_key?(from)

      possibilities = 0
      for size in (@dict.min_size..@dict.max_size)
        morse = @sequence[from, size]
        count = @dict.count(morse)
        if count > 0
          possibilities += count * solve_subsequence(from + size)
        end
      end

      @_memory[from] = possibilities
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
