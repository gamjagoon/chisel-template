#!/usr/bin/env bash
if [ "$#" -lt 1  ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 foldername filename"
	exit 1
fi
rm -rf ./test_run_dir/$2*
echo "start sbt"
sbt "test:runMain $1.$2Main --generate-vcd-output on" > test.log
cat test.log
gtkwave ./test_run_dir/$2*/*.vcd
