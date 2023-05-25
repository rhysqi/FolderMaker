#!/bin/sh

echo "Project Name : "
read Project

echo "Choose Tree Directory :"
echo "1. Standard (bin, build, data, include, lib, src, test, tools)"
echo "2. Minimal (build, include, lib, src, test)"
echo "3. Complex (assets, bin, build, data, include, lib, res, src, test, tools)"

read choice

echo "Include Build-System ? (y/N)"
read Include_Build

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

Inc_Build() {
	if [ $Include_Build = y ]; then
		echo "Cmake(C)/Meson(Mn)/Makefile(Mk)/Ninja(N) ?"
		read Build_System

		if [ $Build_System = "C" ]; then
			touch CMakeLists.txt
		elif [ $Build_System = "Mn" ]; then
			touch meson.build
		elif [ $Build_System = "Mk"]; then
			touch Makefile
		elif [ $Build_System = "N" ]; then
			touch ninja.build
		fi
	fi
}

Check_Project $Project
mkdir $Project

if [ $choice = 1 ]; then
    cd $Project
    Standard_Tree
    Inc_Build
    echo "Standard directory settings success"
elif [ $choice = 2 ]; then
    cd $Project
    Minimal_Tree
    Inc_Build
    echo "Minimal directory settings success"
elif [ $choice = 3 ]; then
    cd $Project
    Complex_Tree
    Inc_Build
    echo "Complex directory settings success"
else
    echo "Invalid choice"
fi
