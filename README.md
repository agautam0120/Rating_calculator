# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise

--------------------------------------------------------------------------

1. do_prompt method get the current answer of the questions and saves it in the store PStore responses 

e.g.
<!-- #<PStore:0x000001daff324818 @filename=\"tendable.pstore\", @abort=false, @ultra_safe=false, @thread_safe=false, @lock=#<Thread::Mutex:0x000001daff3244d0>, @rdonly=false, @table={:responses=>{\"q1\"=>true, \"q2\"=>true, \"q3\"=>false, \"q4\"=>false, \"q5\"=>true}, \"current_answers\"=>[[\"y\", \"y\", \"n\", \"y\", \"n\"], [\"y\", \"n\", \"n\", \"n\", \"n\"], [\"Y\", \"Y\", \"Y\", \"Y\", \"Y\"], [\"y\", \"y\", \"y\", \"n\", \"y\"], [\"y\", \"n\", \"y\", \"y\", \"y\"], [\"y\", \"n\", \"n\", \"n\", \"n\"]]}> -->

2. do_report method fetches the responses that are saved in pstore and count the sum of answers that are true.

<!-- true_results = results.select { |rs| rs =~ /y|Yes/i }.count -->

3. Then we will store in the scores array the score calcluted based on the total current questions and current true_results

<!-- (100*true_results.to_f)/QUESTIONS.count -->

4. We will then show current score saved along with calculating the total score based on prior scores and their total count saved.

  <!-- p "Current Score: #{scores[-1]}"
  "Total Score: #{(scores.sum/scores.count).round(2)}" -->

