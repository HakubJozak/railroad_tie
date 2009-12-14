app = File.basename(Dir.getwd)

run "rm public/index.html"
run "rm config/database.yml"


file '.gitignore', <<-END
log/*.log
db/*.db
db/*.sqlite3
db/schema.rb
tmp/**/*
doc/api
doc/app
*.*~
END

file '.autotest', "require 'redgreen/autotest'"

# POSTGRE Adapter bugfix
file 'config/initializers/pg_adapter_bugfix.rb',
<<-END
 class PGconn
   def self.quote_ident(name)
     %("\#\{name\}")
   end
 end
END

 
file '.emacs', <<-END
  (find-file "#{Dir.getwd}")

  ; TO USE EMACS TAGS:
  ;
  ; install: mactag plugin, ctags ubuntu package
  ; edit: config/mactag.rb
  ; run: rake mactag
  ;
  (setq tags-table-list '("#{Dir.getwd}" "/usr/local/lib/emacs/src"))
END
 
 
db_config = [ "development", "test", "production" ].map do |env|
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
rake("db:create:all -r ./config/initializers/pg_adapter_bugfix.rb")
rake("db:migrate")

git :init
git :add => "."
git :commit => "-a -m 'Initial commit'"

plugin 'exception_notifier', :git => 'git://github.com/rails/exception_notification.git', :submodule => true
plugin 'shoulda', :git => 'git://github.com/thoughtbot/shoulda.git', :submodule => true
plugin 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git', :submodule => true
plugin 'quietbacktrace', :git => 'git://github.com/thoughtbot/quietbacktrace.git', :submodule => true
plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :submodule => true
plugin 'active_scaffold', :git => 'git://github.com/activescaffold/active_scaffold ', :submodule => true

# rake("gems:install", :sudo => true)
