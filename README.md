# Ruby on Rails with MongoDB

You can create a Rails project with help of MongoDB easily.

#### Installation of MongoDB on Mac
https://docs.mongodb.com/v3.0/tutorial/install-mongodb-on-os-x/

#### Starting the MongoDB Server
```
mongod
```

#### Mongodb Data Directory Permissions
http://stackoverflow.com/questions/5973811/mongodb-data-directory-permissions
```
sudo chmod 777 /data/db
```

#### Create a Rails Project
1. Create your Rails project with the '--skip-active-record' switch.

```
rails new mongodb_example --skip-active-record
```

2. Remove sqlite3 from your Gemfile (if present), add Mongoid to your Gemfile, and run 'bundle'.

```
gem 'mongoid', '~> 6.0.0'
```

3. Run '`rails g mongoid:config`'.

4. Mongoid is ready to go. The Rails generators for 'model', 'scaffold' etc have been overridden by Mongoid. Any models, scaffolds etc that you create will create classes that include the Mongoid::Document module instead of inheriting from ApplicationRecord in the models folder.
