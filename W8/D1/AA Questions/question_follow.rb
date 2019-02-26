require_relative 'questions'
require_relative 'user'
require_relative 'question'



class QuestionFollow < QuestionsObject

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.id, title, body, author_id
            FROM
                questions
            JOIN
                question_follows
            ON
                questions.id = question_follows.question_id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(user_id) ASC
            LIMIT
                ?
            

        SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT 
                * 
            FROM 
                question_follows
            JOIN
                users
            ON
                question_follows.user_id = users.id
            WHERE
                question_id = ?
        SQL
        data.map { |datum| User.new(datum) }
    end

    def self.followed_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                question_follows
            JOIN
                questions
            ON
                question_follows.question_id = questions.id
            WHERE
                user_id = ?

        SQL
        data.map { |datum| Question.new(datum) }
    end

    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end
