CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES qustions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Zuhair', 'Shaikh'),
  ('Joey', 'Jirasevijinda'),
  ('John', 'Doe'),
  ('Jane', 'Doe');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('SQL', 'Why is it so hard?!!', 2),
  ('Hello!', 'What is life?', 1),
  ('Lunch', 'Whats a good place to eat around here?', 2),
  ('OOP', 'Why a parking lot?', 1),
  ('Name', 'Why is my name so average?', 3),
  ('Haha', 'Why am I so pretty?', 4);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (2, 2),
  (2, 4),
  (1, 1),
  (1, 3),
  (2, 5),
  (1, 5),
  (2, 6),
  (3, 2),
  (4, 2);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (2, NULL, 2, 'Coding is love, coding is life!'),
  (1, NULL, 1, 'Too much syntax!'),
  (1, 2, 2, 'Agreed'),
  (2, 1, 1, 'o_o'),
  (2, NULL, 3, 'Having a good name'),
  (2, NULL, 4, 'Having good looks');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (2, 2),
  (1, 1),
  (2, 4),
  (3, 2),
  (3, 1),
  (4, 2),
  (4, 6);
