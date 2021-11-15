echo "Beginnning blocks... hopefully this doesnt break my computer... LOL"
# Currently this is a blacklist
filename='whitelist.txt'

# Adding sudo permissions so you can block yourself
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# Checking for flags -p
while getopts p: flag
do
    case "${flag}" in
        p) addremove=${OPTARG};;
    esac
done

# loop through and either block or unblock yourself from the application
while read line; do
	if [ addremove == "block" ]
	then
		echo "Blocking $line"
		chmod -r  "/Applications/$line.app"
	else
		echo "Unblocking $line"
		chmod +r "/Applications/$line.app"
	fi

done < $filename