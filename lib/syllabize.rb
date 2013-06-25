require "syllabize/version"

module Syllabize

  class Counter
    attr_accessor :word

    def initialize(word)
      @word = word
    end

    CONSONANTS = /[bcdfghjklmnpqrstvwxz]/i
    VOWELS = /[aeiou]/i
    LE_VOWEL_SOUND = /((le)\z)|((le(d|r|s))|(ling)\z)/i
    DIPHTHONGS = /ou|ie|oo|oi|ea|ee|ai|ae/i
    Y_AS_VOWEL = /[^yY][yY]/
    RE_VOWEL = /(^re[aeiou])/i

    def count_syllables
      syllables = count_vowels
      syllables -= 1 if ends_in_silent_e?
      syllables -= count_diphthongs if contains_diphthongs?
      syllables += count_ys_in_vowel_role if contains_non_initial_y?
      syllables += 1 if contains_le_vowel_sound?
      syllables += 1 if ends_in_sm?
      syllables <= 1 ? 1 : syllables
    end

    private

    def count_vowels
      word.scan(VOWELS).count
    end

    def ends_in_silent_e?
      word.downcase.each_char.to_a[-1] == 'e'
    end

    def contains_le_vowel_sound?
      word.scan(LE_VOWEL_SOUND).any?
    end

    def contains_non_initial_y?
      count_ys_in_vowel_role > 0
    end

    def count_ys_in_vowel_role
      word.scan(Y_AS_VOWEL).size
    end

    def begins_with_re_vowel?
      word.scan(RE_VOWEL).any?
    end

    def contains_diphthongs?
      word.downcase.scan(DIPHTHONGS).any?
    end

    def count_diphthongs
      word.downcase.scan(DIPHTHONGS).count
    end

    def ends_in_sm?
      word.end_with?('sm')
    end
  end

end
