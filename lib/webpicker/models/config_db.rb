ActiveRecord::Base::establish_connection(
    adapter: 'sqlite3',
    database: 'database.sqlite3',
    pool: 5,
    timeout: 5000)