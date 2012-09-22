STATUS=0
function phantom {
	phantomjs tests/phantom.js $1
	if [ "$?" -gt 0 ]; then
		STATUS=1
	fi
}
# Run unit tests
echo "Running base tests."
phantom
echo "Simulating a jQuery conflict."
phantom conflict=jquery
echo "Simulating a MooTools conflict."
phantom conflict=mootools
echo "Simulating a Dojo conflict."
phantom conflict=dojo
echo "Simulating a YUI conflict."
phantom conflict=yui
exit $STATUS