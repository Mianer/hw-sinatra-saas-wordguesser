class WordGuesserGame

  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/wordguesser_game_spec.rb pass.

  # Get a word from remote "random word" service

  def initialize(word)
    @word = word
    @guesses=""
    @wrong_guesses=""
  end

  # You can test it by installing irb via $ gem install irb
  # and then running $ irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> WordGuesserGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

  # guess函数实现以下功能：
  # 1.判断输入的字符是否合法
  # 2.大小写不敏感-》将大写字母转成小写字母
  # 3.把猜对的字母添加进guesses列表中,猜错的字母添加进wrong_guesses列表中，返回true
  # 4.重复的字母返回false
  def guess(ch)
    unless ch =~ /[a-zA-Z]/
      raise ArgumentError
    end
    ch = ch.downcase

    if @word.include? ch and !(@guesses.include? ch)
        @guesses << ch
        true
    elsif !(@word.include? ch) and !(@wrong_guesses.include? ch)
      @wrong_guesses << ch
      true
    elsif (@guesses.include? ch) or (@wrong_guesses.include? ch)
      false
    end
  end

  # word_with_guesses函数实现以下功能：
  # 将每一轮的猜词结果存入display_guesses，word中猜对的字母显示，其他字母用-表示
  def word_with_guesses
    display_guesses = ""
    @word.chars do |letter|
      if @guesses.include? letter
        display_guesses << letter
      else
        display_guesses << '-'
      end
    end
    display_guesses
  end

  # check_win_or_lose实现以下功能：
  # 1.全部猜对返回:win
  # 2.猜错字母数达到7返回:lose
  # 3.不是1/2继续进行游戏，返回:play
  def check_win_or_lose
    if self.word_with_guesses == @word
      :win
    elsif @wrong_guesses.length >=7
      :lose
    else
      :play
    end
  end

end
