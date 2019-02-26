require_relative 'questions'
require_relative 'user'
require_relative 'question'
require_relative 'question_follow'
require_relative 'question_like'


class Reply < QuestionsObject

    def self.find_by_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }

    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }

    end

    attr_accessor :id, :question_id, :user_id, :parent_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
        @parent_id = options['parent_id']
        @body = options['body']
    end

    def author 
        User.find_by_id(self.user_id)
    end

    def question 
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        data = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        data.map { |datum| Reply.new(datum) }
    end

    def child_replies
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }
    end
    
end
