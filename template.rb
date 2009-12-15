#- Utils --------------------------------------------
if template.starts_with?('../') or template.starts_with?('./')
  raise "Please specify the '-m' parameter with full path."
end

def sub_template(name)
  code = File.new(name).readlines.join
  self.instance_eval(code)
end

template_root = File.dirname(File.expand_path(template))
#---------------------------------------------------

run "rm public/index.html"
run "rm config/database.yml"
file '.autotest', "require 'redgreen/autotest'"

sub_template(template_root + '/emacs.rb')
sub_template(template_root + '/scripts.rb')
sub_template(template_root + '/postgre.rb')
sub_template(template_root + '/git.rb')
sub_template(template_root + '/plugins.rb')
