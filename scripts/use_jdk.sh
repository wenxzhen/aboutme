
declare -a jdk_mappings=(["6"]="/c/Java/jdk1.6.0_39" ["7"]="/c/Java/jdk1.7.0_79" ["8"]="/c/Java/jdk1.8.0_73")

if test -z "$1"; then
	echo "Usage: show_jdk.sh [6|7|8]"
	exit 1
fi

if test -z "${jdk_mappings["$1"]}"; then
	echo "JDK version: $1 is not supported!"
	exit 1
fi 

show_jdk.sh
new_jdk=${jdk_mappings["$1"]}
echo "change JDK to $new_jdk"

setx JAVA_HOME "$new_jdk"
setx CLASSPATH "./:$new_jdk/lib/tools.jar:$new_jdk/lib/dt.jar"

echo "Please re-open a GIT BASH"