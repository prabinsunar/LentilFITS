# LentilFITS - Lentil Food Inventory Tracking System

A food inventory management and tracking system built with Ruby on Rails 5.

!["Dashboard"](https://github.com/dayramaelbranz/LentilFITS/blob/master/main%20dashboard.png)

Lentil Food Inventory Tracking System is a web-based application and built for Lentil as Anything organisation. The web application has 3 main modules i.e. Inventory, Kitchen Consumption, and Site transfer that supports the following features:
•	Track and transfer stocks in different sites
•	Keep a record of stocks
•	Add and consume the stock

## Description
Users and admin(who have access to the app) in a particular restaurant location, can check items in their inventory. Item transfer to other restaurant location can then be marked as received or canceled. Kitchen module let the user to make consumption once they consume the item from the inventory.

## Installation Instructions

### Install Rails

* Make sure you have a Ruby version > 2.2.2 installed in your system
* Install [RubyGems](https://rubygems.org/pages/download)
* run ```gem install rails -v 5.0.2```

### Download Repo

* Download this repo, and unzip it
* ``` cd lentilfits_main``` to cd into the folder
* ``` bundle ```
* ``` rails db:migrate db:seed ```

### Run the server
* Run ```rails s``` to start the server
* Visit http://localhost:3000

### Credentials
There are 4 restaurants location and each of them have admin and user account.
- Email: user.abb@lentilasanything.com
- Password: password
* replace 'user' with 'admin' to change it to admin account

For the other restaurant account, replace 'abb' with:
- 'tho' for Thornbury
- 'stk' for St. Kilda
- 'new' for Newton

_Special Thanks to https://github.com/zmitzie/inventorious / @zmitzie for the ideas._
