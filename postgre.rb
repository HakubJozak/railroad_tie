app = File.basename(Dir.getwd)

# POSTGRE Adapter bugfix
file 'config/initializers/pg_adapter_bugfix.rb',
<<-END
 class PGconn
   def self.quote_ident(name)
     %("\#\{name\}")
   end
 end
END


db_config = [ "development", "test" ].map do |env|
<<-END
#{env}:
  host: localhost
  adapter: postgresql
  database: #{app}_#{env}
  username: postgres
  password: password
  encoding: utf8
END
end

file 'config/database.yml', db_config.join("\n\n")

if yes?("Create defined PostgreSQL databases?")
  rake("db:create:all -r ./config/initializers/pg_adapter_bugfix.rb")
  rake("db:migrate")
end
