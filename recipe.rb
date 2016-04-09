@steps_recipe = [
  'Preheat the oven at 180C',
  'Grate the lemons',
  'Whisk the butter and sugar together for 3 minutes',
  'Add the eggs to the butter/sugar mixture, one by one, and whisk for a few more minutes',
  'Add flour, lemons zest and grated coconut and stir in carefully',
  'Pour the cake mixture in a lined tin',
  'Bake the cake in the oven for 50 minutes',
  'Take it out after 50 minutes, check if its ready and let it cool off']

@ingredients = {
  "lemons" => 2,
  "grated coconut" => "50gr.",
  "flour" => "200gr.",
  "butter" => "200gr.",
  "sugar" => "200gr.",
  "eggs" => 4 }

def ingredients

puts "Here's a list of all the ingredients:"
@ingredients.each do|ingredient, amount|
  puts "• #{amount} #{ingredient}"
end
end

def whole_recipe

  puts "
Here's the recipe:"

  @steps_recipe.each do |step|
    puts "• #{step}"
  end
end

def starting

  puts "Would you like to read the whole recipe at once or do you like to go step by step?
  1) Whole recipe
  2) Step by step
  Please select your preference [1-2]"

  answer = gets.chomp.to_i

  if answer == 1
    puts "Ok, I'm going to show you the whole recipe now, have fun!"
    return ingredients, whole_recipe
  elsif answer == 2
    puts "Ok, I'm going to guide you through the recipe, step by step."
    return step_by_step1
  else
    puts "That's not an option, please choose 1 or 2."
    return starting
  end

end

def step_by_step3
  puts "Now:"
  print "
  • #{@steps_recipe[2]}
  • #{@steps_recipe[3]}\n"

end

def step_by_step2
  puts "Ok the first two things you need to do are the following:"
  print "
  • #{@steps_recipe[0]}
  • #{@steps_recipe[1]}\n"

  puts "Ready to go to the next step? [y/n]"

  answer_step2 = gets.chomp.upcase!

  if answer_step2 == "Y"
    puts "Great."
    return step_by_step3
  elsif answer_step2 == "N"
    puts "Ok, take your time and read the first steps again."
    return step_by_step2
  else
    puts "That's not an option, please choose y or n."
    return step_by_step2
  end

end

def step_by_step1
  puts "Let's start with the list of ingredients:"

  @ingredients.each do|ingredient, amount|
    puts "• #{amount} #{ingredient}"
  end

  puts " Do you have everything you need? [y/n]"

  answer_step1 = gets.chomp.upcase!

  if answer_step1 == "Y"
    puts "Great, let's go to the next step."
    return step_by_step2
  elsif answer_step1 == "N"
    puts "Ok, time to go to the supermarket."
    return step_by_step1
  else
    puts "That's not an option, please chose y or n."
    return step_by_step1
  end

end

def welcome
    puts "Hello! Today you are going to bake a delicious lemon-coconutcake. Are you ready? [y/n]"

    ready_answer = gets.chomp.upcase

    if ready_answer == "Y"
      puts "Great, let's start!"
      return starting
    elsif ready_answer == "N"
      puts "Ok, no problem, you can always return here when you're ready to cook :)"
    else
      puts "That's not an option, please enter y or n."
      welcome
    end
end

welcome
