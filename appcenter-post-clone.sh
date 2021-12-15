#!/usr/bin/env bash

    echo "The Post Clone Script"

    SLN_PATH=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*.sln' -type f -print0)
    echo "SLN_PATH = $SLN_PATH"

    if [ -z "$RemoveUWPProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
    else
        UWP_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*UWP*.csproj' -type f -print0 )
        echo " UWP_PATHS = $UWP_PATHS"

        for p in "$UWP_PATHS"; do
            echo "Removing $p from $SLN_PATH" || true
            dotnet sln $SLN_PATH remove $p || true
        done
    fi
    
    if [ -z "$RemoveANDROIDProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
    else
        ANDROID_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -iname '*Android*.csproj' -type f -print0 )
        echo "ANDROID_PATHS = $ANDROID_PATHS"

        for p in "$ANDROID_PATHS"; do
            echo "Removing $p from $SLN_PATH" || true
            dotnet sln $SLN_PATH remove $p || true
        done
    fi
    
    if [ -z "$RemoveIOSProjects" ]
    then 
        echo "This script only runs within the context of App Center builds"
    else
        IOS_PATHS=$(find $APPCENTER_SOURCE_DIRECTORY -name '*IOS*.csproj' -type f -print0 )
        echo "IOS_PATHS = $IOS_PATHS"

        for p in "$IOS_PATHS"; do
            echo "Removing $p from $SLN_PATH" || true
            dotnet sln $SLN_PATH remove $p || true
        done    
    fi