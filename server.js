const express = require("express");
const app = express();
const mysql = require("mysql");
mysql.createConnection({
  host: "local host",
  port: 3386,
  user: "root",
  password: "",
  database: "blog_db",
});

//routes
app.get("/", (req, res) => {
  res.render("home.ejs");
});

app.get("/dashboard", (req, res) => {
  res.render("dashboard.ejs");
});

app.get("/login", (req, res) => {
  res.render("login.ejs");
});

app.get("/register", (req, res) => {
  res.render("register.ejs");
});

app.get("/posts", (req, res) => {
  //show all posts with possible actions like(edit, delete, hide, view post comments, view likes and much more) - the action will be in form of links or buttons
  connection.query("SELECT * FROM posts", (error, posts) => {
    console.log(posts);
  });
  res.render("posts.ejs");
});

app.get("/posts/:postID", (req, res) => {
  //show a single post (all content,images, comments(preview))- for public(no actions),for admin(actions like edit delete to be shown on this page)
  res.render("post.ejs");
});

app.post("/", (req, res) => {
  res.redirect("/posts/5");
});

//listen/start --always define/write after all routes ---at the end (js is interprated)
app.listen(8000, () => console.log("App started running on port 8000"));
