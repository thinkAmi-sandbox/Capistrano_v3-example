postgresql_connection_info = {
    host:     'localhost',
    port:     5432,
    username: 'postgres',
    password: 'fuga'
}


# Create PostgreSQL Database
postgresql_database 'herokudev' do
  connection postgresql_connection_info

  encoding 'utf8'
  action :create
end