@num1 = 0
@num2 = 0
@sum = @num1 + @num2
@players = [{lives: 3, points: 0, name: "Adam"}, #index 0
            {lives: 3, points: 0, name: "Min"}   #index 1
            ]
#@players[0] for first player, @players[1] for second player
#@players[0][:lives] to access the first player's lives

@whose_turn = 0 
# used to access the correct player, depending on turn
# @players[@whose_turn]

@players[0][:name]


def generate_question
  @num1 = rand(1..20)
  @num2 = rand(1..20)
  @sum = @num1 + @num2
  puts "#{@players[@whose_turn][:name]}, what is #{@num1} + #{@num2}?" 
   
end

#alternate @whose_turn between zero and one
def change_turn
  @whose_turn = (@whose_turn + 1) % 2 
  puts "Turn was changed to #{@whose_turn}"
end

def prompt_player_for_answer 
  puts "What is your answer?"
  gets.chomp.to_i
end   

def verify_answer
  answer = prompt_player_for_answer
  if answer == @sum #correct answer
    @players[@whose_turn][:points] = @players[@whose_turn][:points] + 1 
    puts "Congrats! You now have #{@players[@whose_turn][:points]} points."
  else #wrong answer 
    # puts @players[@whose_turn][:lives]
    @players[@whose_turn][:lives] = @players[@whose_turn][:lives] - 1
    puts "Boo! You now have #{@players[@whose_turn][:lives]} lives."
  end 
end 

while @players[0][:lives] > 0 && @players[1][:lives] > 0 do 
  puts generate_question
  puts verify_answer 
  change_turn
end
