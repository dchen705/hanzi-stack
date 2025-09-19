# README.md #

## Hanzi Stack

-  No login required. Users can search a database of 9000+ most common Chinese characters to customize their own stack of flashcards, stored on their browser.
- To save multiple decks and have permanent storage, users need to create an account and login.

## Visual Demo

1. Search/filter the database to save flashcards to your stack.
![](/public/images/search-ezgif.com-optimize.gif)

2. Enter flashcard quiz mode.
![](/public/images/flashcard-ezgif.com-optimize.gif)

## Dev Notes

### Core Developments
- Routing user's requests (ie: login and CRUD their data) to the appropriate process, dynamically generating HTML using ERB, and querying a PostgreSQL relational database for storage. (Ruby, Sinatra Framework)
- Designing relational database schema: mapping out relationships between tables and creating columns. (PostgreSQL)
![](/public/images/erd_diagram.png)
- Creating interactive GUIs for the database API and flashcard quiz API. (ES6 Javascript, CSS, HTML)


### Other Notable Features
- password encryption (BCrypt)
- session storage
- object oriented code design
- testing suite for routes

- AJAX requests
- pagination
- CSS animations
- Bootstrap

### Possible Future Features
- Add filter by frequency rank
- Populate database with "multi-character" words
- Expand testing suite to include forms (Capybara)
