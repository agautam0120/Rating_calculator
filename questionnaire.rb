require "pstore" # https://github.com/ruby/pstore

STORE_NAME = "tendable.pstore"

QUESTIONS = {
  "q1" => "Can you code in Ruby?",
  "q2" => "Can you code in JavaScript?",
  "q3" => "Can you code in Swift?",
  "q4" => "Can you code in Java?",
  "q5" => "Can you code in C#?"
}.freeze


def store
  @store ||= PStore.new(STORE_NAME)
end

# TODO: FULLY IMPLEMENT
def do_prompt
  # Ask each question and get an answer from the user's input.
  answers = []
  QUESTIONS.each_key do |question_key|
    print QUESTIONS[question_key]
    answers << gets.chomp
  end

  store.transaction do
    store["current_answers"] ||= []
    store["current_answers"] << answers
  end

end

def do_report
  # TODO: IMPLEMENT
  scores = []

  store.transaction(true) do
    store["current_answers"].each do |results|
      true_results = results.select { |rs| rs =~ /y|Yes/i }.count

      scores << (100*true_results.to_f)/QUESTIONS.count
    end
  end
  # Score stores prior scores to be calculated
  p "Current Score: #{scores[-1]}"
  p "Total Score: #{(scores.sum/scores.count).round(2)}"
end

do_prompt
do_report
