# http
# ====

function short-http --wraps http -a METHOD -a ENDP
	http $HR_OPTIONS $METHOD $HR_DOMAIN$ENDP $argv[3..-1]
end

alias GET     'short-http GET'
alias HEAD    'short-http HEAD'
alias POST    'short-http POST'
alias PATCH   'short-http PATCH'
alias PUT     'short-http PUT'
alias DELETE  'short-http DELETE'
alias OPTIONS 'short-http OPTIONS'

function hr
	if hr-setup $argv
		set -e HR_OPTIONS
		read -g -x --line HR_DOMAIN < $XDG_CACHE_HOME/hr_domain
		while read --line row
			set -g -x HR_OPTIONS $HR_OPTIONS $row
		end < $XDG_CACHE_HOME/hr_options
	end
end

complete -x -c hr -a '(hr-setup --fish-completions)'
