#! /bin/bash
###############################################################################
#     File Name           :     run_all.sh
#     Created By          :     Andreas Hartel
#     Creation Date       :     [2016-05-09 18:38]
#     Last Modified       :     [2016-05-09 18:46]
#     Description         :     Run all PE problems and measure runtime 
###############################################################################

find -maxdepth 1 -mindepth 1 -type d -exec ./run_one.sh {} \;
