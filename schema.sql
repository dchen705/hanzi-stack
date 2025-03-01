CREATE TABLE characters (
  id serial PRIMARY KEY,
  radical varchar(8),
  frequency integer,
  gs_num integer,
  hsk2 varchar(8),
  hsk3 varchar(8),
  stroke_count integer,
  hanzi varchar(8) NOT NULL,
  pinyin varchar(8) NOT NULL,
  meaning text
);

CREATE TABLE users (
  id serial PRIMARY KEY,
  username text NOT NULL UNIQUE,
  password text NOT NULL
);

CREATE TYPE proficiency_level AS ENUM ('not yet', 'hard', 'good');

CREATE TABLE flashcards (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  character_id integer NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
  user_proficiency proficiency_level DEFAULT 'not yet',
  UNIQUE(user_id, character_id)
);

CREATE TABLE decks (
  id serial PRIMARY KEY,
  name text NOT NULL,
  user_id integer NOT NULL REFERENCES users (id) ON DELETE CASCADE,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  quantity integer NOT NULL DEFAULT 0,
  favorited boolean NOT NULL DEFAULT false
);

CREATE TABLE decks_flashcards (
  id serial PRIMARY KEY,
  deck_id integer NOT NULL REFERENCES decks (id) ON DELETE CASCADE,
  flashcard_id integer NOT NULL REFERENCES flashcards (id) ON DELETE CASCADE,
  added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- COPY hanzi FROM 'data/test.csv' WITH (FORMAT csv, HEADER true);

-- \copy hanzi FROM 'data/3000_most_frequent.csv' WITH (FORMAT csv, HEADER true)

-- №,Radical,Freq.,General standard #,Encounters,Fraction of   the language,HSK 2.0,HSK 3.0,Stroke count,Character,Pinyin,Pinyin2,Pinyin3,Meaning
-- 1,一 1.0,2,1,3050722,1.58%,1,1,1,一,yī,yi,first,"one; a, an; alone"