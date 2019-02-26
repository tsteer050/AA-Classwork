PRAGMA foreign_keys = ON;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)

);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    parent_id INTEGER,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

INSERT INTO
    users (fname, lname)
VALUES
    ('Trevor', 'Steer'),
    ('Shannon', 'Piesinger');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('My pair is the best', 'Out of every day I''ve spent in app academy so far, my pair today is by far the coolest and handsomest!', 
    (SELECT id FROM users WHERE fname = 'Trevor' AND lname = 'Steer'));

INSERT INTO 
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Trevor' AND lname = 'Steer'), 
     (SELECT id FROM questions WHERE title = 'My pair is the best')),
    ((SELECT id FROM users WHERE fname = 'Shannon' AND lname = 'Piesinger'),
     (SELECT id FROM questions WHERE title = 'My pair is the best'));

INSERT INTO 
    replies (question_id, user_id, parent_id, body)
VALUES
    ((SELECT id FROM questions WHERE title = 'My pair is the best'),
     (SELECT id FROM users WHERE fname = 'Shannon' AND lname = 'Piesinger'),
     NULL, 'Hey, thanks man!  You''re the best!'),

    ((SELECT id FROM questions WHERE title = 'My pair is the best'),
     (SELECT id FROM users WHERE fname = 'Trevor' AND lname = 'Steer'), 
     1,
     'Wow, that''s so nice, you didn''t have to say that!');

INSERT INTO 
    question_likes (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'My pair is the best'),
     (SELECT id FROM users WHERE fname = 'Shannon' AND lname = 'Piesinger'));
