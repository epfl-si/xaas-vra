#
# FORM_NAME="Onboard NAS Volume"
# FORM_NAME=$1
FORM_NAME=${1:-Modify_Deletion_Policy}.json
CATEGORY="Forms/NAS (Public)/Day ${2:-2}"
# echo "Going with: $CATEGORY/$FORM_NAME"

DOWNLOAD=$HOME/Downloads/$FORM_NAME
GIT_JSON=$CATEGORY/$FORM_NAME

compare() {
  /bin/echo -n " * Comparing $GIT_JSON with download: "
  # python3 -m json.tool "$DOWNLOAD" | diff -w - "$GIT_JSON" 2> /dev/null
  jq < "$DOWNLOAD" | diff -w - "$GIT_JSON" > /dev/null 2>&1
  DIFFS=$?
  if [ $DIFFS -eq 0 ]; then
    echo "no differences found"
    rm -f "$DOWNLOAD"
    exit 0;
  else
    echo "different"
  fi
}

copy() {
  # python3 -m json.tool "$DOWNLOAD" > "$GIT_JSON"
  jq < "$DOWNLOAD" > "$GIT_JSON"
  echo " * Copied to $GIT_JSON"
  rm -f "$DOWNLOAD"
}

[ -z "$FORM_NAME" ] && echo "No form name given" && exit 255

[ ! -f "$DOWNLOAD" ] &&\
  echo "$FORM_NAME not found in $HOME/Downloads" &&\
  exit 255

[ ! -f "$GIT_JSON" ] &&\
  echo "$FORM_NAME not found in project ${CATEGORY}" &&\
  copy &&\
  echo " * git add; git commit" &&\
  exit 0

compare
copy
echo " * git commit"
