@Comment{<RELPH.ROGUE>ROGUE.MSS.40, 12-Nov-87 22:01:20, Edit by RELPH}
@device(file)
@blankspace(0.5 inch)
@begin(Center)
ECL ROGUE@+(*) User Manual

Documentation adapted by: Gary Craig
With help from: John M. Relph
University of Southern California
May 1982 - April 1983
@end(Center)
@blankspace(0.5 inch)

This manual describes ECL ROGUE version 4, developed at the University of
Southern California by Gary Craig, Oscar Erickson, John Relph, and Jay
Skeer (remember those names), in Summer, 1982.  This manual was last
updated in @Value(Month), @Value(Year).

What follows is the (somewhat edited) text of the original Rogue User
Manual, to whose authors I am deeply grateful.  The text has been
altered to reflect implementation discrepancies and system-@|dependent
information.
@blankspace(1 inch)
@begin(center)

A Guide to the Dungeons of Doom

Michael C. Toy
Kenneth C. R. C. Arnold

Computer Systems Research Group
Department of Electrical Engineering and Computer Science
University of California
Berkeley, California 94720
@end(center)
`Rogue' is a visual CRT based fantasy game which runs under the TOPS20
timesharing system.  `Rogue' is a trademark of Bell Laboratories.
This paper describes how to play Rogue, and gives a few hints for
those who might otherwise get lost in the Dungeons of Doom.

You have just finished your years as a student at the local fighter's
guild.  After much practice and sweat you have finally completed your
training and are ready to embark upon a perilous adventure.  As a test
of your skills, the local guildmasters have sent you into the Dungeons
of Doom.  Your task is to return with the Amulet of Yendor.  Your
reward for the completion of this task will be a full membership in
the local guild.  In addition, you are allowed to keep all the loot
you bring back from the dungeons.  In preparation for your journey,
you are given an enchanted mace, a bow, and a quiver of arrows taken
from a dragon's hoard in the far off Dark Mountains.  You are also
outfitted with elf-@|crafted armor and given enough food to reach the
dungeons.  You say goodbye to family and friends for what may be the
last time and head up the road.  You set out on your way to the
dungeons and after several days of uneventful travel, you see the
ancient ruins that mark the entrance to the Dungeons of Doom.  It is
late at night, so you make camp at the entrance and spend the night
sleeping under the open skies.  In the morning you gather your mace,
put on your armor, eat what is almost your last food, and enter the
dungeons.  You have just begun a game of Rogue.

Your goal is to grab as much treasure as you can, find the Amulet of
Yendor, and get out of the Dungeons of Doom alive.  On the screen, a
map of where you have been and what you have seen on the current
dungeon level is kept.  As you explore more of the level, it appears
on the screen in front of you.  Rogue differs from most computer
fantasy games in that it is screen oriented.  Commands are all one or
two keystrokes, as opposed to pseudo English sentences, and the
results of your commands are displayed graphically on the screen
rather than being explained in words.  Another major difference
between Rogue and other computer fantasy games is that once you have
solved all the puzzles in a standard fantasy game, it has lost most of
its excitement and it ceases to be fun.  Rogue, on the other hand,
generates a new dungeon every time you play it and even the authors
find it an entertaining and exciting game.

@center(THE DISPLAY)

In order to understand what is going on in Rogue you have to first get some
grasp of what Rogue is doing with the screen.  The Rogue screen is intended to
replace the `You can @w<see ...'> descriptions of standard fantasy games.  The
picture below is a sample of what a Rogue screen might look like.
@begin(verbatim)

                -------+----
                |..........+###
                |..@@....]..|
                |....B.....|
                |..........|
                ------------

Str: 16(16) Dex: 15(15) Int: 17(17)
Gold: 0 Level: 1 Xp: 1/0 Ac: 6 Hp: 12(12)


@end(verbatim)
At the bottom line of the screen are a few pieces of cryptic
information describing your current status.  Here is an explanation of
what these things mean.

The upper of these two lines gives various statistics about your
abilities.  @w<`Str: N(M)'> is your strength, which is always a positive
integer.  `N' is your current strength, `M' is your maximum strength
possible.  Note that both these values can be changed through various
means.  Your strength determines how well you perform in combat.
@w<`Dex: N(M)'> is your dexterity.  This value determines how well you
avoid monster's blows, among other things.  @w<`Int: N(M)'> is your
intelligence.  Intelligence is referenced when you are, for example,
trying to discover traps, reading scrolls, and various other
instances.  This line of information will not appear on the display
until after you have gained sufficient experience (see below) to know
the values.

