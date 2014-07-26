# Database

Most web applications have their own database. A database is a collection of data. This is a place in which you will store information about users, your blog posts, etc.

We will be using a SQLite database to store our data. This is the default Django database adapter - but it's not good for production use. *Production* means out on the big, scary internet - running real websites accessed by more than a handful of users. If you want your application to be available to the world, not just running on your computer, you'll need PostgreSQL.
