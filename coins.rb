# coins.rb
# CECS 424 by Philip Poppler


require 'io/console'


# Global variabbles initialized 
  $coins = "HHHHHTTTTT--"
  $arrows= "^           "

# 
# handle_input function
#
# Function that Waits until the user inputs a valid object within the array.
# Checks to see if the user is choosing the last index or a dash, which can't be chosen 
# The user also has to validate their answer, otherwise the arrow goes back to its previous position
# 
def handle_input
  # last arrows allows the arrow to return to its last position
  last_arrows = "^           "
  not_chosen = true
  while not_chosen
    # display 
    puts $coins
    puts $arrows
    puts "Enter the index you want to choose to swap with the dashes(You cannot choose the last index or the dashes): "
    # input and check validity 
    index = gets.chomp.to_i
    if $coins[index] != "-" && $coins[index+1] != "-" && index<11 && index >>0 
      # call movecursor using the index 
      move_cursor(index)
      puts $coins
      puts $arrows
      # confirm the answer 
      puts "Type Y or y to confirm your move, otherwise hit any other key to reset your action"
      key = gets.chomp 
      # if confirmed, change the position of the arrows, swap, and end the loop
      if key=="Y" || key=="y"
        last_arrows = $arrows
        swap(index)
        not_chosen= false
      # else reset the arrows, the user didn't choose the answer they want  
      else
      $arrows = last_arrows 
    end
    else
      puts "You cannot choose the last index or a dash"
    end
    
      
  end
end 


#
# swap function
#
# swaps the two given indexes within the coins string through converting it to an array 
# then swapping them with the dashes within the array
#
def swap(index)
  $coins = $coins.split("")
  # finding dash indexes
  dash1 = $coins.index("-")
  dash2 = $coins.rindex("-")

  # swapping
  $coins[index], $coins[dash1] = $coins[dash1], $coins[index]
  $coins[index+1], $coins[dash2] = $coins[dash2], $coins[index+1]
  $coins = $coins.join
end

#
# move_cursor function
#
# finds the cursor within the arrows string and then swaps the cursor with the 
# chosen input determined by the user 
#
def move_cursor(index)
  cursor = $arrows.index("^")
  $arrows[index], $arrows[cursor] = $arrows[cursor], $arrows[index]
end

#
# check_win_condition function
#
# checks to see whether or not the coins strings match the win conditions
#
#
def check_win_condition
  # delete the dashes 
  $coins = $coins.split("")
  $coins = $coins.delete_if {|x| x == "-"}
  $coins = $coins.join
  puts $coins
  win_conditions=["HTHTHTHTHT","THTHTHTHTH"]
  # compare win conditions with $coins 
  win_conditions.each {
    |win| if $coins == win 
      
      puts "Congratulations! You've done it!"
      return
    end
  }
  puts "You have run out of tries"
end

#
# play_game function
#
# plays the game and allows the user 5 options to win.
# also provides user with a description of the rules
#
def play_game
  puts "---------------------------------------------"
  puts "-----EVEN AND ODDS: A coin matching game-----" 
  puts "---------------------------------------------"
  puts "----Given the string: HHHHHTTTTT, can you----"
  puts "----successfully move pairs of letters to----"
  puts "----change the string into the following:----"
  puts "----------HTHTHTHTHT or THTHTHTHTH-----------"
  puts "---------------------------------------------"
  puts "--------Here's the initial string:-----------"
  puts "---------------------------------------------"
  puts "\n\n"
  5.times{
    handle_input
  }
  check_win_condition
end


# play the game 
play_game