The second line of information always appears and contains the
following:
@Begin(Description)
`Level:'@\This number indicates how deep you have gone in
the dungeon.  It starts at one and goes up as you go deeper into the
dungeon.

`Gold:'@\The number of gold pieces you have managed to find
and keep with you so far.

`Hp:'@\Your current and maximum hit points.
Hit points indicate how much damage you can take before you die.  The
more you get hit in a fight, the lower they get.  You can regain hit
points by resting.  The number in parentheses is the maximum number
your hit points can reach.

`Ac:'@\Your current armor class.  This
number indicates how effective your armor is in stopping blows from
unfriendly creatures.  The lower this number is, the more effective
the armor.

`Xp:'@\These two numbers give your current experience
level and experience points.  As you do things, you gain experience
points.  At certain experience point totals, you gain an experience
level.  The more experienced you are, the better you are able to fight
and to withstand magical attacks.
@End(Description)
The top line of the screen is reserved for printing messages that
describe things that are impossible to represent visually.  If you see
a --More-- on the top line, this means that Rogue wants to print
another message on the screen, but it wants to make certain that you
have read the one that is there first.  To read the next message, just
type a space.  The rest of the screen is the map of the level as you
have explored it so far.  Each symbol on the screen represents
something.  Here is a list of what the various symbols mean:
@begin(description)

`@@'@\This symbol represents you, the adventurer.

`-',`|'@\These symbols represent the walls of rooms.

`+'@\A door to/from a room.

`.'@\The floor of a room.

`#'@\The floor of a passage between rooms.

`*'@\A pile or pot of gold.

