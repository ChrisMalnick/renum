# **renum**

Running this script will overwrite the first six characters of every line in the specified file.
Empty lines will simply have six characters added. The trailing new line will be preserved.

#### Example

Starting with:

           IDENTIFICATION DIVISION.
           PROGRAM-ID. Example.
           AUTHOR. Chris Malnick.
    
           DATA DIVISION.
           WORKING-STORAGE SECTION.

And running:

    ./renum.sh examp.cbl 10

Results in:

    000010 IDENTIFICATION DIVISION.
    000020 PROGRAM-ID. Example.
    000030 AUTHOR. Chris Malnick.
    000040
    000050 DATA DIVISION.
    000060 WORKING-STORAGE SECTION.

And then running:

    ./renum.sh examp.cbl 100

Results in:

    000100 IDENTIFICATION DIVISION.
    000200 PROGRAM-ID. Example.
    000300 AUTHOR. Chris Malnick.
    000400
    000500 DATA DIVISION.
    000600 WORKING-STORAGE SECTION.

#### Considerations

Any non-zero, positive integer can be specified as the increment so long as no sequence number will exceed the maximum of 999999 given the specified file's line count.

If the script fails to run, it likely needs to be given execute permission:

    chmod --x renum.sh

If ever editing the file, consider running dos2unix or equivalent on it after to be safe.

Consider adding this file to the PATH or creating an alias in .bashrc in order to enable the script to run from any directory:

    alias renum='C:/example/directory/renum.sh'
