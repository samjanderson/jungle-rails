# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Added features including:

. login/signup with basic authentication
. valid credentials in order for admin to be able to see the product, categories and dashboard pages
. created an admin dashboard to display quantity of current products and categories
. ability for admin to create new categories
. products that have no inventory properly display a "sold out" icon

Integrated Stripe for testing payment. Rspec and Capybara were used for unit and feature testing.

## Screenshots



!["Home Page"](https://github.com/samjanderson/jungle-rails/blob/master/docs/homepage.png?raw=true)
!["Select A Product"](https://github.com/samjanderson/jungle-rails/blob/master/docs/single-product.png?raw=true)
!["My Cart"](https://github.com/samjanderson/jungle-rails/blob/master/docs/my-cart.png?raw=true)
!["Admin Categories"](https://github.com/samjanderson/jungle-rails/blob/master/docs/admin-categories.png?raw=true)
!["Admin Products"](https://github.com/samjanderson/jungle-rails/blob/master/docs/admin-products.png?raw=true)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
