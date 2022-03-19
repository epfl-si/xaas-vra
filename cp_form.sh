#
CATEGORY='Forms/NAS (Public)/Day 2'
[ -z "$1" ] && echo "Give form name" && exit 255
echo "going with Forms/NAS (Public)/Day 2/$1"
[ -f "$HOME/Downloads/$1.json" ] && echo "JSON" && python -m json.tool $HOME/Downloads/$1.json > "$CATEGORY/$1.json"
rm -f $HOME/Downloads/$1.json
[ -f "$HOME/Downloads/$1.css" ] && echo "CSS" && cp $HOME/Downloads/$1.css "$CATEGORY/$1.css"
rm -f $HOME/Downloads/$1.css
