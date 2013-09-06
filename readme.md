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
=> [[:j, 1], [:x, 2], [:z, 2], [:q, 4], [:k, 5], [:f, 9], [:w, 9], [:b, 20], [:v, 24], [:y, 25], [:g, 29], [:m, 37], [:h, 37], [:d, 40], [:p, 41], [:u, 48], [:l, 60], [:c, 60], [:s, 73], [:o, 80], [:n, 85], [:t, 86], [:a, 90], [:i, 94], [:r, 105], [:e, 131]]
> solver.guess("e")  # i guessed an "e" that didn't exist in the puzzle
=> ["industry", "although", "position", "anything", "standard", "district", "occasion", "official", "hospital", "division", "straight", "mountain", "familiar", "solution", "ordinary", "railroad", "chairman", "proposal", "politics", "tomorrow", "musician", "thorough", "surround", "sympathy", "quantity", "complain", "ambition", "criminal", "boundary", "multiply", "astonish", "backward", "classify", "circular", "cautious", "daylight", "accustom", "landlord", "nowadays", "adoption", "omission", "stocking", "cupboard", "punctual", "lipstick", "scissors", "shilling"]
> solver.help  # get the updated occurances (notice that "e" is rightfully missing)
[[:q, 1], [:v, 1], [:f, 3], [:k, 3], [:w, 3], [:b, 4], [:g, 7], [:h, 10], [:y, 10], [:p, 11], [:m, 12], [:d, 14], [:u, 15], [:c, 18], [:l, 18], [:r, 19], [:s, 24], [:n, 25], [:t, 25], [:o, 28], [:a, 32], [:i, 33]]
> solver.guess("i",3)  # there is an "i" at the 4th position (I have it set for 0 based indexing)
Guesses: e
=> ["position", "official", "division", "familiar", "ordinary", "chairman", "politics", "musician", "ambition"]
```

Now you no longer have to worry about a condescending computer!

