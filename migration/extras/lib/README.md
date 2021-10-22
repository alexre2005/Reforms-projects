PLD files for Oracle Forms libraries implemented in Re_Forms 21
================================================================
This directory contains PLD file for libraries that have
independent implementation in Re_Forms 21.

Installation instructions
----------------------------------------------------------------
To make use of such library you need to copy the '.pld' file
into 'src/pld' directory of your 'migration' folder.

Example installation
----------------------------------------------------------------
Making use of WEBUTIL library would require you to do the following:
  $ mkdir -p src/pld
  $ cp extras/lib/webutil.pld src/pld
