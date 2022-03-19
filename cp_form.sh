#
CATEGORY='Forms/NAS (Public)/Day 1'
FORM_NAME="NAS Volume"
[ -z "$FORM_NAME" ] && echo "Give form name" && exit 255
echo "going with Forms/NAS (Public)/Day 2/${FORM_NAME}"
[ -f "$HOME/Downloads/${FORM_NAME}.json" ] && echo "JSON" && python -m json.tool "$HOME/Downloads/${FORM_NAME}.json" > "$CATEGORY/${FORM_NAME}.json"
rm -f $HOME/Downloads/${FORM_NAME}.json
[ -f "$HOME/Downloads/${FORM_NAME}.css" ] && echo "CSS" && cp $HOME/Downloads/${FORM_NAME}.css "$CATEGORY/${FORM_NAME}.css"
rm -f $HOME/Downloads/${FORM_NAME}.css
