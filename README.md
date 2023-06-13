
# CommuniTerra

CommuniTerra is a website for plant care and plant sharing/sitting. 
## Features

- Log in/sign up
- Add plants you own to your dashboard
- Responsive website

## Features to come

- Toggle light/dark mode
- Marketplace
- Alltoments/Community gardens in your area

## Authors

- [@katamaric](https://www.github.com/katamaric)
- [@artem-ine](https://www.github.com/artem-ine)
- [@Hug-alito](https://github.com/Hug-alito)
- [@SasidaTR](https://github.com/SasidaTR)
- [@c-boris](https://github.com/c-boris)

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

Run the database file to fill it in

```bash
  rails runner app/services/gdb.rb
```

Start your server. 

```bash
  rails server
```

You should be able to access it via your standard friendly http://localhost:3000/.

## Visit the website

Painstakingly deployed to Heroku, you can browse CommuniTerra at this adress: https://communiterra.herokuapp.com/
