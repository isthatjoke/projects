USE vk;

SHOW tables;

DESC users;

SELECT COUNT(*) FROM users;

SELECT * FROM users LIMIT 10;

ALTER TABLE users MODIFY COLUMN phone VARCHAR(20) NOT NULL UNIQUE;

UPDATE users SET phone = CONCAT('+', FLOOR(RAND() * 999), '-', FLOOR(RAND() * 9999), 
  '-', FLOOR(100 + RAND() * 899), '-', FLOOR(10 + RAND() * 89), '-', FLOOR(10 + RAND() * 89)); 

DESC profiles;

SELECT * FROM profiles LIMIT 10;

UPDATE profiles SET updated_at = CURRENT_TIMESTAMP WHERE created_at > updated_at;

DESC messages;

SELECT * FROM messages LIMIT 10;

UPDATE messages SET
  from_user_id = FLOOR(1 + RAND() * 200),
  to_user_id = FLOOR(1 + RAND() * 200);

UPDATE messages SET created_at = (SELECT created_at FROM users WHERE id = from_user_id) WHERE created_at < 
  (SELECT created_at FROM users WHERE id = from_user_id);
 
DESC media_types;

SELECT * FROM media_types LIMIT 10;

DELETE FROM media_types;

TRUNCATE media_types;

INSERT INTO media_types (name) VALUES
  ('video'),
  ('photo'),
  ('audio');

DESC media;

SELECT * FROM media LIMIT 10;

UPDATE media SET file_path = CONCAT('https://dropbox/vk/file_', 
  FLOOR(1 + RAND() * 100000)); 

UPDATE media SET size = FLOOR(1 + RAND() * 100000)
  WHERE size < 10000;

UPDATE media SET user_id = FLOOR(1 + RAND() * 200);

UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);

UPDATE media SET metadata = CONCAT('{"owner": "', (SELECT CONCAT(first_name, ' ', 
  last_name) FROM users WHERE id = user_id), '"}');

ALTER TABLE media MODIFY COLUMN metadata JSON;

UPDATE media SET created_at = (SELECT created_at FROM users WHERE id = user_id) WHERE created_at < 
  (SELECT created_at FROM users WHERE id = user_id);

DESC friendship_statuses;

SELECT * FROM friendship_statuses;

DESC friendship;

SELECT * FROM friendship LIMIT 10;

UPDATE friendship SET requested_at = (SELECT created_at FROM users WHERE id = user_id) WHERE requested_at < 
  (SELECT created_at FROM users WHERE id = user_id);
 
UPDATE friendship SET confirmed_at = (SELECT created_at FROM users WHERE id = friend_id) WHERE confirmed_at < 
  (SELECT created_at FROM users WHERE id = friend_id);

UPDATE friendship SET confirmed_at = CURRENT_TIMESTAMP WHERE requested_at > confirmed_at;

DESC communities;

SELECT COUNT(*) FROM communities;

SELECT * FROM communities;

DESC communities_users;

SELECT COUNT(*) FROM communities_users;

SELECT * FROM communities_users LIMIT 30;




