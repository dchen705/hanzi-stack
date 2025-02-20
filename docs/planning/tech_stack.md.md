### Framework

#### **Use Sinatra If:**

✅ You want a lean, custom-built app without unnecessary features.  
✅ You’re comfortable handling raw SQL (or using Sequel instead of ActiveRecord).  
✅ You’re deploying on a lightweight server and need something minimal.  
✅ You want to deeply understand how your backend works.

#### **Use Rails If:**

✅ You want to move fast and don’t mind built-in conventions.  
✅ You plan to scale the app with more features (e.g., spaced repetition, leaderboards).  
✅ You want built-in authentication, form handling, and ORM convenience.

| Component | Main     | Alternatives          |
| --------- | -------- | --------------------- |
| Router    | Sinatra  | Ruby on Rails         |
| Database  | Postgres |                       |
| ORM       | Sequel   |                       |
| Host      | Fly.io?  |                       |
| Styling   |          | Bootstrap or Tailwind |
Redditor:
"Sinatra + Sequel + Mail + Forme + Shrine + Zeitwerk + dry-inflector + TZInfo + Time Math ≈ Rails."
https://www.reddit.com/r/rails/comments/11c8wbz/diff_between_rails_and_sinatra/

### To use or not to use Sequel (ORM)
| Feature           | Sequel (ORM) ✅    | Raw SQL ❌                   |
| ----------------- | ----------------- | --------------------------- |
| Readability       | ✅ Cleaner Code    | ❌ More Boilerplate          |
| Performance       | ❌ Slightly Slower | ✅ More Optimized            |
| Query Complexity  | ✅ Easy for CRUD   | ✅ Best for Advanced Queries |
| Security          | ✅ Auto-Sanitized  | ❌ Manual Protection Needed  |
| Schema Management | ✅ Migrations      | ❌ Manual Changes Needed     |
| Maintainability   | ✅ Scalable        | ❌ Harder to Maintain        |
Can also mix both as needed


