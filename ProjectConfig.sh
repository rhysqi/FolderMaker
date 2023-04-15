#!/bin/sh

echo "Project Name : "
read Project

echo "Choose Tree Directory :"
echo "1. Standard (bin, build, data, include, lib, src, test, tools)"
echo "2. Minimal (build, include, lib, src, test)"
echo "3. Complex (assets, bin, build, data, include, lib, res, src, test, tools)"

read choice

Standard_Tree(){
    mkdir bin
    mkdir build
    mkdir data
    mkdir include
    mkdir lib
    mkdir src
    mkdir test
    mkdir tools
}

Minimal_Tree(){
    mkdir build
    mkdir include
    mkdir lib
    mkdir src
    mkdir test
}

Complex_Tree(){
    mkdir assets
    mkdir bin
    mkdir build
    mkdir data
    mkdir include
    mkdir lib
    mkdir res
    mkdir src
    mkdir test
    mkdir tools
}

Check_Project() {
    if [ -d "$1" ]; then
        echo "Project name already taken."
        read Project
        Check_Project $Project
    else
        Project=$1
    fi
}

Check_Project $Project
mkdir $Project

if [ $choice = 1 ]; then
    cd $Project
    Standard_Tree
    echo "Standard directory settings success"
elif [ $choice = 2 ]; then
    cd $Project
    Minimal_Tree
    echo "Minimal directory settings success"
elif [ $choice = 3 ]; then
    cd $Project
    Complex_Tree
    echo "Complex directory settings success"
else
    echo "Invalid choice"
fi
