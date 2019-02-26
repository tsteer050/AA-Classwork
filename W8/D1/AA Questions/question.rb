require_relative 'questions'
require_relative 'user'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'reply'


class Question < QuestionsObject

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                users
            WHERE
                author_id = ?
        SQL
        data.map { |datum| Question.new(datum) }
    end

    attr_accessor :id, :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def likers 
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end

    def followers 
        QuestionFollow.followers_for_question_id(self.id)
    end

    def author 
        User.find_by_id(self.author_id)
    end

    def replies 
        Reply.find_by_question_id(self.id)
    end

end
