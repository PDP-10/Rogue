@Comment{[ECLC]PS:<RELPH.ROGUE>ROGUE-SETUP.MSS.33, 28-Aug-84 20:23:05, Edit by RELPH}
@Device(File)
@Begin(Comment)
Gary Craig, January 1983
USC-ECL
@End(Comment)

This file is for use by the person who is responsible for ECL ROGUE@+(*) at any
foreign site (the Rogue-@|Master).

--- Files for Installation ---

The following files are provided for the installation of ECL ROGUE:

@Begin(description)
Rogue-Init@.Exe@\A version of ROGUE ready to initialize

Rogue@.Configuration@\Definitions for ROGUE files, terminal types, and special
accounts

Rogue@.Doc@\A Player's Guide

Rogue-Init@.Instructions@\Instructions for a player's INIT file

Rogue-Setup@.Doc@\These instructions, for the Rogue-Master

Rstat-Init@.Exe@\A ROGUE score-review program

Score@.Exe@\A ROGUE Score-File hacker, for the Rogue-Master
@End(Description)

@Center(--- Step-by-step Setup Instructions ---)
@Begin(Enumerate)
Decide where to keep ROGUE.  Its own directory or subdirectory would be nice.
This directory should also be the one in which the Runtime files (see below)
are kept.  Thus, the directory should be protected 774040, allowing access by
individual file protection.

@Begin(Multiple)
Edit the file ROGUE@.CONFIGURATION to reflect the locally-@|defined runtime
files, terminal types, special accounts, and the mailing address for
bug-@|reports.

@Begin(Enumerate)
@Begin(Multiple)
ROGUE requires four files for setup, integrity and score-@|keeping purposes.
For each file there must be a corresponding entry in the Configuration file.
The four files, and the Configuration file keyword for each, are as follows:
@Begin(Description)
the Score file@\SCORE-FILE

the Names file@\NAMES-FILE

the Log file@\LOG-FILE

the Message file@\MESSAGE-FILE
@End(Description)

These four files will be created by ROGUE with the correct protections and
read/@|write dates.  In order to set up the public version of ROGUE, one must
have a staff account, i@.e@., one's current account must be in the staff
account list in the Configuration file.  This list of accounts can be modified
if necessary.  You must also have write access to the directory in which you
wish to create the files you specify.
@End(Multiple)

The terminal-@|types are those which are defined (in the EXEC) and are
ROGUE-@|compatible.  The ROGUE-@|compatible terminals are the
following:  VT52, ANSI, Datamedia-2500, Concept-108, Infoton-400,
Hazeltine-1500, or HP26xx.  The file itself describes how to set up the
terminal type list; it is very simple.

Also in this file, you can define any login-@|accounts to be `staff'
accounts.  Normally, the account is the string returned by the GACCT%
JSYS, however, if the accounting system is not being used, then the
username is used as the account string.  Users with these accounts do
not receive the introductory message (warning about playing during
prime-@|time, etc@.), and will be able to set the game up as follows.
Your account string should be in this list.  The USC-ECL defaults are
in it now and can be removed if desired.  Wildcards are acceptable in
account fields.

You may also define any login-@|accounts to be `illegal' accounts.  Users with
these accounts will be denied access to ROGUE, and will receive an error
message when they attempt to play.  Wildcards are acceptable here too.

