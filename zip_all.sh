#!/bin/sh

zip src/build/Unmapped_win32 -j src/build/Unmapped_win32.{exe,pck}
zip src/build/Unmapped_linux32 -j src/build/Unmapped_linux32.{x86,pck}
zip src/build/Unmapped_linux64 -j src/build/Unmapped_linux64.{x86_64,pck}
zip src/build/Unmapped_web -j src/build/web/*
