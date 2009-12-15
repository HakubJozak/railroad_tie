# Emacs 
file '.emacs', 
<<-END
  (find-file "#{Dir.getwd}")

  ; TO USE EMACS TAGS:
  ;
  ; install: mactag plugin, ctags ubuntu package
  ; edit: config/mactag.rb
  ; run: rake mactag
  ;
  (setq tags-table-list '("#{Dir.getwd}"))
END