`)'@\A weapon of some sort.

`['@\A piece of armor.

`!'@\A flask containing a magic potion.

`?'@\A piece of paper, usually a magic scroll.

`='@\A ring with magic properties.

`/'@\A magical staff or wand.

`^'@\A trap, watch out for these.

`%'@\A staircase to other levels.

`&'@\A piece of food.
@end(description)

The alphabetic characters represent the various inhabitants of the
Dungeons of Doom.  Watch out, they can be nasty and vicious.

@center(GIVING COMMANDS TO ROGUE)

Commands are given to Rogue by typing one to three characters.  The
list of commands is rather long, but it can be read at any time during
the game with the `?' command.  Here it is for reference, with a short
explanation of each command.
@begin(description)
`?'@\The help command.  Lists all commands available.

`/'@\This is the `What is that on the screen?' command. A `/'
followed by any character that you see on the level, will tell you
what that character is.  For instance, typing `/@@' will tell you that
the symbol `@@' represents you, the player.

`h'@\Move left.  You move one space to the left.  If you use upper
case you will continue to move left until you find something of
interest.  This works for all movement commands (e.g., `H' means run in
direction `h').  Note that you cannot attack a monster in fast
movement, since you will stop without hitting the monster in question.
See below for another method of movement preferred by some, `keypad
movement'.

`j'@\Move down.

`k'@\Move up.

`l'@\Move right.

`y'@\Move diagonally up and left.

`u'@\Move diagonally up and right.

`b'@\Move diagonally down and left.

`n'@\Move diagonally down and right.

`@ '@\Hit the space bar to do nothing but rest.  Remember that
monsters get one move for each `@ ' typed, so be careful with the
<repeat> key.

`t'@\Throw an object.  This is a prefix command.  When followed with
a direction it throws an object in the specified direction.  (e.g.,
type `tph' to throw object `p' to the left.)

`f'@\Find prefix.  Equivalent to typing a capital movement command.
E.g., `fh' is the same as `H'.  Provided for compatiblity with older
versions.

`z'@\Zap prefix.  Point a staff or wand in a given direction and fire
it.  You are asked first what to zap and then the direction.  After
being identified, non-@|directional staffs need not be given a
direction.  Some staves always require a direction to `zap'.

`s'@\Search for traps and secret doors.  Examine each space
immediately adjacent to you for the existence of a trap or secret
door.  There is a large chance that even if there is something there,
you won't find it, so you might have to search a while before you find
something.

`>'@\Climb down a staircase to the next level.  Not surprisingly,
this can only be done if you are standing on staircase.

`i'@\Inventory.  List what you are carrying in your pack.

`I'@\Single-item inventory.  Describes one specified item in your pack,
or all the items of a specified class, by typing the character that
represents the type of object you wish to inventory.

`q'@\Quaff one of the potions you are carrying.

`r'@\Read one of the scrolls in your pack.

`e'@\Eat food from your pack.

`w'@\Wield a weapon.  Take a weapon out of your pack and carry it for
use in combat, replacing the one you are currently using (if any).

`W'@\Wear armor.  You can only wear one suit of armor at a time.
This takes extra time.

`T'@\Take armor off.  You can't remove armor that is cursed.  This
also takes extra time.

`P'@\Put on a ring.  You can wear only two rings at a time (one on
each hand).  If you aren't wearing any rings, this command will ask
you which hand you want to wear it on, otherwise, it will place it on
the unused hand.  The program assumes that you wield your sword in
your right hand.

`R'@\Remove a ring.  If you are only wearing one ring, this command
takes it off.  If you are wearing two, it will ask you which one you
wish to remove.

`d'@\Drop an object.  Take something out of your pack and leave it
lying on the floor.  Only one object can occupy each space.  You
cannot drop a cursed object at all if you are wielding or wearing it.

`C'@\Call an object something.  If you have a type of object in your
pack which you wish to remember something about, you can use the call
command to give a name to that type of object.  This is usually used
when you figure out what a potion, scroll, ring, or staff is after you
pick it up.  (See the option `ask' below).

`^'@\Identify a trap in your vicinity.  This command asks for the direction of
the trap which is to be identified.

`o'@\Examine and set options.  This command is further explained in
the section on options.

`v'@\Type out the current Rogue version information.  This tells you
which version of the game you are playing, and any recent updates.

`^L'@\Redraws the screen.  Useful if spurious messages or
transmission errors have messed up the display.  Hold down <control>
and type `L'.

`^R'@\Repeat last message.  Useful when a message disappears before
you can read it.  Hold down <control> and type `R'.

`^I'@\Re-initialize terminal.  Use this if you become detached from
your game or the terminal otherwise refuses to cooperate.

`^T'@\Print current ROGUE run status.

`^W'@\Check to see who is using a certain ROGUE name.

<esc>@\Cancel a command or prefix.

`Q'@\Quit.  Leave the game.

`S'@\Save the current game in a file.  Rogue won't let you start up a
copy of a saved game, and it removes the save file as soon as you
start up a restored game.  This is to prevent people from saving a
game just before a dangerous position and then restarting it if they
die.  To restore a saved game, give the file name as a `JCL' (or
`RESCAN') argument to Rogue.  As in: @w[`@@<Games>Rogue.Exe Rogue.Save'].
@end(description)

@center(KEYPAD MOVEMENT)

The numbers on the keypad, if your terminal has one, can also be used
to move.  The direction that you want to move corresponds to the key
in that direction on the keypad from the center `5' key.  Thus, you
could move upwards by typing `8', down and right with `3', etc.  `5'
is used to move in `fast mode', as in capital letter and `f' prefix
commands above.  Just type `5' followed by the digit representing the
desired direction.  Two consecutives `5's lock fast mode on, so that
all commands operate in fast mode without the fast prefix.  Two more
consecutive `5's will turn fast mode off again.  If you attack a
monster or are attacked by one fast mode will be turned off.

@center(MOVEMENT AND VISION IN THE DUNGEON)

Rooms in the dungeons are either lit or dark.  If you walk into a lit
room, the entire room will be drawn on the screen as soon as you
enter.  If you walk into a dark room, it will only be displayed as you
explore it.  Upon leaving a room, all objects inside the room which
might move are erased from the screen.  In the darkness you can only
see one space in all directions around you.  A corridor is always
dark.

If you see a monster and you wish to fight it, just attempt to
run into it.  Many times a monster you find will mind its own business
unless you attack it.  It is often the case that discretion is the
better part of valor.

When you find something in the dungeon, it is common to want to pick
the object up.  This is accomplished in Rogue by walking over the
object.  If you are carrying too many things, the program will tell
you and it won't pick up the object, otherwise it will add it to your
pack and tell you what you just picked up.

Many of the commands that operate on objects must prompt you to find
out which object you want to use.  You may type a `*' to get a list of
the objects which you could use for a particular command.  If you
change your mind and don't want to do that command after all, just
type an `<esc>' and the command will be aborted.

Some objects, like armor and weapons, are easily differentiated.
Others, like scrolls and potions, are given labels which vary
according to type.  During a game, any two of the same kind of object
with the same label are the same type.  However, the labels will vary
from game to game.  When you use one of these labeled objects, if its
effect is obvious Rogue will remember what it is for you.  If it's
effect isn't extremely obvious, you can use the `call' command (see
above) or the `ask' option (see below) to scribble down something
about it so you will recognize it later.  Some weapons, like arrows,
come in bunches, but most come one at a time.  In order to use a
weapon, you must wield it.  To fire an arrow out of a bow, you must
first wield the bow, then throw the arrow.  You can only wield one
weapon at a time, but you can't change weapons if the one you are
currently wielding is cursed.

@center(OBJECTS IN THE DUNGEON)

There are various sorts of armor lying around in the dungeon.  Some of
it is enchanted, some is cursed, and most is just normal.  Different
armor types have different armor classes.  The lower the armor class,
the more protection the armor affords against the blows of monsters.
Here is a list of the various armor types and their normal armor
class:
@begin(verbatim)

                    Type                          Class =

                    None                            10
                    Leather armor                    8
                    Studded leather / Ring mail      7
                    Scale mail                       6
                    Chain mail                       5
                    Banded mail / Splint mail        4
                    Plate mail                       3

@end(verbatim)
If a piece of armor is enchanted, its armor class will be lower than normal.

If a suit of armor is cursed, its armor class will be higher, and you
will not be able to remove it.  However, not all armor with a class
that is higher than normal is cursed.  Scrolls come with titles in an
unknown tongue.  After you read a scroll, it disappears from your
pack.  Potions are labeled by the color of the liquid inside the
flask.  They disappear after being quaffed.  Staves and wands do the
same kinds of things.  Staves are identified by a type of wood; wands
by a type of metal or bone.  They are generally things you want to do
to something over a long distance so you must point them at what you
wish to affect to use them.  Some staves are not affected by the
direction they are pointed, though.  Staves come with multiple magic
charges, the number being random, and when they are used up, the staff
is just a piece of wood or metal.  Rings are very useful items, since
they are relatively permanent magic, unlike the usually fleeting
effects of potions, scrolls, and staves.  Of course, the bad rings are
also more powerful.  Most rings also cause you to use up food more
rapidly, the rate varying with the type of ring.  Rings are
differentiated by their stone settings.

@center(SETTING YOUR OPTIONS)

Due to variations in personal tastes and conceptions of the way Rogue
should do things, there are a set of options you can set that cause
Rogue to behave in various different ways.

When you type `o' in Rogue, it clears the screen and displays the
current settings for all the options.  It then places the cursor by
the value of the first option and waits for you to type.  You can type
a `<crlf>', which means to go to the next option, an `<esc>' which
means to return to the game, or you can give the option a value.  For
boolean options this merely involves typing `t' for true or `f' for
false.  For string options, type the new value followed by a <crlf>.

Here is a list of the options and an explanation of what each one is
for.  The default value for each is enclosed in square brackets.  For
character string options, input over thirty characters will be ignored.
@begin(description)

Terse [false]@\Useful for those who are tired of the sometimes
lengthy messages of Rogue.

Jump [true]@\If this option is set, running moves will not be
displayed until you reach the end of the move.  This saves
considerable cpu and display time.  YOU SHOULD SET THIS OPTION `TRUE'!

Flush [true]@\All typeahead is thrown away after each round of
battle.  This is useful for those who type far ahead and then watch in
dismay as a Kobold kills them.

Slow [false]@\Do inventories one item at a time.  Useful for dialups,
because the echo area is used, rather that the entire screen.

Ask [true]@\Upon reading a scroll or quaffing a potion which does not
automatically identify itself upon use, Rogue will ask you what
to name it so you can recognize it if you encounter it again.

Turn [true]@\Turn corners in hallways when in `fast' movement.  That is,
you can run all the way through a hallway, even if the hall bends.  You will
stop if you meet a monster or if the hall forks or dead-@|ends.

Tomb [true]@\Display a tombstone upon the death of your character.

Name [Username]@\This is the name of your character.  It is used if
you get on the top ten scorer's list.  Only the first 25 characters of
the names will be shown on this list, though.  The default value is
your login username.  You cannot choose a valid username other than
your own.

Fruit [slime-mold]@\This should hold the name of a fruit (or any
food) that you enjoy eating.  It is basically a whimsey that the
program uses in a couple of places.

Save [Ps:Rogue.Save]@\The default file name for saving the game.
@end(description)

The file `Rogue-Init@.Instructions' details the setting up of a file to
initialize Rogue automatically upon startup, and should be read.
Commands can be included to set variables, player's name, etc.

@center(SCORING)

Rogue usually maintains a list of the top ten scoring people on your machine.
If you score higher than someone else on this list you will be inserted in the
proper place under your current name.  If you quit the game, you get out with
all of your gold intact.  If, however, you get killed in the Dungeons of Doom,
your body is forwarded to your next-@|of-@|kin, along with 95% of your gold;
five percent of your gold is kept by the Dungeons' wizard as a fee.  This
should make you consider whether you want to take one last hit at that monster
and possibly live, or quit and thus stop with whatever you have.  If you quit,
you do get all your gold, but if you swing and live, you might find more.  If
you just want to see what the current top ten list is, you can run the program
`R-Stat'.

Additionally, a `Personal' top ten scores list is maintained.  A
human-@|readable file called `Rogue@.Scores' is written in the player's
connected directory.  This file is for the player's use only, and may
be altered in any way.  However, if Rogue cannot interpret the
contents of the file, the questionable lines are removed.  Thus, it is
to your advantage to not alter the file.  Rogue automatically updates
the file if you complete a game which is one of your personal best
with your score, character name, date, and disposition of the game.
Note that the neither the main score list nor the personal score list
are updated when the game is quit using the ^C command.

@center(ACKNOWLEDGEMENTS)

Rogue was originally conceived of by Glenn Wichman and Michael Toy.
Ken Arnold and Michael Toy then smoothed out the user interface, and
added jillions of new features.  We would like to thank Bob Arnold,
Michelle Busch, Andy Hatcher, Kipp Hickman, Mark Horton, Daniel
Jensen, Bill Joy, Joe Kalash, Steve Maurer, Marty McNary, Jan Miller,
and Scott Nelson for their ideas and assistance, and also the teeming
multitudes who graciously ignored work, school, and social life to
play Rogue and send us bugs, complaints, suggestions and just plain
flames.  And also Mom.

@center<[End of original (though quite altered) document]>

@center(WINNING THE GAME)

You must get out of the Dungeons of Doom alive, with the Amulet of
Yendor, to win the game.  However, the Amulet is not something
carelessly cast aside by some unthinking monster.  It is guarded by
the fearsome Demon Lord Juiblex, whom you must attack to gain the
Amulet.  Only then may you find your way to the surface.

@center(BUGS)

The number of misfeatures, or outright bugs, in Rogue is still rather
large.  The authors would appreciate a mailed report of all bugs
encountered.  Messages should be sent to BUG-ROGUE@@ECLC@.USC@.EDU.  Please
note that many things you might think to be bugs are really features.
Of course, something like an illegal instruction interrupt or illegal
memory reads/@|writes are definitely bugs, as are infinite loops.  The
program also produces its own error messages; these are also
legitimate bugs.  The text of any of these messages, along with the
value of the PC (if given) and the last command typed, should be
included in the bug report.  Messages such as `Rogue blew up' don't
help.  All reports will be dealt with swiftly.

Now it is time for the local Rogue authors (Rogue Lords?) to make
their acknowledgements.  Thanks are due to Maurice Wuts, Bob
Schwartzkopf, and Mark Brown for their ideas and assistance, and of
course to all the above mentioned people without whom the game
undoubtedly wouldn't exist.
@begin(format)


 @+(*)ROGUE is a trademark of Bell Laboratories
 (even though it's not the same program)
@end(format)

