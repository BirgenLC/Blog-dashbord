DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Create posts table
CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create comments table
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create likes table
CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Seed users
INSERT INTO users (username, email, password_hash)
VALUES
('alice', 'alice@example.com', 'hash1'),
('bob', 'bob@example.com', 'hash2'),
('carol', 'carol@example.com', 'hash3'),
('dave', 'dave@example.com', 'hash4'),
('eve', 'eve@example.com', 'hash5'),
('frank', 'frank@example.com', 'hash6'),
('grace', 'grace@example.com', 'hash7'),
('heidi', 'heidi@example.com', 'hash8'),
('ivan', 'ivan@example.com', 'hash9'),
('judy', 'judy@example.com', 'hash10'),
('mallory', 'mallory@example.com', 'hash11'),
('oscar', 'oscar@example.com', 'hash12'),
('peggy', 'peggy@example.com', 'hash13'),
('trent', 'trent@example.com', 'hash14'),
('victor', 'victor@example.com', 'hash15');

-- Seed posts
-- Seed posts with more meaningful web development content
INSERT INTO posts (user_id, title, content)
VALUES
(1, 'Understanding REST APIs', 'REST APIs allow applications to communicate over HTTP by using standard methods like GET, POST, PUT, and DELETE. They are essential for modern web development, especially in building scalable backends for mobile and web apps.'),
(2, 'Getting Started with React', 'React is a powerful JavaScript library for building user interfaces. It uses a component-based approach, making it easier to manage complex UIs by breaking them into reusable pieces.'),
(3, 'CSS Grid vs Flexbox', 'CSS Grid and Flexbox are modern layout systems in CSS. Grid is best for two-dimensional layouts, while Flexbox excels in one-dimensional layouts. Knowing when to use each can greatly improve your frontend workflow.'),
(4, 'The Basics of Node.js', 'Node.js allows JavaScript to run on the server, enabling full-stack JavaScript development. It uses an event-driven, non-blocking I/O model, making it efficient for handling concurrent requests.'),
(5, 'Introduction to Git and GitHub', 'Git is a version control system that tracks changes in code, while GitHub is a platform for hosting Git repositories. Learning Git is essential for collaboration and maintaining clean project history.'),
(6, 'How the Browser Renders Web Pages', 'When you load a website, the browser parses HTML, CSS, and JavaScript to construct the DOM and render the page. Understanding this process helps developers write more performant and responsive web apps.'),
(7, 'Building Forms with HTML and JavaScript', 'Forms are the main way users interact with web apps. With HTML for structure and JavaScript for validation and submission, you can create robust user input flows that improve UX.'),
(8, 'What is Web Accessibility?', 'Web accessibility ensures that websites are usable by people with disabilities. This includes using semantic HTML, ARIA roles, and ensuring proper contrast and keyboard navigation.'),
(9, 'Working with RESTful Routes in Express', 'Express is a popular Node.js framework for building APIs. It uses RESTful routing principles to organize endpoints, making it easy to handle CRUD operations in your application.'),
(10, 'Deploying Your Website with Netlify', 'Netlify makes it easy to deploy static sites directly from your GitHub repo. It supports custom domains, SSL, and CI/CD out of the box, streamlining the deployment process.'),
(11, 'Understanding JavaScript Closures', 'Closures are a powerful feature in JavaScript where a function retains access to its outer scope even after that scope has exited. This enables patterns like function factories and private variables.'),
(12, 'Intro to Tailwind CSS', 'Tailwind CSS is a utility-first CSS framework that helps you build custom UIs quickly. Instead of writing custom CSS, you compose styles directly in your HTML using predefined classes.'),
(13, 'Why Learn TypeScript?', 'TypeScript is a statically typed superset of JavaScript that adds optional type checking. It helps catch errors early, improves developer tooling, and makes large codebases easier to maintain.'),
(14, 'Responsive Design Principles', 'Responsive design ensures your website looks good on all devices. It involves using flexible layouts, media queries, and scalable images to create a seamless experience across screen sizes.'),
(15, 'Using Fetch API in JavaScript', 'The Fetch API is a modern way to make HTTP requests in the browser. It uses Promises and provides a cleaner, more readable way to interact with REST APIs compared to older methods like XMLHttpRequest.');


-- Seed comments
INSERT INTO comments (post_id, user_id, content)
VALUES
(1, 2, 'Nice post!'),
(1, 3, 'Thanks for sharing.'),
(2, 1, 'Interesting view.'),
(3, 4, 'Great write-up!'),
(4, 5, 'Loved this!'),
(5, 6, 'Very insightful.'),
(6, 7, 'Well written.'),
(7, 8, 'Good job!'),
(8, 9, 'Made me think.'),
(9, 10, 'Keep it up!'),
(10, 11, 'Nice perspective.'),
(11, 12, 'I agree with this.'),
(12, 13, 'Brilliant post.'),
(13, 14, 'I learned a lot.'),
(14, 15, 'Thanks for writing.');

-- Seed likes
INSERT INTO likes (post_id, user_id)
VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15);