# CommuniTerra

CommuniTerra is a website for plant care and plant sharing/sitting. It offers users a wide database of plants to pick from, and a logbook system that allows users to log entries on their plants daily to keep track of their health and anything the user deems worth keeping :)

## Features

- Wide database of plants 
- User creation (including profile personalization)
- Logbook for each plant

## Features to come

- Plantsitting: ability to select plants that need a sitter, to plantsit for other users, and to log entries in plants a sitter is currently taking care of
- "Smart" logbook: using the database info, the logbook will predict when the plant needs watering, its overall health, and allow the user to use the logbook faster
- Allotments/Community gardens in your area
- Marketplace to add and buy listings between users

## Authors

- [@artem-ine](https://www.github.com/artem-ine)
- [@c-boris](https://github.com/c-boris)
- [@Hug-alito](https://github.com/Hug-alito)
- [@katamaric](https://www.github.com/katamaric)
- [@SasidaTR](https://github.com/SasidaTR)

## Run locally

Assuming you have postgres installed (if not, figure that out)!

Do a standard bundle install

```bash
  bundle install
```

Initialize the migrations (if necessary, create a database first with rails db:create)

```bash
  rails db:migrate
```

Run the seed file to load up the plant database

```bash
  rails db:seed
```

Start your server

```bash
  rails server
```

You should be able to access it via your standard friendly http://localhost:3000/.

## Visit the website

Painstakingly deployed to Heroku, you can browse and use CommuniTerra at this address: https://communiterra.fly.dev/
