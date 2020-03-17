# curl things
# ===========

function hr --description 'Switch http domain' -a BACKEND
	if test -z "$DOMAIN_ALIASES_FILE"
		echo 'Error: $DOMAIN_ALIASES_FILE is empty.'
		return 1
	end
	set -l file "$DOMAIN_ALIASES_FILE"
	if ! test -f "$file"
		echo "Error: Please create $file."
		echo 'Syntax: "#" for comments, one alias/line with 0 or more options:'
		echo '  $alias $domain $http-options'
		echo 'Usage (afterwards): hr $ALIAS'
	end

	set -l ROWS    (awk '!/^\s*#|^\s*$/ {print $0}' "$file")
	set -l NAMES   (awk '!/^\s*#|^\s*$/ {print $1}' "$file")
	set -l DOMAINS (awk '!/^\s*#|^\s*$/ {print $2}' "$file")
	set -l OPTIONS (awk '!/^\s*#|^\s*$/ {$1=$2=""; print $0}' "$file")

	# handle 'hr --help'
	if test "$BACKEND" = "--help"
		echo "$ROWS"
		return 0
	end

	# handle 'hr', respond with current domain
	if test -z "$BACKEND"
		if test -z "$AHTTP_DOMAIN"
			echo 'No domain is set.'
			return 1
		end
		for i in (seq 1 (count $NAMES))
			if test "$AHTTP_DOMAIN" = "$DOMAINS[$i]"
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
			set -gx AHTTP_DOMAIN "$DOMAINS[$i]"
			set -gx AHTTP_OPTIONS (string split -n ' ' $OPTIONS[$i])
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

complete -x -c hr -a '(awk \'!/^\s*#|^\s*$/ {print $1 "\t" $2}\' "$DOMAIN_ALIASES_FILE")'

# httpie things
# =============

function short-http --wraps http -a METHOD -a ENDP
	http $AHTTP_OPTIONS "$METHOD" "$AHTTP_DOMAIN$ENDP" $argv[3..-1]
end

function GET --wraps short-http ; short-http GET $argv ; end
function HEAD --wraps short-http ; short-http HEAD $argv ; end
function POST --wraps short-http ; short-http POST $argv ; end
function PATCH --wraps short-http ; short-http PATCH $argv ; end
function PUT --wraps short-http ; short-http PUT $argv ; end
function DELETE --wraps short-http ; short-http DELETE $argv ; end
function OPTIONS --wraps short-http ; short-http OPTIONS $argv ; end
