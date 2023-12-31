DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS review;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE review (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  review_score INTEGER NOT NULL,
  url_string TEXT NOT NULL,
  review_comment TEXT,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

