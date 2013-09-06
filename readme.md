# Hangman in Ruby
By [Leandra Tejedor](https://github.com/ltejedor)

Think you can defeat the all powerful computer in hangman?

Test your skills by running

```console
cd hangman
ruby hangman.rb
```

*****

By [catepillar](https://github.com/catepillar)

I added a small little solver that I run through IRB, but could be built into a console app if so desired.

Sample of how I used it

```$ ruby solver.rb
> solver = HangmanSolver.new(file: File.join('dictionaries', 'gsl.txt'), length: 8)
> solver.help  # get the occurances of letters
=> [[:j, 1], ... , [:e, 131]]
> solver.guess("e")  # i guessed an "e" that didn't exist in the puzzle
=> ["industry", ... , "shilling"]
> solver.help  # get the updated occurances (notice that "e" is rightfully missing)
[[:q, 1], ... , [:i, 33]]
> solver.guess("i",3)  # there is an "i" at the 4th position (I have it set for 0 based indexing)
Guesses: e
=> ["position", "official", "division", "familiar", "ordinary", "chairman", "politics", "musician", "ambition"]
```

Now you no longer have to worry about a condescending computer!

