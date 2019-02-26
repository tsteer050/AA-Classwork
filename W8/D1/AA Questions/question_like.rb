require_relative 'questions'
require_relative 'user'
require_relative 'question'



class QuestionLike < QuestionsObject

    def self.most_liked_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.id, title, body, author_id
            FROM
                questions
            JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(user_id) ASC
            LIMIT
                ?
        SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE
                user_id = ?
            SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.likers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                * 
            FROM
                users
            JOIN
                question_likes
            ON
                users.id = question_likes.user_id
            WHERE
                question_id = ?
            SQL
        data.map { |datum| User.new(datum) }
    end
    
    def self.num_likes_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(title) AS count
            FROM
                questions
            JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE
                question_id = ?
            SQL
        data[0]["count"]
    end

    def self.find_by_user(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                user_id = ?
        SQL
        data.map { |datum| QuestionLike.new(datum) }

    end

    attr_accessor :id, :question_id, :user_id

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

end
