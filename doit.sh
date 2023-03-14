goal=https://github.com/erichshowcase/flasktrackingdb/tree/develop/app
echo $goal 
echo $goal 
echo $goal 
a=$(git remote -v)
b=$(echo $a | cut -f 2 -d " ") 
c=$(echo $b | cut -f 2 -d "@") 
d=$(echo $c | cut -f 1 -d ":")
e=$(echo $c | cut -f 2 -d ":")
echo "a $a" 
echo "b $b"
echo "c $c"
echo "d $d"
echo "e $e" 
f=$(echo $e | cut -f 1 -d ".")
echo "f $f"
g=$(git branch)
h=$(echo $g | cut -f 1 -d " ")
echo "g $g" 
echo "h $h" 
echo "https://$d/$f/tree/$h/app"
