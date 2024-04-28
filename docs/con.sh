# download imgs with names ~/Desktop/1.jpg 2.jpg ... first
dirname=$1
if [[ ! $dirname ]]
then
  echo 'plz provide dirname'
  exit
fi

# plz run script in project root dir
cd imgs
echo create dir $dirname
mkdir $dirname && cd $dirname
mv ~/Desktop/*.jpg .
for f in *.jpg; do
  filename=${f%.jpg}
  echo ![]\(${filename}.jpeg\)>>index.md
  convert "$f" -resize 50% "${filename}.jpeg"
  echo $f converted...
  rm $f
done

echo "adding img link to index.md"
cd ../..
echo "### $dirname\n[imgs](imgs/$dirname/)\n\n$(cat index.md)" >index.md
echo 'done'