ROGUE now has the capability of checking the load average on the system and
stopping play if it gets above the value that you have specified.  The player
will be asked if he would like to save his game and play will be terminated.
If the load average is too high when a player attempts to start ROGUE, a
warning message will be printed and play will be disallowed.  The cutoff value
for the Load Average can be specified, but the check can be bypassed by
specifying a load average of zero.  This check will also be bypassed if the
played has an account which appears in the list of `staff' accounts.

Additionally, if you wish to define a local BUG-REPORT mailbox you may do so
in this file by making the appropriate entry.  The format is explained in
the configuration file.
@End(Enumerate)
@End(Multiple)

Run ROGUE-INIT@.EXE.  You will be in `Rogue Setup Mode', which is
explained under `ROGUE Setup Mode' below.

After ROGUE-INIT resaves itself as ROGUE@.EXE, copy it to the directory from
which it will be run.  This may or may not be the same directory in which the
-INIT files are kept, of course.  GAM: is a good choice.  ROGUE should be
protected execute-@|only (;P771212).

Edit the file you have specified to be the Message file.  The Message file must
be a text file with no more than about ten lines in it.  If the Message file is
not empty when a player starts a game of ROGUE the contents of the file will be
printed as a Message to the player.  Requests to be made of ROGUE players can
be put in this file, among other things.  If the Message file is empty when a
player begins ROGUE, then no message will be printed.

Run RSTAT-INIT@.EXE.  You will be in `R-STAT Setup Mode', similar to `ROGUE
Setup Mode'.

RSTAT-INIT will save itself as R-STAT@.EXE.  Place this program in the
same directory and protect it execute-@|only.  It provides a way to view
the current scores without playing the game.
@End(Enumerate)

Wasn't that simple?

@Center(--- ROGUE Setup Mode ---)

Here's an example of ROGUE setup mode:

@Begin(Verbatim)

	@@Run Rogue-Init.Exe
	--- ROGUE Setup Mode ---
	Enter null line to exit...

	Enter the configuration file name: Rogue@.Configuration
	Creating PS:<ROGUE>ROGUE@.SCORES
	Creating PS:<ROGUE>ROGUE@.NAMES
	Creating PS:<ROGUE>ROGUE@.LOG
	Creating PS:<ROGUE>ROGUE@.MSG
	Saving as ROGUE@.EXE
	@@

@End(Verbatim)
You can abort by typing <CRLF>.  As ROGUE attempts to create each Runtime file
you may receive an informational message.  One indicates that the file already
exists and that the old version is being retained (occurs when putting up newer
versions), or that an I/O error (of some sort) occurred.  If this happens, the
file may not have been created.  However, the name has been stored o@.k@.
internally, you just have to create the file manually.  It usually only happens
if you don't have write access to the directory, the directory is full, etc.

@Center(--- Scores ---)
The program SCORE.EXE is provided to allow the Rogue-@|Master to fix the Score
File if it has been tampered with or has otherwise become corrupt, or to
construct a new Score File if the old one has been deleted.

@Center(--- Notes ---)

Those familiar with the UNIX@+(*) version of Rogue may notice minor differences
in the play of the game.  The file ROGUE@.DOC fully describes our version.
These are the major differences:
@Begin(Itemize)
The capital letter commands operate the same as f-@|prefix commands in
the old version.

There are 52 monsters, the extra 26 represented by lower-@|case letters.
These monsters, obviously, do not necessarily correspond to those in
the UNIX version of ROGUE, and in general the monsters in ECL ROGUE do not
correspond to those of UNIX ROGUE.

The keypad digits can be used to specify direction (of movement, etc@.),
rather than a repeat count.

Of course, we have added various new magical devices, and removed a
very few.
@End(Itemize)
The mail address is also in ROGUE@.DOC and should be changed therein to reflect
the address you have entered in the BUG-REPORT address when initializing ROGUE.

All questions should be sent to BUG-ROGUE@@ECLC@.USC@.EDU.  Bug reports and
suggestions for enhancements should also be sent here, and will be acted upon
swiftly.  We are receptive to suggestions, comments, and gripes.  We also ask
that any requests for distribution to other sites which you may receive be
referred to us.  This will enable us to ensure that everyone has the current
copy.  You may receive messages (hopefully not too many) when a new version is
ready for distribution.

Have fun!
@Begin(Center)
Gary Craig
Oscar Erickson
John Relph
Jay Skeer

The Authors
@End(Center)

 @+(*)UNIX and ROGUE are trademarks of Bell Laboratories.
