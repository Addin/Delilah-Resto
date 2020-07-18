# Delilah-Resto

**A REST API to provide delivery food services, managing CRUD products and orders usign Node.js, MySQL, Swagger and JavaScript.**

# What I use to build this?

* [Node.js](https://nodejs.org/en/)
* [Express](https://expressjs.com/)
* [MySQL](https://www.mysql.com/)
* [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)
* [JWT](https://jwt.io/)
* [Sequelize](https://sequelize.org/)
* [Nodemon](https://nodemon.io/)
* [Postman](https://www.postman.com/)

# I want to know more about this API!

Sure, take a look over here to my [Swaggerhub.](https://app.swaggerhub.com/apis/Addin/Delilah-resto/1.0.0)

# I want to run it locally!

You need to make sure you have a web server running, the easiest way to achieve this is with [XAMPP](https://www.apachefriends.org/index.html) otherwise this project isn't going to work in your local.

## Clone the repository:

```git clone https://github.com/Addin/Delilah-Resto.git ```

## Install the required dependencies

Run the following command, **make sure you are in the root folder.**

### If you are using [NPM](https://www.npmjs.com/)
``` npm install ```

### If you are using [Yarn](https://yarnpkg.com/)

``` yarn install ```

## Setup the database

You need to edit the file [sequelize.js](https://github.com/Addin/Delilah-Resto/blob/master/routes/sequelize.js) and change the data there to match your config, remember the structure (**mysql://user:password@host:port/database**), then export the file/script [delilah.sql](https://github.com/Addin/Delilah-Resto/blob/master/delilah.sql) in your database manager, I recommend you to use [HeidiSQL](https://www.heidisql.com/).

## Run the server!

Make sure you are in the root of the folder, then simply run 

``` npm start ``` 

and let the magic begin!

# Want to contribute?

Open a [Issue](https://github.com/Addin/Delilah-Resto/issues) or help me with a [pull request](https://github.com/Addin/Delilah-Resto/pulls) 

# TODOS

* Use [bcrypt](https://codahale.com/how-to-safely-store-a-password/) for passwords
* Make the front-end for consuming the back-end
* Make the endpoint for logout
