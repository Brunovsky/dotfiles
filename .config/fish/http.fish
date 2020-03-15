# curl things
# ===========

function hr --description 'Switch http domain' -a BACKEND
	if ! test -f ~/.local/share/curl_domains
		echo 'Error: Please create ~/.local/share/curl_domains file.'
		return 1
	end

	set -l ROWS (grep -Eve '^#|^\s*$' ~/.local/share/curl_domains)
	set -l NAMES (grep -Eve '^#|^\s*$' ~/.local/share/curl_domains | awk '{print $1}')
	set -l DOMAINS (grep -Eve '^#|^\s*$' ~/.local/share/curl_domains | awk '{print $2}')

	# handle 'hr --help'
	if test "$BACKEND" = "--help"
		echo "$ROWS"
		return 0
	end

	# handle 'hr', respond with current domain
	if test -z "$BACKEND"
		if test -z "$CURL_DOMAIN"
			echo 'No domain is set.'
			return 1
		end
		for i in (seq 1 (count $NAMES))
			if test "$CURL_DOMAIN" = "$DOMAINS[$i]"
				echo "$ROWS[$i]"
				return 0
			end
		end
		echo 'Unknown'
		return 0
	end

	# handle 'hr $BACKEND', switch current domain
	for i in (seq 1 (count $NAMES))
		if test "$BACKEND" = "$NAMES[$i]"
			set -gx CURL_DOMAIN "$DOMAINS[$i]"
			echo "$ROWS[$i]"
			return 0
		end
	end

	echo "Error: Didn't find that backend :(  Here's a list:"
	for i in (seq 1 (count $NAMES))
		echo "$ROWS[$i]"
	end
	return 1
end

complete -x -c hr -a '(grep -Eve \'^#|^\s*$\' ~/.local/share/curl_domains)'
