#! /bin/bash
###############################################################################
#     File Name           :     run_all.sh
#     Created By          :     Andreas Hartel
#     Creation Date       :     [2016-05-09 18:38]
#     Last Modified       :     [2016-05-09 18:46]
#     Description         :     Run all PE problems and measure runtime 
###############################################################################
echo $1
cd $1
rm solution
ghc solution.hs
time ./solution
cd ..
