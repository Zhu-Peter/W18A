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
    title VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    blogger_id INT,
    FOREIGN KEY (blogger_id) REFERENCES blogger(id) ON DELETE CASCADE,
    blog_post_id INT,
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id) ON DELETE CASCADE
);