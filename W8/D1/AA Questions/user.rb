require_relative 'questions'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'

class User < QuestionsObject


    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ?
            AND
                lname = ?
        SQL
        data.map { |datum| User.new(datum) }

    end

    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def liked_questions 
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                CAST(COUNT(questions.title) AS FLOAT) / COUNT(question_likes.user_id) 
                AS karma
            FROM
                questions
            LEFT OUTER JOIN
                question_likes
            ON
                question_likes.question_id = questions.id
            WHERE
                user_id = ?

        SQL
        data[0]["karma"]
    end

    # def save
    #     if self.id.nil?
    #         # instance.instancce_variables ===> []
            
    #         QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
    #             INSERT INTO
    #                 users (fname, lname)
    #             VALUES
    #                 (?, ?)#{questions.join}
    #         SQL
    #         self.id = QuestionsDatabase.instance.last_insert_row_id
    #     else 
    #         QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
    #             UPDATE
    #                 users
    #             SET
    #                 fname = ?, lname = ?
    #             WHERE
    #                 id = ?
    #         SQL
    #     end 
    # end

end
