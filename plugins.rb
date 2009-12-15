if yes?("Install plugins?")
  plugin 'exception_notifier', :git => 'git://github.com/rails/exception_notification.git', :submodule => true
  plugins'shoulda', :git => 'git://github.com/thoughtbot/shoulda.git', :submodule => true
  plugin 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git', :submodule => true
  plugin 'quietbacktrace', :git => 'git://github.com/thoughtbot/quietbacktrace.git', :submodule => true
  plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :submodule => true
  plugin 'active_scaffold', :git => 'git://github.com/activescaffold/active_scaffold ', :submodule => true  
end

# rake("gems:install", :sudo => true)
