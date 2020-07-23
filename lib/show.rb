# frozen_string_literal: true

class Show
  def presentation
    print "Un premier joueur dessine son symbole sur une case.
    Puis c'est au tour de l'autre joueur de dessiner son symbole sur une case vide.
    Le but du jeu est de réussir à aligner ses trois symboles, on remporte alors la partie.\n"
  end

  def players_inscription
    puts 'Quel est le nom du premier joueur'
    print '> '
    player1_user_name = gets.chomp

    puts "Tu auras pour symbole la 'X'"
    sleep(0.3)
    puts 'Quel est le nom du deuxieme joueur'
    print '> '
    player2_user_name = gets.chomp

    puts "Tu auras pour symbole le 'O'"
    sleep(0.5)
    system 'clear'
    puts "Bienvenue #{player1_user_name} et #{player2_user_name}"
    [player1_user_name, player2_user_name]
  end

  def all_board(board)
    cells = '   ' + '-' * 19 + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    ' A ' + '|' + "  #{board.get_symbol(0)}  " + '|' + "  #{board.get_symbol(3)}  " + '|' + "  #{board.get_symbol(6)}  " + '|' + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    '   ' + '-------------------' + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    ' B ' + '|' + "  #{board.get_symbol(1)}  " + '|' "  #{board.get_symbol(4)}  " + '|' + "  #{board.get_symbol(7)}  " + '|' + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    '   ' + '-------------------' + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    ' C ' + '|' + "  #{board.get_symbol(2)}  " + '|' "  #{board.get_symbol(5)}  " + '|' + "  #{board.get_symbol(8)}  " + '|' + "\n" \
    '   ' + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + ' ' * 5 + '|' + "\n" \
    '   ' + '-------------------' + "\n" \
    '   ' + '   1   ' + '  2   ' + '  3   ' + "\n"
    print cells
  end

  def choose_board_case(player_name, turn)
    puts '=============='
    puts "Tour #{turn}"
    puts '=============='
    puts "#{player_name} choisi une case en entrant sa ligne suivi de sa colonne"
    puts 'exemple : B4'
    print '> '
    player_choice = gets.chomp

    limited_choice = /^[a-zA-Z]{1}[1-3]{1}$/

    if player_choice.length == 2 && player_choice =~ limited_choice
      return [player_choice[0].upcase, player_choice[1].to_i]
    end

    puts '*******# ERREUR MAUVAISE SAISIE #******* '
    sleep(1)
    puts `clear`
    false
  end
end
