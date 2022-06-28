class Question

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def ask_question(player_name)
    "#{player_name}: What does #{@number1} + #{@number2} equal?\n"
  end

  def matches_answer(value)

    if value == @answer

      return true

    else

      return false

    end

  end

end