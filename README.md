# My Academy Quest PEEMAI (Cafeine)

แอปพลิเคชัน Ruby on Rails แบบง่าย ๆ สำหรับจัดการเควส (หรืองาน todo)
โปรเจกต์นี้ถูกออกแบบมาเพื่อฝึกพัฒนา Rails สมัยใหม่ โดยใช้ TailwindCSS, Turbo/Hotwire และ PostgreSQL

---

## Table of Contents

- [Setup Instructions](#setup-instructions)  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Running Tests](#running-tests)  

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/your-username/my_academy_quest.git
cd my_academy_quest
````

### 2. Install dependencies

```bash
bundle install
```

### 3. Set up environment variables

Create a `.env` file in the project root:

```bash
touch .env
```

Add the following:

```
DB_USERNAME=postgres
DB_PASSWORD=your_password
```

### 4. Setup PostgreSQL with Docker

```bash
docker compose up -d db
```

### 5. Create and migrate the database

```bash
rails db:create
rails db:migrate
```

### 6. Start the development server

```bash
bin/dev
```

Visit the app at: [http://localhost:3000](http://localhost:3000)

---

## Features

* ✅ Quest/Todo management (Create, Delete)
* ✅ Turbo Stream live updates (auto-refresh list when adding/removing)
* ✅ TailwindCSS for responsive UI

---

## Tech Stack

* **Ruby on Rails 8**
* **PostgreSQL** (via Docker)
* **TailwindCSS** for styling
* **Hotwire / Turbo** for realtime updates
* **RSpec + Minitest** for testing
* **SimpleCov** for coverage reports

---

## Running Tests

### Run all tests with Minitest

```bash
rails test
```

### Run RSpec request/system specs

```bash
bundle exec rspec
```

### Check coverage with SimpleCov

After running tests, open:

```
coverage/index.html
```

