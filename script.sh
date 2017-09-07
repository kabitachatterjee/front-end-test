#!/bin/bash

echo "First arg: $1"
echo "Second arg: $2"
echo "Second arg: $3"
echo "Second arg: $4"

# if [ "$2" != "" ] && [ "$3" != "" ];
# then
# convert "$1" -resize "$2"x"$3" "$4"
# else
#   echo "error"
# fi

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -i|--input)
    INPUT="$2"
    shift # past argument
    ;;
    -w|--width)
    WIDTH="$2"
    shift # past argument
    ;;
    -h|--height)
    HEIGHT="$2"
    shift # past argument
    ;;
    -o|--output)
    OUTPUT="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
echo INPUT FILE = "${INPUT}"
echo WIDTH     = "${WIDTH}"
echo HEIGHT   = "${HEIGHT}"
echo OUTPUT FILE   = "${OUTPUT}"
if [ -z "$WIDTH" ] && [ -z "$HEIGHT"]; then
  echo "HEIGHT is empty and WIDTH is empty. Connot resize"
  exit
elif [ -z "$WIDTH" ] && [ ! -z "$HEIGHT" ]; then
  echo "WIDTH is empty"
  convert "${INPUT}" -resize x"${HEIGHT}" "${OUTPUT}"
elif [ ! -z "$WIDTH" ] && [ -z "$HEIGHT" ]; then
  echo "HEIGHT is empty"
  convert "${INPUT}" -resize "${WIDTH}"x "${OUTPUT}"
else
  convert "${INPUT}" -resize "${WIDTH}"x"${HEIGHT}"\! "${OUTPUT}"
fi
