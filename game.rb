require './player'
require './question'

class Game

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
  end

  def print_response(result)

    if result == true
      print "YES! You are correct!\n"
    else
      print "NO! You are incorrect!\n"
    end

  end

  def print_score(first_player, second_player)
    print "CURRENT LIVES LEFT #{first_player.name}: #{first_player.lives_left}/3 vs #{second_player.name} #{second_player.lives_left}/3\n\n ----- NEW TURN -----\n\n"
  end

  def loop(first_player, second_player)
    @player_turn = 0
    game_over = false

    while game_over == false do
      current_player = @player_turn == 0 ? first_player : second_player
      other_player = @player_turn == 1 ? first_player : second_player

      question = Question.new

      prompt = question.ask_question(current_player.name)

      print prompt

      player_answer = $stdin.gets.chomp.to_i

      result = question.matches_answer(player_answer)

      self.print_response(result)

      if result == false
        current_player.lose_life()

        # check if player is dead
        if current_player.check_dead()
          print "#{other_player.name} wins with a score of #{other_player.lives_left}\n\n"
          print "----- GAME OVER -----\n\n"
          print "Goodbye!\n"
          game_over = true
        end
      end

      if game_over == false
        self.print_score(first_player, second_player)
      end

      if @player_turn == 0
        @player_turn = 1
      else
        @player_turn = 0
      end
    end
  end

  def start
    print "GAME START\n\n"
    print "Welcome to The Game. Remember... if you die in here, you die in real life! Muahahahaha...\n\n"

    self.loop(@player1, @player2)

  end

end


game1 = Game.new

game1.start

# game contains everything needed for a single round of the game
# Holds current turn (game loop), players, and questions
# Methods: start: initializes player1 and player2 and then ask_questions until player1 or player2's lives left = 0