#!/bin/sh
if test "$#" -lt 1; then
    echo "Illegal number of parameters"
    echo "dockerScript.sh  [build|run]"
    exit 0
fi

tag=local/grive
containerName=grive
volumeFolther=config


if [ "$1" = "build" ]; then
    toExec="docker build --rm -t $tag ."
    echo "About to exec: $toExec\n\n"
    $toExec
elif [ "$1" = "run" ]; then
    if [ "$2" = "" ]; then
        echo "Illegal number of parameters"
        echo "dockerScript.sh  run [binding dir]"
        exit 0
    fi
    sleep=""
    if [ "$3" = "sleep" ]; then
        sleep="-e SLEEP=true"
    fi
    localPath=$2
    if [ "$2" = "." ]; then
        localPath="$(realpath .)/$volumeFolther" 
    fi
    toExec="docker rm $containerName"
    echo "About to exec: $toExec\n\n"
    $toExec
    toExec="docker run -it -v $localPath:/opt/grive --network host $sleep $tag"
    echo "About to exec: $toExec\n\n"
    eval $toExec
else 
    echo "Illegal option"
    echo "dockerScript.sh  [build|run]"
    exit 0
fi

