CREATE TABLE blogger (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE blog_post (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255),
    title VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    blogger_id INT,
    FOREIGN KEY (blogger_id) REFERENCES blogger(id) ON DELETE CASCADE
);

CREATE TABLE blog_post_comment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    blogger_id INT,
    FOREIGN KEY (blogger_id) REFERENCES blogger(id) ON DELETE CASCADE,
    blog_post_id INT,
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id) ON DELETE CASCADE
);

INSERT INTO blogger (username, password, name, created_at, email) VALUES
('JaneDoe', 'securePass123', 'Jane Doe', '2024-06-24 10:00:00', 'jane.doe@email.com'),
('JohnSmith', 'password123', 'John Smith', '2024-06-23 09:30:00', 'john.smith@email.com');

INSERT INTO blog_post (content, title, created_at, blogger_id) VALUES
('This is the content of the first blog post', 'First Post', '2020-05-25 11:00:00', 1),
('This is the content of the second blog post', 'Second Post', '2024-06-24 12:00:00', 1);
('This is the content of the first blog post', 'First Post', '2020-05-25 11:00:00', 2),
('This is the content of the second blog post', 'Second Post', '2024-06-24 12:00:00', 2);

INSERT INTO blog_post_comment (content, created_at, blogger_id, blog_post_id) VALUES
('Great post!', '2024-06-24 11:30:00', 2, 1),
('Thank you for sharing this.', '2024-06-24 12:30:00', 1, 2);

-- Queries --

SELECT *
FROM blogger
WHERE created_at > '2020-01-01';

UPDATE blogger
SET password = 'bad_password'
WHERE password = 'pass';

SELECT content, title, username FROM blogger INNER JOIN blog_post 
ON blogger.id = blog_post.blogger_id;

SELECT blog_post_comment.content, title, username FROM blogger
INNER JOIN blog_post 
ON blogger.id = blog_post.blogger_id
INNER JOIN blog_post_comment 
ON blog_post.id = blog_post_comment.blog_post_id;