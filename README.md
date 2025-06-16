# Read Me

## Overview
This RoR web application allows students and admins of schools to manage and register for courses

## Database Architecture
Use this link to view the data model architecture https://drive.google.com/file/d/1JmRvIlKFbcvBTjSl77PUak5bQ1o2C4PQ/view?usp=sharing

## Setup
Clone repo using gh cli `gh repo clone safdarzeeshan/skill-setter-school-app`

OR

Clone using url `https://github.com/safdarzeeshan/skill-setter-school-app.git`

#### Run the following commands in the terminal
```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```

## How to use
In a browser open `http://localhost:3000`

Login as a student with email `student@email.com` and password `Test123`

Login as an admin with email `school_admin@email.com` and password `Test123`