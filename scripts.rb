file "script/development/terminal", <<-END
#!/bin/bash

cd #{Dir.getwd}
gnome-terminal --tab-with-profile-internal-id=Rails --title=Autotest -e autotest --tab-with-profile-internal-id=Rails --tab-with-profile-internal-id=Rails --title=Server -e script/server
END
