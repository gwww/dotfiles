status is-interactive; or return 0

######## Bootstrap fisher - fish plugin manager
set fisher_path $__fish_user_data_dir

if not test -f "$fisher_path/functions/fisher.fish"
  echo Installing fisher...
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

  pushd $fisher_path
  not test -L vendor_conf.d; and ln -s conf.d vendor_conf.d
  not test -L vendor_functions.d; and ln -s functions vendor_functions.d
  not test -L vendor_completions.d; and ln -s completions vendor_completions.d
  popd

  fisher update
end
