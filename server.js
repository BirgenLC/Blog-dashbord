const express = require("express");
const app = express();
const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "blog_db",
});
const protectedRoutes = ["/profile", "/dashboard"];

function checkForProtectedRoutes(req, res, next) {
  if (protectedRoutes.includes(req.url)) {
    res.end("You have to be logeed in");
  } else {
    next();
  }
}
//middleware functions
app.use(checkForProtectedRoutes);

//routes
app.get("/", (req, res) => {
  res.render("home.ejs");
});

app.get("/dashboard", checkForProtectedRoutes, (req, res) => {
  res.render("dashboard.ejs");
});

app.get("/login", checkForProtectedRoutes, (req, res) => {
  res.render("login.ejs");
});

app.get("/register", (req, res) => {
  res.render("register.ejs");
});

app.get("/posts", (req, res) => {
  //show all posts with possible actions like(edit, delete, hide, view post comments, view likes and much more) - the action will be in form of links or buttons
  connection.query("SELECT * FROM posts", (error, posts) => {
    if (error) {
      res.json(error);
    } else {
      res.render("posts.ejs", { blogs: posts });
    }
  });
  //res.render("posts.ejs");
});

app.get("/posts/:postID", (req, res) => {
  //show a single post (all content,images, comments(preview))- for public(no actions),for admin(actions like edit delete to be shown on this page)
  res.render("post.ejs");
});
app.get("/newpost", (req, res) => {
  res.render("newpost.ejs");
});

app.post("/newpost", express.urlencoded({ extended: true }), (req, res) => {
  //console.log(req.body);
  connection.query(
    `INSERT INTO posts (user_id,title,content)VALUES(2,'${req.body.title}','${req.body.content}')`,
    (err) => {
      if (err) {
        res.json(err);
      } else {
        res.redirect("/posts");
      }
    }
  );
  // res.redirect("/post/5");
});

//listen/start --always define/write after all routes ---at the end (js is interprated)
app.listen(8000, () => console.log("App started running on port 8000"));
