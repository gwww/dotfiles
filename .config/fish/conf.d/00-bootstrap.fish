status is-interactive; or return 0

######## Bootstrap fisher - fish plugin manager
set fisher_path $__fish_user_data_dir

if not test -f "$fisher_path/functions/fisher.fish"
  echo Installing fisher...

  pushd $fisher_path
  mkdir -p vendor_{conf,functions,completions}.d
  not test -L conf.d;      and ln -s vendor_conf.d        conf.d
  not test -L functions;   and ln -s vendor_functions.d   functions
  not test -L completions; and ln -s vendor_completions.d completions
  popd

  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher update
end
