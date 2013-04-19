#!/bin/bash

# Configuration variables
RUNNER=ruby
SCRIPT=script.rb
TMP_FILE=.test_diff

# Input files detected in the current directory
files=`find . -regex "\./in[0-9]+\.txt"`

for input_file in $files ; do
  # Extract the index from input_file
  str=${input_file:4}
  ary=(${str//./ })
  idx=${ary[0]}

  output_file="./out$idx.txt"

  echo -ne "Testing scenario #$idx... "
  if [ -e $output_file ] ; then
    cat $input_file | $RUNNER $SCRIPT | diff $output_file - > $TMP_FILE

    if [ $? == 0 ] ; then
      rm $TMP_FILE
      echo "success"
    else
      echo "failure"
      cat $TMP_FILE
      exit
    fi
  else
    echo "failure ($output_file is missing)"
  fi
done

