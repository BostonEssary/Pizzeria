# README

# Pizzeria 

## Overview

This is my version of the coding excercise. It has a basic but intuitive UI for easy interaction I used Ruby on Rails with vanilla CSS for styling.  Turbo-Frames were used to provide a Single Page App feel.
Devise was used for authentication for ease of use.
Postresql was used for the database.
Ruby 3.2.2 is required for this application


## Installation
This app is live @ https://bostons-pizzeria.fly.dev/

If you would like to try this app for yourself on your own machine, do the following:
1. Open your terminal and navigate to your preferred directory for cloning the project.

2. Clone the repository:
```shell
git clone https://github.com/BostonEssary/Pizzeria.git
```

3. Change directory to the cloned repository:
```shell
cd Pizzeria
```

4. Install dependencies:
```shell
bundle install
```

5. Create the database:
```shell
rails db:create
```

6. Migrate the database:
```shell
rails db:migrate
```

8. Seed the database:
```shell
rails db:seed
```

9. Start up the application:
```shell
rails s
```

10. Navigate to the address that was printed in your console

11. Login with one of the following credentials
    admin@admin.com admin123
    owner@pizza.com owner123
    chef@pizza.com chef123

12. Tests can be ran by running the following command while in the project directory:
```shell
    rspec spec
```
