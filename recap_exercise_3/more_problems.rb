# no_dupes?

# Write a method no_dupes?(arr) that accepts an array as an arg and
# returns an new array containing the elements that were not repeated
# in the array.

def no_dupes?(arr)
    output = {}
    res = []
    arr.each do |ele|
        if output.include?(ele)
            output[ele] += 1
        else
            output[ele] = 1
        end
    end
    output.each do |k, v|
        if v == 1
            res << k
        end
    end
    res
end

p 'running no_dupes?...'
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
p 'no_dupes? ran...'


# no_consecutive_repeats?

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
# The method should return true if an element never appears consecutively in the array;
# it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

p 'running no_consecutive_repeats?...'
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
p 'no_consecutive_repeats? ran...'



# char_indices

# Write a method char_indices(str) that takes in a string as an arg.
# The method should return a hash containing characters as keys.
# The value associated with each key should be an array containing
# the indices where that character is found.

def char_indices(str)
    output = Hash.new{|k, v| k[v] = []}
    str.each_char.with_index do |char, idx|
        output[char] << idx
    end
    output
end

p 'running char_indices...'
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
p 'char_indices ran...'

# longest_streak

# Write a method longest_streak(str) that accepts a string as an arg. The method should return the
# longest streak of consecutive characters in the string. If there are any ties,
# return the streak that occurs later in the string.

def longest_streak(str)
    output = Hash.new(0)
    str.each_char do |char|
        if output.include?(char)
            output[char] += 1
        else
            output[char] = 1
        end
    end
    res = []
    output.map do |k, v|
        res << k * v
    end
    res.max
end

p 'running longest_streak...'
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
p 'longest_streak ran...'


# bi_prime?

# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating
# whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained
# by multiplying two prime numbers.

def bi_prime?(num)
    (2...num).each do |i|
        (2...num).each do |j|
            if i * j == num && prime?(i) && prime?(j)
                return true
            end
        end
    end
    false
end


def prime?(num)
    return false if num < 2
    (2...num).none?{|ele| num % ele == 0}
end

p 'running bi_prime?...'
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
p 'bi_prime? ran...'



# vigenere_cipher

# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word
# by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s,
# and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used.
# For example, if we encrypt "bananasinpajamas" with the key sequence [1, 2, 3],
# then the result would be "ccqbpdtkqqcmbodt":

def vigenere_cipher(word, char)
    output = ''
    alph = ('a'..'z').to_a
    word.each_char.with_index do |letter, i|
        if alph.include?(letter)
            last_index = alph.index(letter)
            new_index = last_index + char[i % char.length]
            output += alph[new_index % alph.length]
        end
    end
    output
end

p 'running vigenere_cipher...'
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"
p 'vigenere_cipher ran...'



# vowel_rotate

# Write a method vowel_rotate(str) that accepts a string as an arg and
# returns the string where every vowel is replaced with the vowel that
# appears before it sequentially in the original string. The first vowel
# of the string should be replaced with the last vowel.

def vowel_rotate(str)
    output = ''
    new_str = str[0..-1]
    vowels = 'aeiou'
    new_indeces = (0...str.length).select{|i| vowels.include?(str[i])}
    new_vowel_indeces = new_indeces.rotate(-1)


    new_indeces.each.with_index do |idx, i|
        new_index = str[new_vowel_indeces[i]]
        new_str[idx] = new_index
    end
    new_str
end


p 'running vowel_rotate...'
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
p 'vowel_rotate ran...'



# String#select

# Extend the string class by defining a String#select method that accepts a block.
# The method should return a new string containing characters of the original string
# that return true when passed into the block. If no block is passed, then return the
# empty string. Do not use the built-in Array#select in your solution.



# String#map!

# Extend the string class by defining a String#map! method that accepts a block.
# The method should modify the existing string by replacing every character with
# the result of calling the block, passing in the original character and it's index
#  Do not use the built-in Array#map or Array#map! in your solution.


class String
    def select(&blk)
        return '' if blk.nil?
        output = ''
        self.each_char do |ele|
            if blk.call(ele)
                output += ele
            end
        end
        output
    end

    def map!(&blk)
        self.each_char.with_index do |ele, i|
            self[i] = blk.call(ele, i)
        end
        self
    end

end
p 'running select...'
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
p 'select ran...'

word_1 = "Lovelace"
word_1.map! do |ch|
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p 'running map!'
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"
p 'map! ran...'





# Recursion Problems
# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        -(a + multiply(a, (-b) - 1))
    else
        a + multiply(a, b - 1)
    end

end

p 'running multiply...'
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
p 'multiply ran...'


# lucas_sequence
# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2.
# The second number of the Lucas Sequence is 1. To generate the next number of the sequence,
# we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg.
# The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

def lucas_sequence(num)
    output = []
    if num == 0
        return []
    elsif num == 1
        return [2]
    elsif num == 2
        return [2, 1]
    end

    seq = lucas_sequence(num - 1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele

end

p 'running lucas_sequence...'
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
p 'lucas_sequence ran...'

# prime_factorization

# The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be
# represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and returns an array representing the
# prime factorization of the given number. This means that the array should contain only prime numbers
# that multiply together to the given num. The array returned should contain numbers in ascending order. Do this recursively.

def prime_factorization(num)
    (2...num).each do |fact|
        if num % fact == 0
            output = num / fact
            return [*prime_factorization(fact), *prime_factorization(output)]
        end
    end
    [num].flatten
end

p 'running prime_factorization...'
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
p 'prime_factorization ran...'
