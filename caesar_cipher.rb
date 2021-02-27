require 'pry'

def caesar_cipher(string, shift)
  split_string = string.split("")
  
  def get_char_code(s)
    s.map do |char|
      char_code = char.ord
      if char_code < 65 || char_code > 122
        char_code = char
      else
        char_code
      end
    end
  end

  code_array = get_char_code(split_string)

  def code_shift(a, shift)
    a.map do |code|
      if code.is_a? Integer
        if code.between?(64, 91)
          code += shift
          if code > 91
            code -= 26
          else
            code
          end
        elsif code.between?(96, 123)
          code += shift
          if code > 122
            code -= 26
          else
            code
          end
        end
      else
        code
      end
    end
  end

  code_array = code_shift(code_array, shift)

  def get_chars_from_codes(array)
    array.map do |c|
      if c.is_a? Integer
        c = c.chr
      else
        c
      end
    end
  end

  new_string = get_chars_from_codes(code_array).join('')
  p new_string
end

caesar_cipher("Hello, world!", 5)