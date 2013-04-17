
rm /Users/gnarf/Desktop/Screen\ Shot* 2>/dev/null

function p {
  tabname $1
  cd $(find ~/Projects -name $1 -type d -maxdepth 3 | tail -n 1)
  subl .
  clear
  pwd
}

function t {
  tabname $1
}

function tabname {
  printf "\e]1;$1\a"
}
 
function winname {
  printf "\e]2;$1\a"
}
