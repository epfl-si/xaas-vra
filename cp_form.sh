#
CATEGORY='Forms/NAS (Public)/Day 2'
# FORM_NAME="NAS Volume"
FORM_NAME=$1
[ -z "$FORM_NAME" ] && echo "No form name given" && exit 255
[ ! -f "$HOME/Downloads/${FORM_NAME}.json" ] && echo "${FORM_NAME}.json not found in downloads" && exit 255
/bin/echo -n "Comparing ~/Downloads/${FORM_NAME}.json with Forms/$CATEGORY/${FORM_NAME}.json: "
python -m json.tool "$HOME/Downloads/${FORM_NAME}.json" | diff -w "$CATEGORY/${FORM_NAME}.json" - 2> /dev/null
DIFFS=$?
[ $DIFFS -eq 0 ] && echo "No differences found" && exit 0;
python -m json.tool "$HOME/Downloads/${FORM_NAME}.json" > "$CATEGORY/${FORM_NAME}.json"
echo "Copied to Forms/$CATEGORY/${FORM_NAME}.json"
echo "Don't forget git commit"
rm -f $HOME/Downloads/${FORM_NAME}.json
