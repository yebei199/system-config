
# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# readline
$env.config = {
    edit_mode: vi
  }

# zoxide
#source ~/.zoxide.nu

# uv
echo 'eval "$(uv generate-shell-completion bash)"'

# Windows ===============

$env.YAZI_FILE_ONE = 'C:\Program Files\Git\usr\bin\file.exe'
