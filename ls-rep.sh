#!/bin/bash
# ls replacement with color support for macOS.

# initial stuff.
if [ -f "~/.lsrc" ]; then
  echo color=noval > ~/.lsrc
else
  touch ~/.lsrc
  echo color=noval > ~/.lsrc
fi

# reading ~/.lsrc (not for public release yet)
#if [[ "$(head -n1 ~/.lsrc)" == "color=never" ]]; then
#  for i in *; do
#    echo $i
#  done
#elif [[ "$(head -n1 ~/.lsrc)" == "color=always" ]]; then
#  for i in *; do
#    if [ -d "$i" ]; then printf "\e[1;34m$i\e[0m\n"
#    elif [ -f "$i" ]; then printf "\e[0m$i\n"
#    fi
#  done
#fi

# main.
if [ -z "$1" ]; then
  for i in *; do
    if [ -d "$i" ]; then printf "\e[1;34m$i\e[0m\n"
    elif [ -f "$i" ]; then printf "\e[0m$i\n"
    fi
  done
else
# indentation removed for readability.
# No, your eyes aren't broken, you read that right
  case $1 in
    "-a")

for i in .* *; do
  if [ -d "$i" ]; then printf "\e[1;34m$i\e[0m\n"
  elif [ -f "$i" ]; then printf "\e[0m$i\n"
  fi
done

    ;;
    "--color=no")

for i in *; do
  echo $i
done

    ;;
    "--color=never")

for i in *; do
  echo $i
done
sed -i '' '1s/.*/color=never/' $HOME/.lsrc

    ;;
    "--color=yes" | "--color")

for i in *; do
  if [ -d "$i" ]; then printf "\e[1;34m$i\e[0m\n"
  elif [ -f "$i" ]; then printf "\e[0m$i\n"
  fi
done

    ;;
    "--color=always")

for i in *; do
  echo $i
done
sed -i '' '1s/.*/color=always/' $HOME/.lsrc

    ;;
    *)

if [ -d "$1" ]; then
  for i in $1/*; do
    if [ -d "$i" ]; then
      printf "\e[1;34m$i\e[0m\n"
    elif [ -f "$i" ]; then
      printf "\e[0m$i\n"
    fi
  done
elif [ -f "$1" ]; then
  echo $1
else
  printf "$0: illegal option -- $1\n"
fi

    ;;
  esac
fi
