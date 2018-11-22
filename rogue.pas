(*$D-,C-,A-,M+   -*-PASCAL-*- *)
(* <RELPH.ROGUE>ROGUE.PAS.2290,  9-Jan-88 12:51:02, Edit by RELPH *)
(* **************************************************************************

                              ECL ROGUE

          A pseudo Dungeons and Dragons Game for the PDP-10.
                 Written by: Gary Craig and Jay Skeer
                        and: Oscar Erickson, John Relph.

      Thanks to: Bob Schwartzkopf, Maurice Wuts, and Mark Brown
                   May-December, 1982 --- Version 4


Edit History:  Many until now:

3:48am  Friday, 10 December 1982 -- JMR
     Make GIGI terminals work right.
     Change scrolls, potions, monsters, etc., to constants In
     the file ROGUE.CONSTANTS.
     Change mailing addresses for comments and Bug reports.

8:00pm  Saturday, 11 December 1982 -- GAC
     Removed 'the bolt shoots forward' and fixed up wand-attack echoing
     Made scrolls and potions unidentifiable when blind, can't read when
       blind either.

12:48am  Thursday, 16 December 1982  -- JMR
     Fixed ring of resurrection problem.

6:30pm Saturday, 19 December 1982 -- GAC
     Made inventory use the echo line if it can.  Slow inventory switch
     still needs to be put it (I will do it shortly).

8:30pm Sunday, 20 December 1982 -- GAC
     Put in slow inventory switch, updated doc file, help, and init-instr. file
     Put in slow inventory command, 'I'. Re-init-terminal is now ^I.
     Slow inventory is default on ttys with speed <= 300 baud (or unknown).

9:36pm  Monday, 20 December 1982 -- JMR
     Fixed slow inventory, inventory In slow mode, and fixed bug With
     umpleby & arrow traps, wasn't echoing 'which kills you..' message.

1:30pm Saturday, 8 January 1983 -- GAC
     Fixed the problem Oscar mentioned about Alchemy (wearing potions, etc.).
     Other random diddling (personal_scores, curing, wonder).

12:55am  Friday, 4 March 1983 -- JMR
     Make save File just play the game without being able To keep the score
     If the score File has been tampered With.

5:03pm  Saturday, 5 March 1983 -- JMR
     Fix purple worms To give you six turns inside Of them.  You can
     teleport out or hack your way out.

12:36am  Monday, 14 March 1983 -- JMR
     Add Trap_Identify Function To identify traps....duh

11:43pm  Monday, 14 March 1983 -- JMR
     Fix Nothing Appropriate complaint.

11:38am  Tuesday, 15 March 1983 -- JMR
     add staff of Searching

     Fix cancellation To save

2:54am  Friday, 25 March 1983 -- JMR
     No more ' ' To heal.   Changed To '.' by request.
     Also fix staff Of searching problem. and Generation
     Of monsters when no monsters can be on level.

6:02pm Saturday, April 2 1983 -- GAC
     Undid previous ' ' to '.' change.  Heal is now both, people
     who don't like ' ' can go to hell. Also adjusted monster levels
     to make middle harder in preparation for the Juiblex fix.

11:06pm Sunday, April 3 1983 -- OJE
     Put in Juiblex fix.  Instead of having to kill Juiblex to win the game
     we now place the amulet in a random location and then put Juiblex on
     top of it (asleep).  Also make it so that there are no trapdoors on
     level of the amulet.

3:26am  Friday, 15 April 1983 -- JMR
     Change staffy and trmchk routines To be keyword File,
     change term To be non-monitor specific enumerated Type.

4:29am  Friday, 15 April 1983 -- JMR
     Fix Phantom Stalker special attack...

7:07pm Saturday, 16 April 1983 -- GAC
     Added ^T (systat) command

1:56am  Wednesday, 20 April 1983 -- JMR
     Changed Bug-address To String variable;  changed Staffy To only
     be check Procedure, Procedure Init_Staffy sets it up and sets bug-address

8:22pm  Thursday, 21 April 1983 -- JMR
     Fixing Place_Next_to To Do something a little more reasonable

10:55pm  Saturday, 23 April 1983 -- JMR/OJE
     Fix parts To Read filenames from terminal,
     and Got TURN around corners and move diagonal working.
     Still a few weird things, though.
     OH YEAH:  CHANGE VERSION TO REFLECT EDIT LEVEL!!!!
     In future edits, that is...

11:15pm  Saturday, 23 April 1983 -- JMR
     Take out the SIBEs For redisplay reasons; now With fast run
     you aren't doing that much redisplay anyway.
     Also added Type_Version call For NEW Players.

1:10pm Sunday, 24 April 1983 -- GAC
     Fixed Name file handling, added WHOIS (^W) command.

2:42pm  Monday, 25 April 1983 -- JMR
     Added help For WHOIS, fixed problem With Init_Staffy.

1:46am  Tuesday, 26 April 1983 -- JMR/OJE
     Mimics and Intellect devourers...hahaha

3:27pm  Tuesday, 26 April 1983 --  OJE
     Make optimal turning.

12:08pm Saturday, 30 April 1983 -- GAC
     Made Whois do substrings.

8:49pm  Monday, 2 May 1983 -- JMR
     Cut down size Of save File and take out date checking.

9:20pm  Tuesday, 3 May 1983 -- JMR/OJE
     Fix turning bug.

Recently -- JMR
     Fix bug With creating mimics With no objs on level, and make
     killmoulies same as no monster.

12:06pm  Thursday, 5 May 1983 -- JMR
     Fix Can_Carry bugs, and add 'another' message when finding an object.
     Also, a couple of mimic fixes.

8:45pm  Friday, 6 May 1983 -- JMR
     Fix mimic bug, add hold portal scroll, add ring buffer Of echoes.

1:15am Saturday, 7 May 1983 -- GAC
     Made high intelligence make you 'know' a scroll, made 'unknown object
     type' an illusion object, in case that still happens...

1:51pm Sunday, 8 May 1983 -- J'
     FIX GET OBJ CODE ONCE AND FOR ALL.

1:09am  Sunday, 15 May 1983 -- JMR/OJE
     Fix Place_Next_To code.  Change monster/human hit messages.
     Many other random changes

2:17pm  Monday, 16 May 1983 -- JMR
     Fix complaint about ^T/^C bug from Rutgers.

11:31pm  Tuesday, 17 May 1983 -- JMR
     Try To fix Restore_game bug.  Don't know If it did anything.
     But I gave it a shot.  Also, make Identify more common.

12:37am  Wednesday, 1 June 1983 -- JMR
     Fix player.eaten stuff, Redisplay.  Make hurled objects go thru doors.
     Also Player.Blind Stuff.  Purple worm polymorph stuff.

1:05am  Wednesday, 1 June 1983 -- JMR
     Add Datamedia-2500 terminal handling stuff.

sometime -- JMR
     Fix Githyanki probability.

1:57am  Sunday, 5 June 1983 -- JMR
     Fix Towards/Away_From/Random_Move For monster stuff.

10:16pm  Sunday, 5 June 1983 -- JMR
     Fix Detect Gold/Magic/Monsters

3:41pm  Sunday, 12 June 1983 -- JMR
     Fix Remove_Ring stuff. Fix other Ring stuff.  Purple Worm FIx.

4:31pm 29-jun-83 -- JMR
     Fix save file problem.  HAHAHAHAHAHA! very funny.
     also fix problem with w_para...

7:19pm  Wednesday, 6 July 1983 -- JMR
#46  Add Infoton-400 terminal handling.

10:40am  Thursday, 14 July 1983 -- JMR
#47  add denial Of access by accounts.

1:00pm Saturday, 17 July 1983 -- GAC
#48  add Concept-108 terminal handling

10:32pm  Tuesday, 9 August 1983 -- JMR
#49  Fix bugs With DM2500 terminal handling, and bugs With
     restore_game failure.  Fix Inf400 stuff.  Fix Rings.  Fix arrow wielding.

12:11pm  Saturday, 19 November 1983 -- JMR
#50  add support For hazeltine-1500, version stuff

3:08pm Saturday, 21 January 1984 -- GAC
#51  Fix NIL pointer in Call_obj - got it when typing 'C','*','<esc>'.

12:10pm  Monday, 6 February 1984 -- JMR
#52  Fix problem With mimics, violet fungi, and purple worm death.

9:52pm  Thursday, 1 March 1984 -- JMR
#53  Fix 'f','F' move stuff, and change Set_Options

2:42am  Thursday, 22 March 1984 -- JMR
#54  Found bug In THROW.  It figgers.  also Put Get_Line routine In.

2:48pm  Tuesday, 27 March 1984 -- JMR
#55  Add Captain Fantastic''s Secret Decoder ring.  Fix some things.
     Change log File slightly, and ^T.  Fix some strange bugs.

1:11pm  Friday, 30 March 1984 -- JMR
#56  Fix bug In moving onto door diagonally from within dark room.
     Add HP terminal Type.

4:13pm  Tuesday, 3 April 1984 -- JMR
#57  Put In load checker, and startup version Text.
     Allow healing While sleeping.

5:52pm  Friday, 13 April 1984 -- JMR
#58  Fix a horrible bug that awoke a mimic but did Not change it
     To a 'M' If you were attacking With a bow, sling, or crossbow.
     Also fix bug In place_next_to (again).

1:59am  Sunday, 29 April 1984 -- JMR
#59  Fix bug In Zap_Wand that gave monsters a move after <ESC>.
     Also fix problems With NEW:PASCAL.  And confirm when load too high.

6:32pm  Thursday, 10 May 1984 -- JMR
#60  Change redisplay to include stats lines and echo line.  Some other
     optimization.  Fix purple worm stuff

8:45pm  Friday, 15 June 1984 -- JMR
#61  Put in padding For Con100 terminals.

7:14pm  Tuesday, 3 July 1984 -- JMR
#62  Fix bug With hitting escape from Slow_inventory.
     Parse the four File names from the CONFIGURATION FILE instead of from
     the terminal.

5:33pm  Wednesday, 29 August 1984 -- JMR
#63  Change random number generator.  Move terminal handling to Extern.
     Fix initialization stuff.  Change score File, Names File formats.
     Try to satisfy people who think there isn't enough food.
     Fix bugs With restore_game.

6:39pm  Tuesday, 4 September 1984 -- JMR
#64  Fix Monster stuff.  Bummer, have to make this version 4.

5:36pm  Wednesday, 31 October 1984 -- JMR
#1   Fix inventory to ask For letter of object when doing inventory.
     Fix bug With wand of blunder.

2:36pm  Saturday, 10 November 1984 -- JMR
#2   lowercase all names, add tombstone/switch.  Change TRMCHK.

11:28pm  Wednesday, 18 February 1987 -- JMR
#3   fix tombstonage
     fix abort from Put on ring

10:57pm  Tuesday, 31 March 1987
#4   Fix reaching level 13 problem.

#5   First attempt at fixing DISPOSE already clobbered object bug.
     It's in Lose_Old_World in the object dispose loop.  Don't know
     why it's so confused, but it has already disposed of one of the
     objects somewhere in the past...  Sometimes...

#6   try to make monsters move a little smahter.  fix erroneous monster moving
     routine which got lost If monsters died in middle of moving especially If
     person moving slow.
     Add trap finding routine to magic_mapping.
     HEY!  CHANGE THE FIRST TWO VERSION CONSTANTS FOR EVERY CHANGE!!!.

****************************************************************************)
Program Rogue;

Include 'Rogue.Constants';

Const
  Rogue_Update = 6;
  Rogue_Edit = 2290; (* ^D *)
  Rogue_Version = 4;

  Chance_Of_No_Room = 9; (* 1/Chance of a Cell Being Devoid of room *)
  Maze_Max_X = 3;
  Maze_Max_Y = 3;
  Max_Room = 9; (* Maze_Max_X * Maze_Max_Y *)
  Max_Room_X = 24;
  Max_Room_Y = 5;
  Max_Cell_X = 26;
  Max_Cell_Y = 7;
  X_Orig = 1;
  Y_Orig = 2;
  S_Max_X = 78;
  S_Max_Y = 22;
  X_Orig_1 = 0;
  Y_Orig_1 = 1;
  S_Max_X_1 = 79;
  S_Max_Y_1 = 23;
  Real_Y_Orig = 0;
  Real_X_Orig = 0;
  Real_Max_X = 79;
  Real_Max_Y = 25;
  Redisp_X_Orig = 1;
  Redisp_Y_Orig = 1;
  Redisp_Max_X = 78;
  Redisp_Max_Y = 24;
  Max_Doors = 4;
  Max_Chance = 1600; (* Sum of all the numbers in the chance field
		      of the treasure array. *)

  Max_Word = 160; (* #6 Number of "funny" scroll words *)
  Max_Item = 23; (* The maximum number Of objects player can carry *)
  Fainting_Meal = 2750; (* turns before fainting *)
  Weak_Meal = 2600; (* turns before feeling weak *)
  Hungry_Meal = 2000; (* turns before being hungry *)
  Not_Another = False; (* also, check everywhere this constant is *)
  Name_Len = 30; (* #54 just For const''s sake *)
  (* If this length is changed, many things in extern.mac will change too *)
  Space = ' ';
  Spaces = '                                                                                ';

Type
  Q_Reason = (Quit_R,Saved_R,Died_R,Winner_R); (* #55,#2 *)
  View_Array = Array[0..2] Of Char;

  Name_string = Packed Array[1..Name_Len] of char;
  Nam_ptr = ^Name_rec;
  Name_rec = Record
	       Nam : Name_string;
	       Num : Integer;
	       Next : Nam_ptr
	     End; (* #63 *)
  Long_string = Packed Array[1..80] of char;
  String5 = Packed Array[1..5] of char;
  String8 = Packed Array[1..8] of char;
  Loc_Type = Record
	       X,Y : Integer;
	     End;
  Obj_Class_Type = (Amulet_T,Food_T,Ring_T,Wand_T,Scroll_T,
		    Potion_T,Armor_T,Weapon_T,Gold_T,All_T);
  Action_Type = (Eat_A,Put_On_A,Zap_A,Read_A,Quaff_A,Wear_A,Wield_A,
		 Drop_A,Identify_A,Call_A,Throw_A);
  Status_type = (s_top,s_bottom);
  Mon_Ptr = ^ Monster_Typ;
  Trap_Ptr = ^ Trap_Typ;
  Obj_Ptr = ^ Obj_Typ;
  Monster_Typ = Record
		  Index : Integer;
		  HP : Integer;
		  Awake : Boolean;
		  Paralyzed_count : Integer;
		  Confused_count : Integer;
		  Loc : Loc_Type;
		  Next : Mon_Ptr;
		  Speed,Speed_count,Who_first : Integer;
		  Last_Dir : Char;
		End;
  Trap_Typ = Record
	       Loc : Loc_type;
	       Chance : Integer;
	       Kind : Integer;
	       Next : Trap_Ptr;
	     End;
  Obj_Typ = Record
	      Obj_Typ : Obj_Class_Type;
	      Loc : Loc_Type;
	      Quan : Integer;
	      Index : Integer;
	      Plus_Hit : Integer;
	      Plus_Dam : Integer;
	      Know_magic : Boolean;
	      Cursed : Boolean;
	      Next : Obj_Ptr;
	    End;
  Treasures = Record
		Chance : Integer;
		Index : Integer;
		Typ : Obj_Class_Type;
	      End;
  Monsters = Record
	       Long_Name : Name_String;
	       Len : Integer;
	       Ac,Th0,Hit_Dice : Integer;
	       Dam,Num : Integer;
	       Min_Level,Max_Level : Integer;
	       Special : 1..3; (* 1's bit = normal, 2's = special *)
	       Sleep : Integer;
	       Large : Boolean;
	       Name : Char;
	       Xpval : Integer;
	     End;
  Potions = Record
	      Desc : Name_string;
	      D_leng : Integer;
	      Name : Name_string;
	      N_leng : Integer;
	      Id : Boolean;
	      Called : Boolean;
	    End;
  Scrolls = Record
	      Desc : Name_string;
	      D_leng : Integer;
	      Name : Name_string;
	      N_leng : Integer;
	      Id   : Boolean;
	      Called : Boolean;
	      Can_ID : Boolean;
	    End;
  Wands = Record
	    Desc : Name_string;
	    D_leng : Integer;
	    Name : Name_string;
	    N_leng : Integer;
	    Is_wand : Boolean;
	    Id : Boolean;
	    Called : Boolean;
	    Dam : Integer;
	    Num : Integer;
	  End;
  Rings = Record
	    Desc : Name_string;
	    D_leng : Integer;
	    Name : Name_string;
	    N_leng : Integer;
	    Id : Boolean;
	    Called : Boolean;
	  End;
  Armors = Record
	     Name : Name_string;
	     N_leng : Integer;
	     Ac : Integer;
	   End;
  Weapons = Record
	      Name : Name_string;
	      N_leng : Integer;
	      L_Num : Integer;
	      L_Dam : Integer;
	      S_Num : Integer;
	      S_Dam : Integer;
	    End;
  Descriptions = Record
		   Name : Alfa;
		   Leng : Integer
		 End;
  Hand_Type = (Left_H,Right_H); (* #49 *)
  Player_Record = Record
		    Obj_List,
		    Cur_Wep,
		    Cur_Arm : Obj_Ptr;
		    Cur_Ring : Array[Hand_Type] Of Obj_Ptr; (* #49 *)
		    Gold,
		    XP,
		    Level,
		    HP : Integer;
		    Name : Name_string;
		    Max_HP,
		    ST,
		    Max_ST,
		    DX,
		    Max_DX,
		    IQ,
		    Max_IQ,
		    AC,
		    Died_Count,
		    SeeMon_Count,
		    Faint_count,
		    Confused_count,
		    Blind_count,
		    Paralyzed_count,
		    Sleep_count,
		    Trapped_count,
		    Fixed_count,
		    Invis_count,
		    Last_meal,
		    Heal_count,
		    Eaten_Count,
		    Eaten_Loss : Integer;
		    Blind,
		    Stuck,
		    Will_confuse,
		    Has_amulet : Boolean;
		    Speed,
		    Speed_count : Integer;
		    Prev,
		    Loc : Loc_Type;
		  End;
  Score_rec = Record
		User : Integer;
		Score : Integer;
		Day : String5;
		Killer : Char;
		Level : Integer
	      End;
  Score_array = array[1..10] of score_rec;
  Personal_rec = Record
		   Score : Integer;
		   Rest  : Long_string;
		 End;
  Personals = Array[1..10] of Personal_rec;
  Door_Type = Record
		abs_loc : loc_type;
		Secret  : Integer;
	      End;
  Room_Type = Record
		Max_X,Max_Y : Integer;
		Abs_X,Abs_Y : Integer;
		Light : Boolean;
		Existant : Boolean;
		Seen : Boolean;
		Doors : Array [1..Max_Doors] Of Door_Type;
	      End;
  Screen_Array = Array [X_Orig_1..S_Max_X_1,Y_Orig_1..S_Max_Y_1] of Char;
  Real_Screen = Array[Real_Y_Orig..Real_Max_Y,Real_X_Orig..Real_Max_X] of Char;
  Bool_Array = Array [X_Orig_1..S_Max_X_1,Y_Orig_1..S_Max_Y_1] of Boolean;
  World_Rec = Record
		Monsters : Mon_Ptr;
		Objs : Obj_Ptr;
		Traps : Trap_Ptr;
		Level : Integer;
		Num_mons, max_mons : integer;
		Rooms : Array [1..Max_Room] of Room_Type;
		S_World,
		Mon,
		Obj : Screen_Array;
		This_Screen,
		Screen : Real_Screen;
		Room_array : Array[X_orig_1..S_max_x_1,Y_orig_1..S_max_y_1] of integer;
		Seeable,
		Seen : Bool_Array;
		Lines : Array [Real_Y_Orig..Real_Max_Y] of Boolean;
	      End;
  Maze_Cell  = Packed Record
			U,Up,Dn,Rt,Lt : Boolean;
		      End;
  Maze_Array = Packed Array [0..4,0..4] of Maze_Cell;
  Switch_record = Record (* must be declared this way: don''t change! *)
		    Ask_swi : Boolean;
		    Flush_swi : Boolean;
		    Jump_swi : Boolean;
		    Slow_swi : Boolean;
		    Terse_swi : Boolean;
		    Turn_swi : Boolean;
		    Tomb_swi : Boolean (* #2 *)
		  End;
  FName_Rec = Record (* #62 *)
		Log : ^Long_String;
		Message : ^Long_String;
		Names : ^Long_String;
		Score : ^Long_String
	      End;
  Fudge_Type = Packed Record Case Boolean Of
		 True : (Int : Integer);
		 False: (Boo : Packed Array[0..35] Of Boolean)
	       End;

Var
  Rnd_J, Rnd_K : Integer; (* #63 *)
  Rnds : Array[1..55] of Real; (* #63 *)
  Files : FName_Rec; (* #62 *)
  Old_World : View_Array;
  World : World_Rec;
  Player : Player_Record;
  Fruit_name,Save_file,R_File_Name : Name_string;
  False_array : Bool_array;
  F : Text;
  Nm : File of Name_rec;

  S, Nulls, Bug_add : Long_string; (* #57 *)

  Last_echo : Packed Array[0..4] Of Long_String;

  Amulet_level, Seed, Blank_message, Scare_count,
  Echo_index, Echo_point, Echo_Pos_X : Integer; (* #50 *)

  Ctrl_L,Killer,Player_Move,Last_Item : Char;

  Wait_chars,OkDirs,Okmons,Resp_chars : Set Of Char; (* #55 *)

  Delta_Dir : Array[-1..1,-1..1] of Char; (* #6 *)

  Virgin, Setup, Empty_Echo, Want_scores, F_temp, Fast,
  Dont_Turn, Valid_Command, Do_Done, Moved, Has_Turned, Dead,
  Quit_game, Saved, Not_Staffer : Boolean;

  Reason : Q_Reason;

  Change_stats : Set Of Status_type;
  Orig_X,Orig_Y : Array [1..Max_Room] of Integer;
  O_Used_list,M_Used_list : Array[1..Max_room] Of Boolean;
  Ct : Maze_Array;
  Switches : Switch_record;

  Color : Array[1..Max_potion] Of Descriptions;
  Stone : Array[1..Max_ring] Of Descriptions;
  Wood : Array[1..Max_wand] Of Descriptions;
  Metal : Array[1..Max_wand] Of Descriptions;
  Word : Array[1..Max_word] Of Descriptions;
  Wand : Array [1..Max_wand] Of Wands;
  Ring : Array [1..Max_ring] Of Rings;
  Scroll : Array [1..Max_scroll] Of Scrolls;
  Armor : Array [1..Max_armor] Of Armors;
  Weapon : Array [1..Max_weapon] Of Weapons;
  Potion : Array [1..Max_potion] Of Potions;
  Treasure : Array [1..Max_treasure] Of Treasures;
  Monster : Array [1..Max_monster] Of Monsters;

Initprocedure;
Begin
    Old_World[0] := '&'; (* This is an empty *)
    Old_World[1] := '&';
    Old_World[2] := '&';

    Delta_Dir[-1,-1] := '7'; (* #6 *)
    Delta_Dir[-1,0] := '4';
    Delta_Dir[-1,1] := '1';
    Delta_Dir[0,-1] := '8';
    Delta_Dir[0,0] := '5';
    Delta_Dir[0,1] := '2';
    Delta_Dir[1,-1] := '9';
    Delta_Dir[1,0] := '6';
    Delta_Dir[1,1] := '3';

    Virgin := True;
    Setup := True;
End;

Initprocedure;
Begin

    Monster[m_ant].Long_Name := 'giant ant                     ';
    Monster[m_ant].Name := 'A';
    Monster[m_ant].Len := 9;
    Monster[m_ant].Hit_Dice := 2;
    Monster[m_ant].Ac := 3;
    Monster[m_ant].Th0 := 16;
    Monster[m_ant].Dam := 6;
    Monster[m_ant].Num := 1;
    Monster[m_ant].Special := 3;
    Monster[m_ant].Min_Level := 3;
    Monster[m_ant].Max_Level := 9;
    Monster[m_ant].Sleep := 15;
    Monster[m_ant].Large := false;
    Monster[m_ant].XPVal := 11;

    Monster[m_bat].Long_Name := 'bat                           ';
    Monster[m_bat].Name := 'B';
    Monster[m_bat].Len := 3;
    Monster[m_bat].Hit_Dice := 1;
    Monster[m_bat].Ac := 7;
    Monster[m_bat].Th0 := 20;
    Monster[m_bat].Dam := 3;
    Monster[m_bat].Num := 1;
    Monster[m_bat].Special := 1;
    Monster[m_bat].Min_Level := 1;
    Monster[m_bat].Max_Level := 5;
    Monster[m_bat].Sleep := 25;
    Monster[m_bat].Large := false;
    Monster[m_bat].XPVal := 1;

    Monster[m_centaur].Long_Name := 'centaur                       ';
    Monster[m_centaur].Name := 'C';
    Monster[m_centaur].Len := 7;
    Monster[m_centaur].Hit_Dice := 4;
    Monster[m_centaur].Ac := 5;
    Monster[m_centaur].Th0 := 15;
    Monster[m_centaur].Dam := 6;
    Monster[m_centaur].Num := 2;
    Monster[m_centaur].Special := 1;
    Monster[m_centaur].Min_Level := 7;
    Monster[m_centaur].Max_Level := 15;
    Monster[m_centaur].Sleep := 10;
    Monster[m_centaur].Large := true;
    Monster[m_centaur].XPVal := 15;

    Monster[m_dragon].Long_Name := 'dragon                        ';
    Monster[m_dragon].Name := 'D';
    Monster[m_dragon].Len := 6;
    Monster[m_dragon].Hit_Dice := 11;
    Monster[m_dragon].Ac := -2;
    Monster[m_dragon].Th0 := 9;
    Monster[m_dragon].Dam := 12;
    Monster[m_dragon].Num := 4;
    Monster[m_dragon].Special := 1;
    Monster[m_dragon].Min_Level := 21;
    Monster[m_dragon].Max_Level := maxint;
    Monster[m_dragon].Sleep := 30;
    Monster[m_dragon].Large := true;
    Monster[m_dragon].XPVal := 250;

    Monster[m_eye].Long_Name := 'floating eye                  ';
    Monster[m_eye].Name := 'E';
    Monster[m_eye].Len := 12;
    Monster[m_eye].Hit_Dice := 1;
    Monster[m_eye].Ac := 9;
    Monster[m_eye].Th0 := 20;
    Monster[m_eye].Dam := 200;
    Monster[m_eye].Num := 0;
    Monster[m_eye].Special := 2;
    Monster[m_eye].Min_Level := 3;
    Monster[m_eye].Max_Level := 7;
    Monster[m_eye].Sleep := 100;
    Monster[m_eye].Large := false;
    Monster[m_eye].XPVal := 8;

    Monster[m_fungi].Long_Name := 'violet fungi                  ';
    Monster[m_fungi].Name := 'F';
    Monster[m_fungi].Len := 12;
    Monster[m_fungi].Hit_Dice := 6;
    Monster[m_fungi].Ac := 7;
    Monster[m_fungi].Th0 := 16;
    Monster[m_fungi].Dam := 8;
    Monster[m_fungi].Num := 1;
    Monster[m_fungi].Special := 3;
    Monster[m_fungi].Min_Level := 16;
    Monster[m_fungi].Max_Level := 22;
    Monster[m_fungi].Sleep := 100;
    Monster[m_fungi].Large := false;
    Monster[m_fungi].XPVal := 15;

    Monster[m_gnoll].Long_Name := 'gnoll                         ';
    Monster[m_gnoll].Name := 'G';
    Monster[m_gnoll].Len := 5;
    Monster[m_gnoll].Hit_Dice := 2;
    Monster[m_gnoll].Ac := 5;
    Monster[m_gnoll].Th0 := 16;
    Monster[m_gnoll].Dam := 4;
    Monster[m_gnoll].Num := 2;
    Monster[m_gnoll].Special := 1;
    Monster[m_gnoll].Min_Level := 4;
    Monster[m_gnoll].Max_Level := 12;
    Monster[m_gnoll].Sleep := 15;
    Monster[m_gnoll].Large := true;
    Monster[m_gnoll].XPVal := 5;

    Monster[m_hob].Long_Name := 'hobgoblin                     ';
    Monster[m_hob].Name := 'H';
    Monster[m_hob].Len := 9;
    Monster[m_hob].Hit_Dice := 1;
    Monster[m_hob].Ac := 5;
    Monster[m_hob].Th0 := 18;
    Monster[m_hob].Dam := 8;
    Monster[m_hob].Num := 1;
    Monster[m_hob].Special := 1;
    Monster[m_hob].Min_Level := 1;
    Monster[m_hob].Max_Level := 7;
    Monster[m_hob].Sleep := 15;
    Monster[m_hob].Large := false;
    Monster[m_hob].XPVal := 3;

    Monster[m_invis].Long_Name := 'invisible stalker             ';
    Monster[m_invis].Name := 'I';
    Monster[m_invis].Len := 17;
    Monster[m_invis].Hit_Dice := 8;
    Monster[m_invis].Ac := 3;
    Monster[m_invis].Th0 := 12;
    Monster[m_invis].Dam := 4;
    Monster[m_invis].Num := 4;
    Monster[m_invis].Special := 1;
    Monster[m_invis].Min_Level := 15;
    Monster[m_invis].Max_Level := 20;
    Monster[m_invis].Sleep := 0;
    Monster[m_invis].Large := true;
    Monster[m_invis].XPVal := 45;

    Monster[m_jackal].Long_Name := 'jackal                        ';
    Monster[m_jackal].Name := 'J';
    Monster[m_jackal].Len := 6;
    Monster[m_jackal].Hit_Dice := 1;
    Monster[m_jackal].Ac := 7;
    Monster[m_jackal].Th0 := 20;
    Monster[m_jackal].Dam := 2;
    Monster[m_jackal].Num := 1;
    Monster[m_jackal].Special := 1;
    Monster[m_jackal].Min_Level := 1;
    Monster[m_jackal].Max_Level := 5;
    Monster[m_jackal].Sleep := 15;
    Monster[m_jackal].Large := false;
    Monster[m_jackal].XPVal := 1;

    Monster[m_kobold].Long_Name := 'kobold                        ';
    Monster[m_kobold].Name := 'K';
    Monster[m_kobold].Len := 6;
    Monster[m_kobold].Hit_Dice := 1;
    Monster[m_kobold].Ac := 7;
    Monster[m_kobold].Th0 := 20;
    Monster[m_kobold].Dam := 4;
    Monster[m_kobold].Num := 1;
    Monster[m_kobold].Special := 1;
    Monster[m_kobold].Min_Level := 1;
    Monster[m_kobold].Max_Level := 6;
    Monster[m_kobold].Sleep := 15;
    Monster[m_kobold].Large := false;
    Monster[m_kobold].XPVal := 2;

    Monster[m_lep].Long_Name := 'leprechaun                    ';
    Monster[m_lep].Name := 'L';
    Monster[m_lep].Len := 10;
    Monster[m_lep].Hit_Dice := 2;
    Monster[m_lep].Ac := 8;
    Monster[m_lep].Th0 := 200;
    Monster[m_lep].Dam := 200;
    Monster[m_lep].Num := 0;
    Monster[m_lep].Special := 2;
    Monster[m_lep].Min_Level := 7;
    Monster[m_lep].Max_Level := 16;
    Monster[m_lep].Sleep := 100;
    Monster[m_lep].Large := false;
    Monster[m_lep].XPVal := 12;

    Monster[m_mimic].Long_Name := 'mimic                         ';
    Monster[m_mimic].Name := 'M';
    Monster[m_mimic].Len := 5;
    Monster[m_mimic].Hit_Dice := 9;
    Monster[m_mimic].Ac := 7;
    Monster[m_mimic].Th0 := 12;
    Monster[m_mimic].Dam := 4;
    Monster[m_mimic].Num := 3;
    Monster[m_mimic].Special := 3;
    Monster[m_mimic].Min_Level := 12;
    Monster[m_mimic].Max_Level := maxint;
    Monster[m_mimic].Sleep := 100;
    Monster[m_mimic].Large := True;
    Monster[m_mimic].XPVal := 35;

    Monster[m_nymph].Long_Name := 'nymph                         ';
    Monster[m_nymph].Name := 'N';
    Monster[m_nymph].Len := 5;
    Monster[m_nymph].Hit_Dice := 3;
    Monster[m_nymph].Ac := 9;
    Monster[m_nymph].Th0 := 200;
    Monster[m_nymph].Dam := 200;
    Monster[m_nymph].Num := 0;
    Monster[m_nymph].Special := 2;
    Monster[m_nymph].Min_Level := 10;
    Monster[m_nymph].Max_Level := 15;
    Monster[m_nymph].Sleep := 100;
    Monster[m_nymph].Large := false;
    Monster[m_nymph].XPVal := 10;

    Monster[m_orc].Long_Name := 'orc                           ';
    Monster[m_orc].Name := 'O';
    Monster[m_orc].Len := 3;
    Monster[m_orc].Hit_Dice := 1;
    Monster[m_orc].Ac := 6;
    Monster[m_orc].Th0 := 19;
    Monster[m_orc].Dam := 6;
    Monster[m_orc].Num := 1;
    Monster[m_orc].Special := 1;
    Monster[m_orc].Min_Level := 2;
    Monster[m_orc].Max_Level := 10;
    Monster[m_orc].Sleep := 15;
    Monster[m_orc].Large := false;
    Monster[m_orc].XPVal := 5;

    Monster[m_purple].Long_Name := 'purple worm                   ';
    Monster[m_purple].Name := 'P';
    Monster[m_purple].Len := 11;
    Monster[m_purple].Hit_Dice := 15;
    Monster[m_purple].Ac := 6;
    Monster[m_purple].Th0 := 8;
    Monster[m_purple].Dam := 12;
    Monster[m_purple].Num := 2;
    Monster[m_purple].Special := 3;
    Monster[m_purple].Min_Level := 22;
    Monster[m_purple].Max_Level := maxint;
    Monster[m_purple].Sleep := 15;
    Monster[m_purple].Large := true;
    Monster[m_purple].XPVal := 200;

    Monster[m_quasit].Long_Name := 'quasit                        ';
    Monster[m_quasit].Name := 'Q';
    Monster[m_quasit].Len := 6;
    Monster[m_quasit].Hit_Dice := 3;
    Monster[m_quasit].Ac := 2;
    Monster[m_quasit].Th0 := 16;
    Monster[m_quasit].Dam := 4;
    Monster[m_quasit].Num := 2;
    Monster[m_quasit].Special := 1;
    Monster[m_quasit].Min_Level := 9;
    Monster[m_quasit].Max_Level := 15;
    Monster[m_quasit].Sleep := 10;
    Monster[m_quasit].Large := false;
    Monster[m_quasit].XPVal := 15;

    Monster[m_rust].Long_Name := 'rust monster                  ';
    Monster[m_rust].Name := 'R';
    Monster[m_rust].Len := 12;
    Monster[m_rust].Hit_Dice := 5;
    Monster[m_rust].Ac := 2;
    Monster[m_rust].Th0 := 15;
    Monster[m_rust].Dam := 200;
    Monster[m_rust].Num := 0;
    Monster[m_rust].Special := 2;
    Monster[m_rust].Min_Level := 9;
    Monster[m_rust].Max_Level := 16;
    Monster[m_rust].Sleep := 0;
    Monster[m_rust].Large := false;
    Monster[m_rust].XPVal := 25;

    Monster[m_snake].Long_Name := 'snake                         ';
    Monster[m_snake].Name := 'S';
    Monster[m_snake].Len := 5;
    Monster[m_snake].Hit_Dice := 2;
    Monster[m_snake].Ac := 5;
    Monster[m_snake].Th0 := 17;
    Monster[m_snake].Dam := 3;
    Monster[m_snake].Num := 1;
    Monster[m_snake].Special := 1;
    Monster[m_snake].Min_Level := 1;
    Monster[m_snake].Max_Level := 6;
    Monster[m_snake].Sleep := 30;
    Monster[m_snake].Large := true;
    Monster[m_snake].XPVal := 2;

    Monster[m_troll].Long_Name := 'troll                         ';
    Monster[m_troll].Name := 'T';
    Monster[m_troll].Len := 5;
    Monster[m_troll].Hit_Dice := 7;
    Monster[m_troll].Ac := 4;
    Monster[m_troll].Th0 := 13;
    Monster[m_troll].Dam := 4;
    Monster[m_troll].Num := 7;
    Monster[m_troll].Special := 1;
    Monster[m_troll].Min_Level := 14;
    Monster[m_troll].Max_Level := 18;
    Monster[m_troll].Sleep := 10;
    Monster[m_troll].Large := true;
    Monster[m_troll].XPVal := 50;

    Monster[m_umber].Long_Name := 'umber hulk                    ';
    Monster[m_umber].Name := 'U';
    Monster[m_umber].Len := 10;
    Monster[m_umber].Hit_Dice := 9;
    Monster[m_umber].Ac := 2;
    Monster[m_umber].Th0 := 12;
    Monster[m_umber].Dam := 4;
    Monster[m_umber].Num := 8;
    Monster[m_umber].Special := 3;
    Monster[m_umber].Min_Level := 18;
    Monster[m_umber].Max_Level := 22;
    Monster[m_umber].Sleep := 10;
    Monster[m_umber].Large := true;
    Monster[m_umber].XPVal := 85;

    Monster[m_vampire].Long_Name := 'vampire                       ';
    Monster[m_vampire].Name := 'V';
    Monster[m_vampire].Len := 7;
    Monster[m_vampire].Hit_Dice := 8;
    Monster[m_vampire].Ac := 1;
    Monster[m_vampire].Th0 := 12;
    Monster[m_vampire].Dam := 2;
    Monster[m_vampire].Num := 5;
    Monster[m_vampire].Special := 3;
    Monster[m_vampire].Min_Level := 19;
    Monster[m_vampire].Max_Level := 24;
    Monster[m_vampire].Sleep := 40;
    Monster[m_vampire].Large := false;
    Monster[m_vampire].XPVal := 90;

    Monster[m_wraith].Long_Name := 'wraith                        ';
    Monster[m_wraith].Name := 'W';
    Monster[m_wraith].Len := 6;
    Monster[m_wraith].Hit_Dice := 5;
    Monster[m_wraith].Ac := 4;
    Monster[m_wraith].Th0 := 15;
    Monster[m_wraith].Dam := 6;
    Monster[m_wraith].Num := 1;
    Monster[m_wraith].Special := 3;
    Monster[m_wraith].Min_Level := 13;
    Monster[m_wraith].Max_Level := 17;
    Monster[m_wraith].Sleep := 30;
    Monster[m_wraith].Large := false;
    Monster[m_wraith].XPVal := 55;

    Monster[m_xorn].Long_Name := 'xorn                          ';
    Monster[m_xorn].Name := 'X';
    Monster[m_xorn].Len := 4;
    Monster[m_xorn].Hit_Dice := 8;
    Monster[m_xorn].Ac := -2;
    Monster[m_xorn].Th0 := 12;
    Monster[m_xorn].Dam := 8;
    Monster[m_xorn].Num := 4;
    Monster[m_xorn].Special := 1;
    Monster[m_xorn].Min_Level := 17;
    Monster[m_xorn].Max_Level := 23;
    Monster[m_xorn].Sleep := 10;
    Monster[m_xorn].Large := false;
    Monster[m_xorn].XPVal := 75;

    Monster[m_yeti].Long_Name := 'yeti                          ';
    Monster[m_yeti].Name := 'Y';
    Monster[m_yeti].Len := 4;
    Monster[m_yeti].Hit_Dice := 4;
    Monster[m_yeti].Ac := 6;
    Monster[m_yeti].Th0 := 15;
    Monster[m_yeti].Dam := 6;
    Monster[m_yeti].Num := 2;
    Monster[m_yeti].Special := 1;
    Monster[m_yeti].Min_Level := 11;
    Monster[m_yeti].Max_Level := 16;
    Monster[m_yeti].Sleep := 25;
    Monster[m_yeti].Large := true;
    Monster[m_yeti].XPVal := 30;

    Monster[m_zombie].Long_Name := 'zombie                        ';
    Monster[m_zombie].Name := 'Z';
    Monster[m_zombie].Len := 6;
    Monster[m_zombie].Hit_Dice := 2;
    Monster[m_zombie].Ac := 8;
    Monster[m_zombie].Th0 := 16;
    Monster[m_zombie].Dam := 8;
    Monster[m_zombie].Num := 1;
    Monster[m_zombie].Special := 1;
    Monster[m_zombie].Min_Level := 4;
    Monster[m_zombie].Max_Level := 9;
    Monster[m_zombie].Sleep := 0;
    Monster[m_zombie].Large := false;
    Monster[m_zombie].XPVal := 8;

    Monster[m_almiraj].Long_Name := 'al-mi''raj                     ';
    Monster[m_almiraj].Name := 'a';
    Monster[m_almiraj].Len := 9;
    Monster[m_almiraj].Hit_Dice := 1;
    Monster[m_almiraj].Ac := 6;
    Monster[m_almiraj].Th0 := 15;
    Monster[m_almiraj].Dam := 4;
    Monster[m_almiraj].Num := 1;
    Monster[m_almiraj].Special := 1;
    Monster[m_almiraj].Min_Level := 1;
    Monster[m_almiraj].Max_Level := 4;
    Monster[m_almiraj].Sleep := 0;
    Monster[m_almiraj].Large := false;
    Monster[m_almiraj].XPVal := 1;

    Monster[m_blind].Long_Name := 'blindheim                     ';
    Monster[m_blind].Name := 'b';
    Monster[m_blind].Len := 9;
    Monster[m_blind].Hit_Dice := 4;
    Monster[m_blind].Ac := 3;
    Monster[m_blind].Th0 := 15;
    Monster[m_blind].Dam := 8;
    Monster[m_blind].Num := 1;
    Monster[m_blind].Special := 3;
    Monster[m_blind].Min_Level := 5;
    Monster[m_blind].Max_Level := 12;
    Monster[m_blind].Sleep := 85;
    Monster[m_blind].Large := false;
    Monster[m_blind].XPVal := 20;

    Monster[m_crypt].Long_Name := 'crypt thing                   ';
    Monster[m_crypt].Name := 'c';
    Monster[m_crypt].Len := 11;
    Monster[m_crypt].Hit_Dice := 8;
    Monster[m_crypt].Ac := 3;
    Monster[m_crypt].Th0 := 13;
    Monster[m_crypt].Dam := 8;
    Monster[m_crypt].Num := 1;
    Monster[m_crypt].Special := 3;
    Monster[m_crypt].Min_Level := 8;
    Monster[m_crypt].Max_Level := 10;
    Monster[m_crypt].Sleep := 100;
    Monster[m_crypt].Large := false;
    Monster[m_crypt].XPVal := 25;

    Monster[m_death].Long_Name := 'death knight                  ';
    Monster[m_death].Name := 'd';
    Monster[m_death].Len := 12;
    Monster[m_death].Hit_Dice := 11;
    Monster[m_death].Ac := 0;
    Monster[m_death].Th0 := 13;
    Monster[m_death].Dam := 20;
    Monster[m_death].Num := 1;
    Monster[m_death].Special := 1;
    Monster[m_death].Min_Level := 20;
    Monster[m_death].Max_Level := 20;
    Monster[m_death].Sleep := 10;
    Monster[m_death].Large := false;
    Monster[m_death].XPVal := 90;

    Monster[m_ettin].Long_Name := 'ettin                         ';
    Monster[m_ettin].Name := 'e';
    Monster[m_ettin].Len := 5;
    Monster[m_ettin].Hit_Dice := 10;
    Monster[m_ettin].Ac := 3;
    Monster[m_ettin].Th0 := 16;
    Monster[m_ettin].Dam := 16;
    Monster[m_ettin].Num := 2;
    Monster[m_ettin].Special := 1;
    Monster[m_ettin].Min_Level := 19;
    Monster[m_ettin].Max_Level := 24;
    Monster[m_ettin].Sleep := 5;
    Monster[m_ettin].Large := True;
    Monster[m_ettin].XPVal := 75;

    Monster[m_flind].Long_Name := 'flind                         ';
    Monster[m_flind].Name := 'f';
    Monster[m_flind].Len := 5;
    Monster[m_flind].Hit_Dice := 2;
    Monster[m_flind].Ac := 5;
    Monster[m_flind].Th0 := 16;
    Monster[m_flind].Dam := 6;
    Monster[m_flind].Num := 1;
    Monster[m_flind].Special := 1;
    Monster[m_flind].Min_Level := 3;
    Monster[m_flind].Max_Level := 8;
    Monster[m_flind].Sleep := 0;
    Monster[m_flind].Large := False;
    Monster[m_flind].XPVal := 9;

    Monster[m_gith].Long_Name := 'githyanki                     ';
    Monster[m_gith].Name := 'g';
    Monster[m_gith].Len := 9;
    Monster[m_gith].Hit_Dice := 9;
    Monster[m_gith].Ac := 2;
    Monster[m_gith].Th0 := 13;
    Monster[m_gith].Dam := 12;
    Monster[m_gith].Num := 1;
    Monster[m_gith].Special := 1;
    Monster[m_gith].Min_Level := 14;
    Monster[m_gith].Max_Level := 16;
    Monster[m_gith].Sleep := 20;
    Monster[m_gith].Large := False;
    Monster[m_gith].XPVal := 60;

    Monster[m_homon].Long_Name := 'homonculous                   ';
    Monster[m_homon].Name := 'h';
    Monster[m_homon].Len := 11;
    Monster[m_homon].Hit_Dice := 2;
    Monster[m_homon].Ac := 6;
    Monster[m_homon].Th0 := 18;
    Monster[m_homon].Dam := 3;
    Monster[m_homon].Num := 1;
    Monster[m_homon].Special := 3;
    Monster[m_homon].Min_Level := 4;
    Monster[m_homon].Max_Level := 7;
    Monster[m_homon].Sleep := 0;
    Monster[m_homon].Large := False;
    Monster[m_homon].XPVal := 10;

    Monster[m_int].Long_Name := 'intellect devourer            ';
    Monster[m_int].Name := 'i';
    Monster[m_int].Len := 18;
    Monster[m_int].Hit_Dice := 7;
    Monster[m_int].Ac := 4;
    Monster[m_int].Th0 := 13;
    Monster[m_int].Dam := 4;
    Monster[m_int].Num := 4;
    Monster[m_int].Special := 3;
    Monster[m_int].Min_Level := 17;
    Monster[m_int].Max_Level := 22;
    Monster[m_int].Sleep := 10;
    Monster[m_int].Large := False;
    Monster[m_int].XPVal := 65;

    Monster[m_juiblex].Long_Name := 'Juiblex                       ';
    Monster[m_juiblex].Name := 'j';
    Monster[m_juiblex].Len := 7;
    Monster[m_juiblex].Hit_Dice := 15;
    Monster[m_juiblex].Ac := -7;
    Monster[m_juiblex].Th0 := 8;
    Monster[m_juiblex].Dam := 10;
    Monster[m_juiblex].Num := 4;
    Monster[m_juiblex].Special := 1;
    Monster[m_juiblex].Min_Level := 0;
    Monster[m_juiblex].Max_Level := 0;
    Monster[m_juiblex].Sleep := 1;
    Monster[m_juiblex].Large := True;
    Monster[m_juiblex].XPVal := 500;

    Monster[m_kill].Long_Name := 'killmoulis                    ';
    Monster[m_kill].Name := 'k';
    Monster[m_kill].Len := 10;
    Monster[m_kill].Hit_Dice := 1;
    Monster[m_kill].Ac := 6;
    Monster[m_kill].Th0 := 15;
    Monster[m_kill].Dam := 2;
    Monster[m_kill].Num := 1;
    Monster[m_kill].Special := 1;
    Monster[m_kill].Min_Level := 1;
    Monster[m_kill].Max_Level := maxint;
    Monster[m_kill].Sleep := 0;
    Monster[m_kill].Large := False;
    Monster[m_kill].XPVal := 1;

    Monster[m_larva].Long_Name := 'larva                         ';
    Monster[m_larva].Name := 'l';
    Monster[m_larva].Len := 5;
    Monster[m_larva].Hit_Dice := 1;
    Monster[m_larva].Ac := 7;
    Monster[m_larva].Th0 := 17;
    Monster[m_larva].Dam := 5;
    Monster[m_larva].Num := 1;
    Monster[m_larva].Special := 1;
    Monster[m_larva].Min_Level := 3;
    Monster[m_larva].Max_Level := 7;
    Monster[m_larva].Sleep := 0;
    Monster[m_larva].Large := False;
    Monster[m_larva].XPVal := 1;

    Monster[m_minotaur].Long_Name := 'minotaur                      ';
    Monster[m_minotaur].Name := 'm';
    Monster[m_minotaur].Len := 8;
    Monster[m_minotaur].Hit_Dice := 7;
    Monster[m_minotaur].Ac := 6;
    Monster[m_minotaur].Th0 := 13;
    Monster[m_minotaur].Dam := 4;
    Monster[m_minotaur].Num := 3;
    Monster[m_minotaur].Special := 1;
    Monster[m_minotaur].Min_Level := 11;
    Monster[m_minotaur].Max_Level := 14;
    Monster[m_minotaur].Sleep := 20;
    Monster[m_minotaur].Large := True;
    Monster[m_minotaur].XPVal := 25;

    Monster[m_norker].Long_Name := 'norker                        ';
    Monster[m_norker].Name := 'n';
    Monster[m_norker].Len := 6;
    Monster[m_norker].Hit_Dice := 2;
    Monster[m_norker].Ac := 5;
    Monster[m_norker].Th0 := 19;
    Monster[m_norker].Dam := 5;
    Monster[m_norker].Num := 2;
    Monster[m_norker].Special := 1;
    Monster[m_norker].Min_Level := 4;
    Monster[m_norker].Max_Level := 9;
    Monster[m_norker].Sleep := 50;
    Monster[m_norker].Large := False;
    Monster[m_norker].XPVal := 6;

    Monster[m_owlbear].Long_Name := 'owlbear                       ';
    Monster[m_owlbear].Name := 'o';
    Monster[m_owlbear].Len := 7;
    Monster[m_owlbear].Hit_Dice := 5;
    Monster[m_owlbear].Ac := 5;
    Monster[m_owlbear].Th0 := 15;
    Monster[m_owlbear].Dam := 12;
    Monster[m_owlbear].Num := 2;
    Monster[m_owlbear].Special := 1;
    Monster[m_owlbear].Min_Level := 16;
    Monster[m_owlbear].Max_Level := 21;
    Monster[m_owlbear].Sleep := 20;
    Monster[m_owlbear].Large := True;
    Monster[m_owlbear].XPVal := 40;

    Monster[m_phantom].Long_Name := 'phantom stalker               ';
    Monster[m_phantom].Name := 'p';
    Monster[m_phantom].Len := 15;
    Monster[m_phantom].Hit_Dice := 6;
    Monster[m_phantom].Ac := 3;
    Monster[m_phantom].Th0 := 14;
    Monster[m_phantom].Dam := 4;
    Monster[m_phantom].Num := 2;
    Monster[m_phantom].Special := 3;
    Monster[m_phantom].Min_Level := 11;
    Monster[m_phantom].Max_Level := 16;
    Monster[m_phantom].Sleep := 70;
    Monster[m_phantom].Large := True;
    Monster[m_phantom].XPVal := 37;

    Monster[m_quaggoth].Long_Name := 'quaggoth                      ';
    Monster[m_quaggoth].Name := 'q';
    Monster[m_quaggoth].Len := 8;
    Monster[m_quaggoth].Hit_Dice := 1;
    Monster[m_quaggoth].Ac := 6;
    Monster[m_quaggoth].Th0 := 17;
    Monster[m_quaggoth].Dam := 4;
    Monster[m_quaggoth].Num := 2;
    Monster[m_quaggoth].Special := 1;
    Monster[m_quaggoth].Min_Level := 1;
    Monster[m_quaggoth].Max_Level := 4;
    Monster[m_quaggoth].Sleep := 10;
    Monster[m_quaggoth].Large := True;
    Monster[m_quaggoth].XPVal := 3;

    Monster[m_revenant].Long_Name := 'revenant                      ';
    Monster[m_revenant].Name := 'r';
    Monster[m_revenant].Len := 8;
    Monster[m_revenant].Hit_Dice := 8;
    Monster[m_revenant].Ac := 10;
    Monster[m_revenant].Th0 := 15;
    Monster[m_revenant].Dam := 8;
    Monster[m_revenant].Num := 2;
    Monster[m_revenant].Special := 3;
    Monster[m_revenant].Min_Level := 18;
    Monster[m_revenant].Max_Level := 21;
    Monster[m_revenant].Sleep := 30;
    Monster[m_revenant].Large := False;
    Monster[m_revenant].XPVal := 50;

    Monster[m_sand].Long_Name := 'sandman                       ';
    Monster[m_sand].Name := 's';
    Monster[m_sand].Len := 7;
    Monster[m_sand].Hit_Dice := 4;
    Monster[m_sand].Ac := 3;
    Monster[m_sand].Th0 := 14;
    Monster[m_sand].Dam := 0;
    Monster[m_sand].Num := 0;
    Monster[m_sand].Special := 2;
    Monster[m_sand].Min_Level := 10;
    Monster[m_sand].Max_Level := 14;
    Monster[m_sand].Sleep := 100;
    Monster[m_sand].Large := False;
    Monster[m_sand].XPVal := 25;


    Monster[m_tira].Long_Name := 'tirapheg                      ';
    Monster[m_tira].Name := 't';
    Monster[m_tira].Len := 8;
    Monster[m_tira].Hit_Dice := 2;
    Monster[m_tira].Ac := 10;
    Monster[m_tira].Th0 := 17;
    Monster[m_tira].Dam := 4;
    Monster[m_tira].Num := 3;
    Monster[m_tira].Special := 1;
    Monster[m_tira].Min_Level := 5;
    Monster[m_tira].Max_Level := 9;
    Monster[m_tira].Sleep := 30;
    Monster[m_tira].Large := False;
    Monster[m_tira].XPVal := 8;

    Monster[m_umpleby].Long_Name := 'umpleby                       ';
    Monster[m_umpleby].Name := 'u';
    Monster[m_umpleby].Len := 7;
    Monster[m_umpleby].Hit_Dice := 6;
    Monster[m_umpleby].Ac := 4;
    Monster[m_umpleby].Th0 := 14;
    Monster[m_umpleby].Dam := 4;
    Monster[m_umpleby].Num := 1;
    Monster[m_umpleby].Special := 3;
    Monster[m_umpleby].Min_Level := 8;
    Monster[m_umpleby].Max_Level := 11;
    Monster[m_umpleby].Sleep := 25;
    Monster[m_umpleby].Large := True;
    Monster[m_umpleby].XPVal := 30;

    Monster[m_vodyanoi].Long_Name := 'vodyanoi                      ';
    Monster[m_vodyanoi].Name := 'v';
    Monster[m_vodyanoi].Len := 8;
    Monster[m_vodyanoi].Hit_Dice := 8;
    Monster[m_vodyanoi].Ac := 2;
    Monster[m_vodyanoi].Th0 := 13;
    Monster[m_vodyanoi].Dam := 11;
    Monster[m_vodyanoi].Num := 3;
    Monster[m_vodyanoi].Special := 1;
    Monster[m_vodyanoi].Min_Level := 21;
    Monster[m_vodyanoi].Max_Level := 26;
    Monster[m_vodyanoi].Sleep := 40;
    Monster[m_vodyanoi].Large := True;
    Monster[m_vodyanoi].XPVal := 65;

    Monster[m_werewolf].Long_Name := 'werewolf                      ';
    Monster[m_werewolf].Name := 'w';
    Monster[m_werewolf].Len := 8;
    Monster[m_werewolf].Hit_Dice := 5;
    Monster[m_werewolf].Ac := 5;
    Monster[m_werewolf].Th0 := 13;
    Monster[m_werewolf].Dam := 4;
    Monster[m_werewolf].Num := 2;
    Monster[m_werewolf].Special := 1;
    Monster[m_werewolf].Min_Level := 15;
    Monster[m_werewolf].Max_Level := 20;
    Monster[m_werewolf].Sleep := 20;
    Monster[m_werewolf].Large := True;
    Monster[m_werewolf].XPVal := 45;

    Monster[m_xvart].Long_Name := 'xvart                         ';
    Monster[m_xvart].Name := 'x';
    Monster[m_xvart].Len := 5;
    Monster[m_xvart].Hit_Dice := 1;
    Monster[m_xvart].Ac := 7;
    Monster[m_xvart].Th0 := 18;
    Monster[m_xvart].Dam := 5;
    Monster[m_xvart].Num := 1;
    Monster[m_xvart].Special := 1;
    Monster[m_xvart].Min_Level := 1;
    Monster[m_xvart].Max_Level := 5;
    Monster[m_xvart].Sleep := 0;
    Monster[m_xvart].Large := False;
    Monster[m_xvart].XPVal := 1;

    Monster[m_yulgrin].Long_Name := 'yulgrin                       ';
    Monster[m_yulgrin].Name := 'y';
    Monster[m_yulgrin].Len := 7;
    Monster[m_yulgrin].Hit_Dice := 4;
    Monster[m_yulgrin].Ac := 7;
    Monster[m_yulgrin].Th0 := 16;
    Monster[m_yulgrin].Dam := 10;
    Monster[m_yulgrin].Num := 1;
    Monster[m_yulgrin].Special := 1;
    Monster[m_yulgrin].Min_Level := 7;
    Monster[m_yulgrin].Max_Level := 10;
    Monster[m_yulgrin].Sleep := 30;
    Monster[m_yulgrin].Large := False;
    Monster[m_yulgrin].XPVal := 12;

    Monster[m_zallige].Long_Name := 'zallige                       ';
    Monster[m_zallige].Name := 'z';
    Monster[m_zallige].Len := 7;
    Monster[m_zallige].Hit_Dice := 9;
    Monster[m_zallige].Ac := 0;
    Monster[m_zallige].Th0 := 10;
    Monster[m_zallige].Dam := 18;
    Monster[m_zallige].Num := 2;
    Monster[m_zallige].Special := 1;
    Monster[m_zallige].Min_Level := 24;
    Monster[m_zallige].Max_Level := 40;
    Monster[m_zallige].Sleep := 10;
    Monster[m_zallige].Large := True;
    Monster[m_zallige].XPVal := 150;
End;

initprocedure;
begin
  potion[p_gold_det].name := 'gold detection                ';
   potion[p_gold_det].n_leng := 14; potion[p_gold_det].id := false;
    potion[p_gold_det].called := false;
  potion[p_mon_det].name := 'monster detection             ';
   potion[p_mon_det].n_leng := 17; potion[p_mon_det].id := false;
    potion[p_mon_det].called := false;
  potion[p_magic_det].name := 'magic detection               ';
   potion[p_magic_det].n_leng := 15; potion[p_magic_det].id := false;
    potion[p_magic_det].called := false;
  potion[p_reg_str].name := 'regain strength               ';
   potion[p_reg_str].n_leng := 15; potion[p_reg_str].id := false;
    potion[p_reg_str].called := false;
  potion[p_reg_int].name := 'regain intelligence           ';
   potion[p_reg_int].n_leng := 19; potion[p_reg_int].id := false;
    potion[p_reg_int].called := false;
  potion[p_reg_dex].name := 'regain dexterity              ';
   potion[p_reg_dex].n_leng := 16; potion[p_reg_dex].id := false;
    potion[p_reg_dex].called := false;
  potion[p_poison].name := 'poison                        ';
   potion[p_poison].n_leng := 6; potion[p_poison].id := false;
    potion[p_poison].called := false;
  potion[p_feeble].name := 'feeblemindedness              ';
   potion[p_feeble].n_leng := 16; potion[p_feeble].id := false;
    potion[p_feeble].called := false;
  potion[p_fumble].name := 'fumbling                      ';
   potion[p_fumble].n_leng := 8; potion[p_fumble].id := false;
    potion[p_fumble].called := false;
  potion[p_incr_str].name := 'increase strength             ';
   potion[p_incr_str].n_leng := 17; potion[p_incr_str].id := false;
    potion[p_incr_str].called := false;
  potion[p_incr_int].name := 'increase intelligence         ';
   potion[p_incr_int].n_leng := 21; potion[p_incr_int].id := false;
    potion[p_incr_int].called := false;
  potion[p_inc_dex].name := 'increase dexterity            ';
   potion[p_inc_dex].n_leng := 18; potion[p_inc_dex].id := false;
    potion[p_inc_dex].called := false;
  potion[p_skill].name := 'skillfulness                  ';
   potion[p_skill].n_leng := 12; potion[p_skill].id := false;
    potion[p_skill].called := false;
  potion[p_healing].name := 'healing                       ';
   potion[p_healing].n_leng := 7; potion[p_healing].id := false;
    potion[p_healing].called := false;
  potion[p_ex_healing].name := 'extra healing                 ';
   potion[p_ex_healing].n_leng := 13; potion[p_ex_healing].id := false;
    potion[p_ex_healing].called := false;
  potion[p_invis].name := 'see invisible                 ';
   potion[p_invis].n_leng := 13; potion[p_invis].id := false;
    potion[p_invis].called := false;
  potion[p_haste].name := 'haste self                    ';
   potion[p_haste].n_leng := 10; potion[p_haste].id := false;
    potion[p_haste].called := false;
  potion[p_slow].name := 'slow self                     ';
   potion[p_slow].n_leng := 9; potion[p_slow].id := false;
    potion[p_slow].called := false;
  potion[p_blind].name := 'blindness                     ';
   potion[p_blind].n_leng := 9; potion[p_blind].id := false;
    potion[p_blind].called := false;
  potion[p_confuse].name := 'confusion                     ';
   potion[p_confuse].n_leng := 9; potion[p_confuse].id := false;
    potion[p_confuse].called := false;
  potion[p_confuse_mon].name := 'confuse monster               ';
   potion[p_confuse_mon].n_leng := 15; potion[p_confuse_mon].id := false;
    potion[p_confuse_mon].called := false;
  potion[p_sleep].name := 'sleep                         ';
   potion[p_sleep].n_leng := 5; potion[p_sleep].id := false;
    potion[p_sleep].called := false;
  potion[p_paralysis].name := 'paralysis                     ';
   potion[p_paralysis].n_leng := 9; potion[p_paralysis].id := false;
    potion[p_paralysis].called := false;
  potion[p_nothing].name := 'nothing                       ';
   potion[p_nothing].n_leng := 7; potion[p_nothing].id := false;
    potion[p_nothing].called := false;
  potion[p_sustenance].name := 'sustenance                    ';
   potion[p_sustenance].n_Leng := 10; potion[p_sustenance].id := False;
    potion[p_sustenance].called := False; (* #54 *)
end;

initprocedure;
begin
  scroll[s_armor].name := 'enchant armor                 ';
   scroll[s_armor].n_leng := 13; scroll[s_armor].id := false;
    scroll[s_armor].called := false; scroll[s_armor].can_id := true;
  scroll[s_weapon].name := 'enchant weapon                ';
   scroll[s_weapon].n_leng := 14; scroll[s_weapon].id := false;
    scroll[s_weapon].called := false; scroll[s_weapon].can_id := true;
  scroll[s_curse].name := 'remove curse                  ';
   scroll[s_curse].n_leng := 12; scroll[s_curse].id := false;
    scroll[s_curse].called := false; scroll[s_curse].can_id := true;
  scroll[s_mapping].name := 'magic mapping                 ';
   scroll[s_mapping].n_leng := 13; scroll[s_mapping].id := false;
    scroll[s_mapping].called := false; scroll[s_mapping].can_id := true;
  scroll[s_identify].name := 'identify                      ';
   scroll[s_identify].n_leng := 8; scroll[s_identify].id := false;
    scroll[s_identify].called := false; scroll[s_identify].can_id := true;
  scroll[s_genocide].name := 'genocide                      ';
   scroll[s_genocide].n_leng := 8; scroll[s_genocide].id := false;
    scroll[s_genocide].called := false; scroll[s_genocide].can_id := true;
  scroll[s_scare].name := 'scare monster                 ';
   scroll[s_scare].n_leng := 13; scroll[s_scare].id := false;
    scroll[s_scare].called := false; scroll[s_scare].can_id := true;
  scroll[s_nothing].name := 'nothing                       ';
   scroll[s_nothing].n_leng := 7; scroll[s_nothing].id := false;
    scroll[s_nothing].called := false; scroll[s_nothing].can_id := true;
  scroll[s_teleport].name := 'teleportation                 ';
   scroll[s_teleport].n_leng := 13; scroll[s_teleport].id := false;
    scroll[s_teleport].called := false; scroll[s_teleport].can_id := true;
  scroll[s_summon].name := 'summon monster                ';
   scroll[s_summon].n_leng := 14; scroll[s_summon].id := false;
    scroll[s_summon].called := false; scroll[s_summon].can_id := true;
  scroll[s_light].name := 'light                         ';
   scroll[s_light].n_leng := 5; scroll[s_light].id := false;
    scroll[s_light].called := false; scroll[s_light].can_id := true;
  scroll[s_hold].name := 'hold portal                   ';
   scroll[s_hold].n_leng := 11; scroll[s_hold].id := False;
    scroll[s_hold].called := False; scroll[s_hold].can_id := True;
end;

initprocedure;
begin
  wand[w_drain].name := 'drain life                    ';
   wand[w_drain].n_leng := 10;
    wand[w_drain].id := false; wand[w_drain].called := false;
     wand[w_drain].dam := 10; wand[w_drain].num := 20;
  wand[w_fire].name := 'fire                          ';
   wand[w_fire].n_leng := 4;
    wand[w_fire].id := false; wand[w_fire].called := false;
     wand[w_fire].dam := 6; wand[w_fire].num := 8;
  wand[w_lightning].name := 'lightning                     ';
   wand[w_lightning].n_leng := 9;
    wand[w_lightning].id := false; wand[w_lightning].called := false;
     wand[w_lightning].dam := 6; wand[w_lightning].num := 8;
  wand[w_cold].name := 'cold                          ';
   wand[w_cold].n_leng := 4;
    wand[w_cold].id := false; wand[w_cold].called := false;
     wand[w_cold].dam := 6; wand[w_cold].num := 8;
  wand[w_light].name := 'light                         ';
   wand[w_light].n_leng := 5;
    wand[w_light].id := false; wand[w_light].called := false;
  wand[w_poly].name := 'polymorph                     ';
   wand[w_poly].n_leng := 9;   wand[w_poly].id := false;
    wand[w_poly].called := false;
  wand[w_tele_to].name := 'teleport to                   ';
   wand[w_tele_to].n_leng := 11;
    wand[w_tele_to].id := false; wand[w_tele_to].called := false;
  wand[w_tele_away].name := 'teleport away                 ';
   wand[w_tele_away].n_leng := 13;
    wand[w_tele_away].id := false; wand[w_tele_away].called := false;
  wand[w_missile].name := 'magic missile                 ';
   wand[w_missile].n_leng := 13;
    wand[w_missile].id := false; wand[w_missile].called := false;
     wand[w_missile].dam := 4; wand[w_missile].num := 1;
  wand[w_nothing].name := 'nothing                       ';
   wand[w_nothing].n_leng := 7;
    wand[w_nothing].id := false; wand[w_nothing].called := false;
  wand[w_striking].name := 'striking                      ';
   wand[w_striking].n_leng := 8;
    wand[w_striking].id := false; wand[w_striking].called := false;
     wand[w_striking].dam := 6; wand[w_striking].num := 2;
  wand[w_slow].name := 'slow monster                  ';
   wand[w_slow].n_leng := 12;
    wand[w_slow].id := false; wand[w_slow].called := false;
  wand[w_haste].name := 'haste monster                 ';
   wand[w_haste].n_leng := 13;
    wand[w_haste].id := false; wand[w_haste].called := false;
  wand[w_cancel].name := 'cancellation                  ';
   wand[w_cancel].n_leng := 12;
    wand[w_cancel].id := false; wand[w_cancel].called := false;
  wand[w_alchemy].name := 'alchemy                       ';
   wand[w_alchemy].n_leng := 7;
    wand[w_alchemy].id := false; wand[w_alchemy].called := false;
  wand[w_wonder].name := 'wonder                        ';
   wand[w_wonder].n_leng := 6;
    wand[w_wonder].id := false; wand[w_wonder].called := false;
  wand[w_paralyze].name := 'paralyzation                  ';
   wand[w_paralyze].n_leng := 12;
    wand[w_paralyze].id := false; wand[w_paralyze].called := false;
  wand[w_curing].name := 'curing                        ';
   wand[w_curing].n_leng := 6;
    wand[w_curing].id := false; wand[w_curing].called := false;
  wand[w_search].name := 'searching                     ';
   wand[w_search].n_leng := 9;
    wand[w_search].id := false; wand[w_search].called := false;
  wand[w_blunder].name := 'blunder                       '; (* #1 *)
   wand[w_blunder].n_leng := 7;
    wand[w_blunder].id := false; wand[w_blunder].called := false;
end;

initprocedure;
begin
  armor[a_leather].name := 'leather armor                 ';
   armor[a_leather].n_leng := 13; armor[a_leather].ac := 8;
  armor[a_stud].name := 'studded leather armor         ';
   armor[a_stud].n_leng := 21; armor[a_stud].ac := 7;
  armor[a_ring].name := 'ring mail                     ';
   armor[a_ring].n_leng := 9; armor[a_ring].ac := 7;
  armor[a_scale].name := 'scale mail                    ';
   armor[a_scale].n_leng := 10; armor[a_scale].ac := 6;
  armor[a_chain].name := 'chain mail                    ';
   armor[a_chain].n_leng := 10; armor[a_chain].ac := 5;
  armor[a_splint].name := 'splint mail                   ';
   armor[a_splint].n_leng := 11; armor[a_splint].ac := 4;
  armor[a_banded].name := 'banded mail                   ';
   armor[a_banded].n_leng := 11; armor[a_banded].ac := 4;
  armor[a_plate].name := 'plate mail                    ';
   armor[a_plate].n_leng := 10; armor[a_plate].ac := 3;
end;

initprocedure;
begin
  ring[r_regen].name := 'regeneration                  ';
   ring[r_regen].n_leng := 12; ring[r_regen].id := false;
    ring[r_regen].called := false;
  ring[r_digest].name := 'slow digestion                ';
   ring[r_digest].n_leng := 14; ring[r_digest].id := false;
    ring[r_digest].called := false;
  ring[r_sustain].name := 'sustain strength              ';
   ring[r_sustain].n_leng := 16; ring[r_sustain].id := false;
    ring[r_sustain].called := false;
  ring[r_protect].name := 'protection                    ';
   ring[r_protect].n_leng := 10; ring[r_protect].id := false;
    ring[r_protect].called := false;
  ring[r_dex].name := 'dexterity                     ';
   ring[r_dex].n_leng := 9; ring[r_dex].id := false;
    ring[r_dex].called := false;
  ring[r_str].name := 'strength                      ';
   ring[r_str].n_leng := 8; ring[r_str].id := false;
    ring[r_str].called := false;
  ring[r_int].name := 'intelligence                  ';
   ring[r_int].n_leng := 12; ring[r_int].id := false;
    ring[r_int].called := false;
  ring[r_see_inv].name := 'see invisible                 ';
   ring[r_see_inv].n_leng := 13; ring[r_see_inv].id := false;
    ring[r_see_inv].called := false;
  ring[r_teleport].name := 'teleportation                 ';
   ring[r_teleport].n_leng := 13; ring[r_teleport].id := false;
    ring[r_teleport].called := false;
  ring[r_stealth].name := 'stealth                       ';
   ring[r_stealth].n_leng := 7; ring[r_stealth].id := false;
    ring[r_stealth].called := false;
  ring[r_aggra].name := 'aggravate monster             ';
   ring[r_aggra].n_leng := 17; ring[r_aggra].id := false;
    ring[r_aggra].called := false;
  ring[r_search].name := 'searching                     ';
   ring[r_search].n_leng := 9; ring[r_search].id := false;
    ring[r_search].called := false;
  ring[r_incr_dam].name := 'increase damage               ';
   ring[r_incr_dam].n_leng := 15; ring[r_incr_dam].id := false;
    ring[r_incr_dam].called := false;
  Ring[r_resur].Name := 'resurrection                  ';
   ring[r_resur].n_leng := 12; ring[r_resur].id := false;
    ring[r_resur].called := false;
  Ring[r_vampiric].Name := 'vampiric regeneration         ';
   ring[r_vampiric].n_leng := 21; ring[r_vampiric].id := false;
    ring[r_vampiric].called := false;
  Ring[r_invis].Name := 'invisibility                  ';
   ring[r_invis].n_leng := 12; ring[r_invis].id := false;
    ring[r_invis].called := false;
  Ring[r_decode].Name := 'secret decoding               '; (* #55 *)
   ring[r_decode].n_leng := 24; ring[r_decode].id := False;
    ring[r_decode].called := False;
end;

initprocedure;
begin
  weapon[wp_two_sword].name := 'two handed sword              ';
  weapon[wp_two_sword].n_leng := 16;
  Weapon[wp_two_sword].S_Dam := 10; Weapon[wp_two_sword].S_Num := 1;
  Weapon[wp_two_sword].L_Dam := 6; Weapon[wp_two_sword].L_Num := 3;

  weapon[wp_long_sword].name := 'long sword                    ';
  weapon[wp_long_sword].n_leng := 10;
  Weapon[wp_long_sword].S_Dam := 8; Weapon[wp_long_sword].S_Num := 1;
  Weapon[wp_long_sword].L_Dam := 12; Weapon[wp_long_sword].L_Num := 1;

  weapon[wp_dagger].name := 'dagger                        ';
  weapon[wp_dagger].n_leng := 6;
  Weapon[wp_dagger].S_Dam := 4; Weapon[wp_dagger].S_Num := 1;
  Weapon[wp_dagger].L_Dam := 3; Weapon[wp_dagger].L_Num := 1;

  weapon[wp_sling].name := 'sling                         ';
  weapon[wp_sling].n_leng := 5;
  Weapon[wp_sling].S_Dam := 1; Weapon[wp_sling].S_Num := 1;
  Weapon[wp_sling].L_Dam := 1; Weapon[wp_sling].L_Num := 1;

  weapon[wp_rocks].name := 'rock                          ';
  weapon[wp_rocks].n_leng := 4;
  Weapon[wp_rocks].S_Dam := 4; Weapon[wp_rocks].S_Num := -wp_sling;
  Weapon[wp_rocks].L_Dam := 4; Weapon[wp_rocks].L_Num := -wp_sling;

  weapon[wp_crossbow].name := 'crossbow                      ';
  weapon[wp_crossbow].n_leng := 8;
  Weapon[wp_crossbow].S_Dam := 1; Weapon[wp_crossbow].S_Num := 1;
  Weapon[wp_crossbow].L_Dam := 1; Weapon[wp_crossbow].L_Num := 1;

  weapon[wp_bolts].name := 'bolt                          ';
  weapon[wp_bolts].n_leng := 4;
  Weapon[wp_bolts].S_Dam := 6; Weapon[wp_bolts].S_Num := -wp_crossbow;
  Weapon[wp_bolts].L_Dam := 6; Weapon[wp_bolts].L_Num := -wp_crossbow;

  weapon[wp_Bow].name := 'short bow                     ';
  weapon[wp_Bow].n_leng := 9;
  Weapon[wp_Bow].S_Dam := 1; Weapon[wp_Bow].S_Num := 1;
  Weapon[wp_Bow].L_Dam := 1; Weapon[wp_Bow].L_Num := 1;

  weapon[wp_arrows].name := 'arrow                         ';
  weapon[wp_arrows].n_leng := 5;
  Weapon[wp_arrows].S_Dam := 6; Weapon[wp_arrows].S_Num := -wp_bow;
  Weapon[wp_arrows].L_Dam := 6; Weapon[wp_arrows].L_Num := -wp_bow;

  weapon[wp_mace].name := 'mace                          ';
  weapon[wp_mace].n_leng := 4;
  Weapon[wp_mace].S_Dam := 8;  Weapon[wp_mace].S_Num := 1;
  Weapon[wp_mace].L_Dam := 7;  Weapon[wp_mace].L_Num := 1;

  weapon[wp_sil_sword].name := 'silver long sword             ';
  weapon[wp_sil_sword].n_leng := 17;
  Weapon[wp_sil_sword].S_Dam := 8; Weapon[wp_sil_sword].S_Num := 1;
  Weapon[wp_sil_sword].L_Dam := 12; Weapon[wp_sil_sword].L_Num := 1;

  weapon[wp_sil_arrows].name := 'silver arrow                  ';
  weapon[wp_sil_arrows].n_leng := 12;
  Weapon[wp_sil_arrows].S_Dam := 6; Weapon[wp_sil_arrows].S_Num := -wp_bow;
  Weapon[wp_sil_arrows].L_Dam := 6; Weapon[wp_sil_arrows].L_Num := -wp_bow;
end;

Initprocedure;
Begin
  color[1].name := 'red       '; color[1].leng := 3;
  color[2].name := 'blue      '; color[2].leng := 4;
  color[3].name := 'yellow    '; color[3].leng := 6;
  color[4].name := 'green     '; color[4].leng := 5;
  color[5].name := 'orange    '; color[5].leng := 6;
  color[6].name := 'violet    '; color[6].leng := 6;
  color[7].name := 'black     '; color[7].leng := 5;
  color[8].name := 'white     '; color[8].leng := 5;
  color[9].name := 'brown     '; color[9].leng := 5;
  color[10].name := 'pink      '; color[10].leng := 4;
  color[11].name := 'clear     '; color[11].leng := 5;
  color[12].name := 'tan       '; color[12].leng := 3;
  color[13].name := 'aquamarine'; color[13].leng := 10;
  color[14].name := 'purple    '; color[14].leng := 6;
  color[15].name := 'vermilion '; color[15].leng := 9;
  color[16].name := 'gold      '; color[16].leng := 4;
  color[17].name := 'silver    '; color[17].leng := 6;
  color[18].name := 'gray      '; color[18].leng := 4;
  color[19].name := 'beige     '; color[19].leng := 5;
  color[20].name := 'olive     '; color[20].leng := 5;
  color[21].name := 'sparkling '; color[21].leng := 9;
  color[22].name := 'cloudy    '; color[22].leng := 6;
  color[23].name := 'foaming   '; color[23].leng := 7;
  color[24].name := 'plaid     '; color[24].leng := 5;
  color[25].name := 'milky     '; color[25].leng := 5; (* #54 *)
end;

initprocedure;
begin
  stone[1].name := 'ruby      '; stone[1].leng := 4;
  stone[2].name := 'diamond   '; stone[2].leng := 7;
  stone[3].name := 'emerald   '; stone[3].leng := 7;
  stone[4].name := 'sapphire  '; stone[4].leng := 8;
  stone[5].name := 'topaz     '; stone[5].leng := 5;
  stone[6].name := 'jade      '; stone[6].leng := 4;
  stone[7].name := 'obsidian  '; stone[7].leng := 8;
  stone[8].name := 'onyx      '; stone[8].leng := 4;
  stone[9].name := 'pearl     '; stone[9].leng := 5;
  stone[10].name := 'carnelian '; stone[10].leng := 9;
  stone[11].name := 'amethyst  '; stone[11].leng := 8;
  stone[12].name := 'bloodstone'; stone[12].leng := 10;
  stone[13].name := 'tiger eye '; stone[13].leng := 9;
  stone[14].name := 'opal      '; stone[14].leng := 4;
  stone[15].name := 'jet       '; stone[15].leng := 3;
  stone[16].name := 'coral     '; stone[16].leng := 5;
  stone[17].name := 'moonstone '; stone[17].leng := 9; (* #55 *)
end;

initprocedure;
begin
  wood[1].name := 'maple     '; wood[1].leng := 5;
  wood[2].name := 'ebony     '; wood[2].leng := 5;
  wood[3].name := 'oak       '; wood[3].leng := 3;
  wood[4].name := 'spruce    '; wood[4].leng := 6;
  wood[5].name := 'redwood   '; wood[5].leng := 7;
  wood[6].name := 'birch     '; wood[6].leng := 5;
  wood[7].name := 'ironwood  '; wood[7].leng := 8;
  wood[8].name := 'hemlock   '; wood[8].leng := 7;
  wood[9].name := 'balsa     '; wood[9].leng := 5;
  wood[10].name := 'teak      '; wood[10].leng := 4;
  wood[11].name := 'cherry    '; wood[11].leng := 6;
  wood[12].name := 'pine      '; wood[12].leng := 4;
  wood[13].name := 'manzanita '; wood[13].leng := 9;
  wood[14].name := 'mahogany  '; wood[14].leng := 8;
  wood[15].name := 'walnut    '; wood[15].leng := 6;
  wood[16].name := 'rosewood  '; wood[16].leng := 8;
  wood[17].name := 'sycamore  '; wood[17].leng := 8;
  wood[18].name := 'hickory   '; wood[18].leng := 7;
  wood[19].name := 'bamboo    '; wood[19].leng := 6;
  wood[20].name := 'fir       '; wood[20].leng := 3;
end;

initprocedure;
begin
  metal[1].name := 'steel     '; metal[1].leng := 5;
  metal[2].name := 'lead      '; metal[2].leng := 4;
  metal[3].name := 'tin       '; metal[3].leng := 3;
  metal[4].name := 'iron      '; metal[4].leng := 4;
  metal[5].name := 'zinc      '; metal[5].leng := 4;
  metal[6].name := 'platinum  '; metal[6].leng := 8;
  metal[7].name := 'aluminum  '; metal[7].leng := 8;
  metal[8].name := 'brass     '; metal[8].leng := 5;
  metal[9].name := 'ivory     '; metal[9].leng := 5;
  metal[10].name := 'bone      '; metal[10].leng := 4;
  metal[11].name := 'silver    '; metal[11].leng := 6;
  metal[12].name := 'gold      '; metal[12].leng := 4;
  metal[13].name := 'magnesium '; metal[13].leng := 9;
  metal[14].name := 'copper    '; metal[14].leng := 6;
  metal[15].name := 'bronze    '; metal[15].leng := 6;
  metal[16].name := 'electrum  '; metal[16].leng := 8;
  metal[17].name := 'glass     '; metal[17].leng := 5;
  metal[18].name := 'crystal   '; metal[18].leng := 7;
  metal[19].name := 'pewter    '; metal[19].leng := 6;
  metal[20].name := 'rusty     '; metal[20].leng := 5;
end;

initprocedure;
begin
  word[1].name := 'xo        '; word[1].leng := 2;
  word[2].name := 'meilrahc  '; word[2].leng := 8;
  word[3].name := 'nelg      '; word[3].leng := 4;
  word[4].name := 'ulooloo   '; word[4].leng := 7;
  word[5].name := 'fris      '; word[5].leng := 4;
  word[6].name := 'ah-clem   '; word[6].leng := 7;
  word[7].name := 'dobne     '; word[7].leng := 5;
  word[8].name := 'ixchotl   '; word[8].leng := 7;
  word[9].name := 'brachnild '; word[9].leng := 9;
  word[10].name := 'oorne     '; word[10].leng := 5;
  word[11].name := 'mojwinq   '; word[11].leng := 7;
  word[12].name := 'pribanic  '; word[12].leng := 8;
  word[13].name := 'bhatti    '; word[13].leng := 6;
  word[14].name := 'moni-q    '; word[14].leng := 6;
  word[15].name := 'goezor    '; word[15].leng := 6;
  word[16].name := 'trelch    '; word[16].leng := 6;
  word[17].name := 'eddbaka   '; word[17].leng := 7;
  word[18].name := 'merkbron  '; word[18].leng := 8;
  word[19].name := 'gareeprtz '; word[19].leng := 9;
  word[20].name := 'jskiere   '; word[20].leng := 7;
  word[21].name := 'moriwutz  '; word[21].leng := 8;
  word[22].name := 'qonsitte  '; word[22].leng := 8;
  word[23].name := 'mazinga   '; word[23].leng := 7;
  word[24].name := 'manabe    '; word[24].leng := 6;
  word[25].name := 'j-rlph    '; word[25].leng := 6;
  word[26].name := 'ni-pep    '; word[26].leng := 6;
  word[27].name := 'ma-aqqu   '; word[27].leng := 7;
  word[28].name := 'usskahr   '; word[28].leng := 7;
  word[29].name := 'okeeninam '; word[29].leng := 9;
  word[30].name := 'mariesch  '; word[30].leng := 8;
  word[31].name := 'kaamatang '; word[31].leng := 9;
  word[32].name := 'pog-mahon '; word[32].leng := 9;
  word[33].name := 'quang-tx  '; word[33].leng := 8;
  word[34].name := 'omvidadis '; word[34].leng := 9;
  word[35].name := 'wol       '; word[35].leng := 3;
  word[36].name := 'zqwtu-axt '; word[36].leng := 9;
  word[37].name := 'merk      '; word[37].leng := 4;
  word[38].name := 'ta-alli   '; word[38].leng := 7;
  word[39].name := 'ouizzkoie '; word[39].leng := 9;
  word[40].name := 'oo-ouille '; word[40].leng := 9;
  word[41].name := 'eno-ytrof '; word[41].leng := 9;
  word[42].name := 'juq       '; word[42].leng := 3;
  word[43].name := 'oi        '; word[43].leng := 2;
  word[44].name := 'yraggiarc '; word[44].leng := 9;
  word[45].name := 'eugorsnett'; word[45].leng := 10;
  word[46].name := 'ttengs    '; word[46].leng := 6;
  word[47].name := 'phtheifes '; word[47].leng := 9;
  word[48].name := 'nyarteri  '; word[48].leng := 8;
  word[49].name := 'moht-reeks'; word[49].leng := 10;
  word[50].name := 'goud      '; word[50].leng := 4;
  word[51].name := 'rotinom   '; word[51].leng := 7;
  word[52].name := 'smoortser '; word[52].leng := 9;
  word[53].name := 'cidre     '; word[53].leng := 5;
  word[54].name := 'oknridx   '; word[54].leng := 7;
  word[55].name := 'yyrthum   '; word[55].leng := 7;
  word[56].name := 'descytsem '; word[56].leng := 9;
  word[57].name := 'bruhmschh '; word[57].leng := 9;
  word[58].name := 'einwaf    '; word[58].leng := 6;
  word[59].name := 'jupe      '; word[59].leng := 4;
  word[60].name := 'kaupatie  '; word[60].leng := 8;
  word[61].name := 'ugerbaaui '; word[61].leng := 9;
  word[62].name := 'bhaf      '; word[62].leng := 4;
  word[63].name := 'ka-ille   '; word[63].leng := 7;
  word[64].name := 'maknam    '; word[64].leng := 6;
  word[65].name := 'gnesyme   '; word[65].leng := 7;
  word[66].name := 'xis-ytxis '; word[66].leng := 9;
  word[67].name := 'nyp       '; word[67].leng := 3;
  word[68].name := 'deuki     '; word[68].leng := 5;
  word[69].name := 'ghodrat   '; word[69].leng := 7;
  word[70].name := 'tansik    '; word[70].leng := 6;
  word[71].name := 'machale   '; word[71].leng := 7;
  word[72].name := 'dwinity   '; word[72].leng := 7;
  word[73].name := 'taqwe-ere '; word[73].leng := 9;
  word[74].name := 'wurdilst  '; word[74].leng := 8;
  word[75].name := 'watinj    '; word[75].leng := 6;
  word[76].name := 'moirdblat '; word[76].leng := 9;
  word[77].name := 'yttriun   '; word[77].leng := 7;
  word[78].name := 'sadiub-lat'; word[78].leng := 10;
  word[79].name := 'nytrok-o  '; word[79].leng := 8;
  word[80].name := 'khan      '; word[80].leng := 4;
  word[81].name := 'ackhhtng  '; word[81].leng := 8;
  word[82].name := 'dragoljub '; word[82].leng := 9;
  word[83].name := 'sirg      '; word[83].leng := 4;
  word[84].name := 'pne-relli '; word[84].leng := 9;
  word[85].name := 'bhutta    '; word[85].leng := 6;
  word[86].name := 'treb      '; word[86].leng := 4;
  word[87].name := 'dalli     '; word[87].leng := 5;
  word[88].name := 'gibstit   '; word[88].leng := 7;
  word[89].name := 'giirf     '; word[89].leng := 5;
  word[90].name := 'waq-aqille'; word[90].leng := 10;
  word[91].name := 'zilnath   '; word[91].leng := 7;
  word[92].name := 'ylavlrig  '; word[92].leng := 8;
  word[93].name := 'ysyzygy   '; word[93].leng := 7;
  word[94].name := 'los-de-jae'; word[94].leng := 10;
  word[95].name := 'evif      '; word[95].leng := 4;
  word[96].name := 'rouf      '; word[96].leng := 4;
  word[97].name := 'scamette  '; word[97].leng := 8;
  word[98].name := 'laxap     '; word[98].leng := 5;
  word[99].name := 'rhemulak  '; word[99].leng := 8;
  word[100].name := 'ta-fieenal'; word[100].leng := 10;
  word[101].name := 'domokos   '; word[101].leng := 7;
  word[102].name := 'glyrehs   '; word[102].leng := 7;
  word[103].name := 'draalmon  '; word[103].leng := 8;
  word[104].name := 'shiavax   '; word[104].leng := 7;
  word[105].name := 'blas      '; word[105].leng := 4;
  word[106].name := 'majal     '; word[106].leng := 5;
  word[107].name := 'bobkof    '; word[107].leng := 6;
  word[108].name := 'scamee    '; word[108].leng := 6;
  word[109].name := 'teardublu '; word[109].leng := 9;
  word[110].name := 'aristar   '; word[110].leng := 7;
  word[111].name := 'amaragh   '; word[111].leng := 7;
  word[112].name := 'glissaragh'; word[112].leng := 10;
  word[113].name := 'clongowes '; word[113].leng := 9;
  word[114].name := 'maghanagh '; word[114].leng := 9;
  word[115].name := 'malahide  '; word[115].leng := 8;
  word[116].name := 'clonliffey'; word[116].leng := 10;
  word[117].name := 'ballyrock '; word[117].leng := 9;
  word[118].name := 'grafton   '; word[118].leng := 7;
  word[119].name := 'armagh    '; word[119].leng := 6;
  word[120].name := 'gillevans '; word[120].leng := 9;
  word[121].name := 'otais     '; word[121].leng := 5;
  word[122].name := 'ozzaxx    '; word[122].leng := 6;
  word[123].name := 'likid-len '; word[123].leng := 9;
  word[124].name := 'eyebeem   '; word[124].leng := 7;
  word[125].name := 'mor-dweo  '; word[125].leng := 8;
  word[126].name := 'thlayli   '; word[126].leng := 7;
  word[127].name := 'dawkcid   '; word[127].leng := 7;
  word[128].name := 'zandru    '; word[128].leng := 6;
  word[129].name := 'jetsons   '; word[129].leng := 7;
  word[130].name := 'wally-beav'; word[130].leng := 10;
  word[131].name := 'laran     '; word[131].leng := 5;
  word[132].name := 'heures    '; word[132].leng := 6;
  word[133].name := 'craindre  '; word[133].leng := 8;
  word[134].name := 'taquine   '; word[134].leng := 7;
  word[135].name := 'orly-sont '; word[135].leng := 9;
  word[136].name := 'surgele   '; word[136].leng := 7;
  word[137].name := 'gnippird  '; word[137].leng := 8;
  word[138].name := 'fromages  '; word[138].leng := 8;
  word[139].name := 'fitarepmi '; word[139].leng := 9;
  word[140].name := 'engapmahc '; word[140].leng := 9;
  word[141].name := 'regnad    '; word[141].leng := 6;
  word[142].name := 'bhagavad  '; word[142].leng := 8;
  word[143].name := 'destrier  '; word[143].leng := 8;
  word[144].name := 'triskele  '; word[144].leng := 8;
  word[145].name := 'racktingh '; word[145].leng := 9;
  word[146].name := 'nabrubus  '; word[146].leng := 8;
  word[147].name := 'guasacht  '; word[147].leng := 8;
  word[148].name := 'fusil     '; word[148].leng := 5;
  word[149].name := 'jezail    '; word[149].leng := 6;
  word[150].name := 'yromem    '; word[150].leng := 6;
  word[151].name := 'hornsby   '; word[151].leng := 7;
  word[152].name := 'jae-pi-dee'; word[152].leng := 10;
  word[153].name := 'nye-nart  '; word[153].leng := 8;
  word[154].name := 'wianal    '; word[154].leng := 6;
  word[155].name := 'illetni   '; word[155].leng := 7;
  word[156].name := 'sciteneg  '; word[156].leng := 8;
  word[157].name := 'ipotco    '; word[157].leng := 6;
  word[158].name := 'shotnicam '; word[158].leng := 9;
  word[159].name := 'normumb   '; word[159].leng := 7;
  word[160].name := 'cablecar  '; word[160].leng := 8;

end;

Initprocedure; (* Chances of finding a Treasure *)
Begin
  Treasure[1].Chance := 780  ; Treasure[1].Typ := Gold_t; Treasure[1].Index := 0;
  Treasure[2].Chance := 70  ; Treasure[2].Typ := Food_t; Treasure[2].Index := 0;
  Treasure[3].Chance := 50  ; Treasure[3].Typ := Scroll_t; Treasure[3].Index := S_identify;
  Treasure[4].Chance := 35  ; Treasure[4].Typ := Food_T; Treasure[4].Index := 1;
  Treasure[5].Chance := 32  ; Treasure[5].Typ := Scroll_t; Treasure[5].Index := S_curse;
  Treasure[6].Chance := 30  ; Treasure[6].Typ := Potion_t; Treasure[6].Index := P_healing;
  Treasure[7].Chance := 24  ; Treasure[7].Typ := Scroll_t; Treasure[7].Index := S_armor;
  Treasure[8].Chance := 24  ; Treasure[8].Typ := Scroll_t; Treasure[8].Index := S_weapon;
  Treasure[9].Chance := 20  ; Treasure[9].Typ := Scroll_t; Treasure[9].Index := S_mapping;
  Treasure[10].Chance := 20  ; Treasure[10].Typ := Scroll_t; Treasure[10].Index := S_scare;
  Treasure[11].Chance := 20  ; Treasure[11].Typ := Scroll_t; Treasure[11].Index := S_light;
  Treasure[12].Chance := 20  ; Treasure[12].Typ := Scroll_t; Treasure[12].Index := S_hold;
  Treasure[13].Chance := 18  ; Treasure[13].Typ := Scroll_t; Treasure[13].Index := S_teleport;
  Treasure[14].Chance := 14  ; Treasure[14].Typ := Potion_t; Treasure[14].Index := P_reg_str;
  Treasure[15].Chance := 14  ; Treasure[15].Typ := Potion_t; Treasure[15].Index := P_reg_int;
  Treasure[16].Chance := 14  ; Treasure[16].Typ := Scroll_t; Treasure[16].Index := S_summon;
  Treasure[17].Chance := 13  ; Treasure[17].Typ := Potion_t; Treasure[17].Index := P_reg_dex;
  Treasure[18].Chance := 12  ; Treasure[18].Typ := Potion_t; Treasure[18].Index := P_ex_healing;
  Treasure[19].Chance := 10  ; Treasure[19].Typ := Potion_t; Treasure[19].Index := P_gold_det;
  Treasure[20].Chance := 10  ; Treasure[20].Typ := Potion_t; Treasure[20].Index := P_mon_det;
  Treasure[21].Chance := 10  ; Treasure[21].Typ := Potion_t; Treasure[21].Index := P_magic_det;
  Treasure[22].Chance := 10  ; Treasure[22].Typ := Potion_t; Treasure[22].Index := P_poison;
  Treasure[23].Chance := 10  ; Treasure[23].Typ := Potion_t; Treasure[23].Index := P_feeble;
  Treasure[24].Chance := 10  ; Treasure[24].Typ := Potion_t; Treasure[24].Index := P_fumble;
  Treasure[25].Chance := 10  ; Treasure[25].Typ := Potion_t; Treasure[25].Index := P_incr_str;
  Treasure[26].Chance := 10  ; Treasure[26].Typ := Potion_t; Treasure[26].Index := P_incr_int;
  Treasure[27].Chance := 10  ; Treasure[27].Typ := Potion_t; Treasure[27].Index := P_inc_dex;
  Treasure[28].Chance := 10  ; Treasure[28].Typ := Potion_t; Treasure[28].Index := P_invis;
  Treasure[29].Chance := 10  ; Treasure[29].Typ := Potion_t; Treasure[29].Index := P_haste;
  Treasure[30].Chance := 10  ; Treasure[30].Typ := Potion_t; Treasure[30].Index := P_slow;
  Treasure[31].Chance := 10  ; Treasure[31].Typ := Potion_t; Treasure[31].Index := P_confuse;
  Treasure[32].Chance := 10  ; Treasure[32].Typ := Potion_t; Treasure[32].Index := P_confuse_mon;
  Treasure[33].Chance := 10  ; Treasure[33].Typ := Potion_t; Treasure[33].Index := P_sleep;
  Treasure[34].Chance := 10  ; Treasure[34].Typ := Potion_t; Treasure[34].Index := P_paralysis;
  Treasure[35].Chance := 10  ; Treasure[35].Typ := Scroll_t; Treasure[35].Index := S_nothing;
  Treasure[36].Chance := 9  ; Treasure[36].Typ := Armor_t; Treasure[36].Index := A_leather;
  Treasure[37].Chance := 8  ; Treasure[37].Typ := Weapon_t; Treasure[37].Index := Wp_mace;
  Treasure[38].Chance := 7  ; Treasure[38].Typ := Armor_t; Treasure[38].Index := A_stud;
  Treasure[39].Chance := 7  ; Treasure[39].Typ := Armor_t; Treasure[39].Index := A_ring;
  Treasure[40].Chance := 7  ; Treasure[40].Typ := Armor_t; Treasure[40].Index := A_scale;
  Treasure[41].Chance := 6  ; Treasure[41].Typ := Wand_t; Treasure[41].Index := W_light;
  Treasure[42].Chance := 6  ; Treasure[42].Typ := Weapon_t; Treasure[42].Index := Wp_long_sword;
  Treasure[43].Chance := 6  ; Treasure[43].Typ := Weapon_t; Treasure[43].Index := Wp_dagger;
  Treasure[44].Chance := 6  ; Treasure[44].Typ := Weapon_t; Treasure[44].Index := Wp_sling;
  Treasure[45].Chance := 6  ; Treasure[45].Typ := Weapon_t; Treasure[45].Index := Wp_rocks;
  Treasure[46].Chance := 6  ; Treasure[46].Typ := Weapon_t; Treasure[46].Index := Wp_crossbow;
  Treasure[47].Chance := 6  ; Treasure[47].Typ := Weapon_t; Treasure[47].Index := Wp_bolts;
  Treasure[48].Chance := 6  ; Treasure[48].Typ := Weapon_t; Treasure[48].Index := Wp_bow;
  Treasure[49].Chance := 6  ; Treasure[49].Typ := Weapon_t; Treasure[49].Index := Wp_arrows;
  Treasure[50].Chance := 6  ; Treasure[50].Typ := Wand_t; Treasure[50].Index := W_search;
  Treasure[51].Chance := 5  ; Treasure[51].Typ := Potion_t; Treasure[51].Index := P_blind;
  Treasure[52].Chance := 5  ; Treasure[52].Typ := Armor_t; Treasure[52].Index := A_chain;
  Treasure[53].Chance := 5  ; Treasure[53].Typ := Armor_t; Treasure[53].Index := A_banded;
  Treasure[54].Chance := 5  ; Treasure[54].Typ := Armor_t; Treasure[54].Index := A_splint;
  Treasure[55].Chance := 5  ; Treasure[55].Typ := Wand_t; Treasure[55].Index := W_curing;
  Treasure[56].Chance := 4  ; Treasure[56].Typ := Wand_t; Treasure[56].Index := W_poly;
  Treasure[57].Chance := 4  ; Treasure[57].Typ := Wand_t; Treasure[57].Index := W_tele_to;
  Treasure[58].Chance := 4  ; Treasure[58].Typ := Wand_t; Treasure[58].Index := W_tele_away;
  Treasure[59].Chance := 4  ; Treasure[59].Typ := Wand_t; Treasure[59].Index := W_missile;
  Treasure[60].Chance := 4  ; Treasure[60].Typ := Wand_t; Treasure[60].Index := W_nothing;
  Treasure[61].Chance := 4  ; Treasure[61].Typ := Wand_t; Treasure[61].Index := W_slow;
  Treasure[62].Chance := 4  ; Treasure[62].Typ := Wand_t; Treasure[62].Index := W_paralyze;
  Treasure[63].Chance := 4  ; Treasure[63].Typ := Wand_t; Treasure[63].Index := W_haste;
  Treasure[64].Chance := 4  ; Treasure[64].Typ := Weapon_t; Treasure[64].Index := Wp_two_sword;
  Treasure[65].Chance := 3  ; Treasure[65].Typ := Armor_t; Treasure[65].Index := A_plate;
  Treasure[66].Chance := 3  ; Treasure[66].Typ := Potion_t; Treasure[66].Index := P_nothing;
  Treasure[67].Chance := 2  ; Treasure[67].Typ := Potion_t; Treasure[67].Index := P_skill;
  Treasure[68].Chance := 2  ; Treasure[68].Typ := Scroll_t; Treasure[68].Index := S_genocide;
  Treasure[69].Chance := 2  ; Treasure[69].Typ := Wand_t; Treasure[69].Index := W_drain;
  Treasure[70].Chance := 2  ; Treasure[70].Typ := Wand_t; Treasure[70].Index := W_fire;
  Treasure[71].Chance := 2  ; Treasure[71].Typ := Wand_t; Treasure[71].Index := W_lightning;
  Treasure[72].Chance := 2  ; Treasure[72].Typ := Wand_t; Treasure[72].Index := W_cold;
  Treasure[73].Chance := 2  ; Treasure[73].Typ := Wand_t; Treasure[73].Index := W_striking;
  Treasure[74].Chance := 2  ; Treasure[74].Typ := Wand_t; Treasure[74].Index := W_cancel;
  Treasure[75].Chance := 2  ; Treasure[75].Typ := Ring_t; Treasure[75].Index := R_regen;
  Treasure[76].Chance := 2  ; Treasure[76].Typ := Ring_t; Treasure[76].Index := R_digest;
  Treasure[77].Chance := 2  ; Treasure[77].Typ := Ring_t; Treasure[77].Index := R_sustain;
  Treasure[78].Chance := 2  ; Treasure[78].Typ := Ring_t; Treasure[78].Index := R_protect;
  Treasure[79].Chance := 2  ; Treasure[79].Typ := Ring_t; Treasure[79].Index := R_dex;
  Treasure[80].Chance := 2  ; Treasure[80].Typ := Ring_t; Treasure[80].Index := R_str;
  Treasure[81].Chance := 2  ; Treasure[81].Typ := Ring_t; Treasure[81].Index := R_int;
  Treasure[82].Chance := 2  ; Treasure[82].Typ := Ring_t; Treasure[82].Index := R_see_inv;
  Treasure[83].Chance := 2  ; Treasure[83].Typ := Ring_t; Treasure[83].Index := R_teleport;
  Treasure[84].Chance := 2  ; Treasure[84].Typ := Ring_t; Treasure[84].Index := R_stealth;
  Treasure[85].Chance := 2  ; Treasure[85].Typ := Ring_t; Treasure[85].Index := R_aggra;
  Treasure[86].Chance := 2  ; Treasure[86].Typ := Ring_t; Treasure[86].Index := R_search;
  Treasure[87].Chance := 2  ; Treasure[87].Typ := Ring_t; Treasure[87].Index := R_incr_dam;
  Treasure[88].Chance := 2  ; Treasure[88].Typ := Wand_t; Treasure[88].Index := W_alchemy;
  Treasure[89].Chance := 2  ; Treasure[89].Typ := Weapon_t; Treasure[89].Index := Wp_sil_arrows;
  Treasure[90].Chance := 2  ; Treasure[90].Typ := Wand_t; Treasure[90].Index := W_wonder;
  Treasure[91].Chance := 2  ; Treasure[91].Typ := Potion_T; Treasure[91].Index := p_sustenance; (* #54 *)
  Treasure[92].Chance := 1  ; Treasure[92].Typ := Weapon_t; Treasure[92].Index := Wp_sil_sword;
  Treasure[93].Chance := 1  ; Treasure[93].Typ := Ring_t; Treasure[93].Index := R_vampiric;
  Treasure[94].Chance := 1  ; Treasure[94].Typ := Ring_t; Treasure[94].Index := R_invis;
  Treasure[95].Chance := 1  ; Treasure[95].Typ := Wand_t; Treasure[95].Index := W_blunder;
  Treasure[96].Chance := 1  ; Treasure[96].Typ := Ring_t; Treasure[96].Index := R_resur;
  Treasure[97].Chance := 1  ; Treasure[97].Typ := Ring_T; Treasure[97].Index := R_decode; (* #55 *)
End;

			  (* *******************)
			  (* External routines *)
			  (* *******************)

Procedure Setran (Foo:Integer); Extern Fortran;

Function Erstat(var f:file):integer; extern;

Procedure Settty; Extern;

Procedure Trmchk (Prog : Integer); Extern; (* #63,#2 *)

Procedure Restty; Extern;

Function Comand : Char; Extern;

Procedure Rdinit(Var Name,Fruit : Name_String;Var Save_file:Name_String;
		 Var Switches:Switch_record); Extern;

Function Chk_File(Var FName : Name_string) : Boolean; Extern; (* #63 *)

Procedure Interrupts; Extern;

Procedure deInterrupts; Extern;

Procedure Ctrl_t (Var S : Long_String); Extern;	(* #60 *)

Procedure Logini; Extern; (* #49 *)

Procedure Logplayer(Fs : Long_string; Rs : Q_Reason); Extern;

Procedure Save_self (Version,Update,Edit_number : Integer); Extern; (* #50 *)

Function Staffy:Boolean; Extern;

Function NoPlay : Boolean; Extern; (* #47 *)

Procedure Init_Staffy(S : String;
		      Var Bug : Long_String;
		      Files : FName_Rec); Extern; (* #62 *)

Function Rescan (Var R_file_name : Name_string) : Boolean; Extern;

Procedure Getfdb (Filename : Long_string; Var X : Integer); Extern;

Procedure Edelete (Filename : Long_string); Extern;

Procedure Fiddle_fdb (Filename : Long_string); Extern;

Procedure Quit; Extern;

Function Valid (Name:Name_string; Var Num:Integer):Boolean; Extern;

(* #48 make this a function *)
Function Scores (Var List1,List2 : Score_array;
		 Var Person : Score_rec;
		 Ss : Long_string) : Boolean; extern;

Function Isddt:Boolean; Extern;

Procedure Type_version; Extern;	(* #50 *)

Function Game_Check : Boolean; Extern; (* #57 *)

Procedure DCA (Y,X : Integer); Extern; (* #63 all cursor movement *)

Procedure CLL; Extern;

Procedure CLS; Extern;

Procedure BKSP; Extern;

Procedure DNSP; Extern;

	  (* * * * * * * * * * * * *)
	  (* Start of actual code  *)
	  (* * * * * * * * * * * * *)

		(* Screen handling routines *)

Procedure Flush_Input;
Begin
  JSYS(100B;100B) (* CFIBF *)
End;

Procedure Move_to_Player;
Begin
  DCA(Player.Loc.x,Player.loc.y)
End;

Procedure Move_to_Echo;
Begin
  DCA(Echo_Pos_X,Redisp_Y_Orig)
End;

Procedure Clear_echo;
Var
  X : Integer;
Begin
  World.Lines[Redisp_Y_Orig] := True;
  For X := Redisp_X_Orig to Redisp_Max_X Do
    World.Screen[Redisp_Y_Orig,X] := Space
End;

(* #54 Put this In To Read line Of shit from terminal *)
Function Get_Line (Var NewName : Name_String; Var Index : Integer) : Boolean;
Var
  I, Och : Integer;
  Dummy, Ch : Char;
  More,Ok : Boolean;

  Function Are_same_type(Ch1,Ch2 : Char) : Boolean;
  Begin (* Are_same_Type *)
  If (Ch1 In ['a'..'z','A'..'Z']) Then
    Are_same_type := (Ch2 In ['a'..'z','A'..'Z'])
  Else If (Ch1 In ['0'..'9']) Then
    Are_same_type := (Ch2 In ['0'..'9'])
  Else
    Are_same_type := False
  End; (* Are_same_Type *)

Begin (* Get_Line *)
  Ok := True;
  Index := 0;
  Repeat
    Ch := Comand;
    Och := Ord(Ch);
    If (OCh = 177B) Then (* DEL *)
      Begin
	Ch := Chr(10B); (* BS *)
	Och := 10B
      End;
    If (Ch >= ' ') Then
      If (Index < Name_Len) Then
	Begin
	  Index := Index + 1;
	  NewName[Index] := Ch;
	  Write(tty,Ch)
	End
      Else Write(tty,Chr(7B))
    Else
      Case OCh of
	4, (* ^D,^R *)
	18 : Begin
	       For I := 1 to Index do
		 BKSP; (* #63 *)
	       For I := 1 to Index do
		 Write(tty,NewName[I])
	     End;
	8 : If (Index > 0) Then	(* BS *)
	      Begin
		BKSP; (* #63 *)
		Write(tty,' ');
		BKSP;
		Index := Index - 1
	      End;
	21 : Begin
	       For I := 1 to Index Do
		 Begin
		   BKSP; (* #63 *)
		   Write(tty,' ');
		   BKSP
		 End;
	       Index := 0
	     End;
	23 : Begin (* ^W *)
	       More := (Index <> 0);
	       If More Then
		 Dummy := NewName[Index];
	       While More do
		 Begin
		   Index := Index - 1;
		   BKSP; (* #63 *)
		   Write(tty,' ');
		   BKSP;
		   More := (Index <> 0);
		   If More Then
		     If (Dummy = ' ') Then
		       Dummy := NewName[Index]
		     Else
		       More := Are_Same_Type(Dummy,NewName[Index])
		 End
	     End;
	27 : Begin
	       Index := 0;
	       Ok := False
	     End;
	Others : ;
      End
  Until (OCh = 15B) or (Ch = Chr(33B));
  Get_Line := Ok;
  More := True;
  While More Do
    If Index = 0 Then
      More := False
    Else If (Newname[Index] <> ' ') Then
      More := False
    Else
      Index := Index - 1;
  For I := Index + 1 To Name_Len do
    NewName[I] := ' '
End; (* Get_Line *)

(* Waits for the player to type a space before typing out another line
   in the echo area (top line). *)
(* make it function *)
Function Wait_for_space(Any_Char : Boolean) : Boolean;
Var
  Ch : Char;
Begin
  DCA(70,1);
  Write(tty,'--More--');
  If Any_Char Then
    Ch := Comand
  Else
    Repeat
      Ch := Comand
    Until Ch In Wait_Chars;
  Wait_For_Space := (Ch <> Chr(33B)) and (Ch <> Chr(177B)); (* #54 add DEL *)
  DCA(70,1);
  CLL
End;

Function Has_on_ring(Which_ind:Integer):Boolean;
Var
  Hand : Hand_Type;
  Has_One : Boolean;
Begin
  Has_One := False;
  For Hand := Left_H To Right_H Do
    If (Player.Cur_ring[Hand] <> NIL) Then
      If (Player.Cur_Ring[Hand]^.Index = Which_ind) Then
	Has_One := True;
  Has_On_Ring := Has_One
End; (* Has_on_ring *)

	  (* * * * * * * * * * * * *)
	  (* The display routines  *)
	  (* * * * * * * * * * * * *)

	  (*  Some Notes:					      *)
	  (*     World.Seeable is an array of booleans.  Positions In *)
	  (* this array are those that can be seen by the player.     *)
	  (*     World.Seen are those places where the player has     *)
	  (* been, i.e., has mapped.  He can see walls and floors and *)
	  (* objects there, but not monsters.			      *)
	  (*     World.Lines indicates which lines of the screen have *)
	  (* changed for some reason or other.			      *)
	  (*     World.S_World : Map				      *)
	  (*     World.Mon : Monsters/Player			      *)
	  (*     World.Obj : Objects				      *)

	  (* So, to make something mapped, turn on world.seen;	       *)
	  (*     to make something visible to the player, turn on      *)
	  (*         world.seeable				       *)
	  (* In either Case, turn on world.lines if a change is made.  *)
	  (* however, for something to be seeable, its location should *)
	  (* also be seen.					       *)

Function New_Char(X,Y : Integer; Show_Mon : Boolean):Char;

Begin (* New_Char *)
  If (Show_Mon And (World.Mon[X,Y] <> Chr(0))) Then
    If (World.Mon[X,Y] In ['I','p']) Then
      (* It''s an invis. stalker or Phantom Stalker *)
      If ((Player.Invis_Count > 0) or (Has_On_Ring (r_see_inv))) Then
	(* for some reason they may see invisible things *)
	New_Char := World.Mon[X,Y]
	(* They mayn''t see it so handle normally *)
      Else If (World.Obj[X,Y] <> Chr(0)) Then
	New_Char := World.Obj[X,Y]
      Else
	New_Char := World.S_World[X,Y]
    Else
      New_Char := World.Mon[X,Y]
  Else If (World.Obj[X,Y] <> Chr(0)) Then
    New_Char := World.Obj[X,Y]
  Else
    New_Char := World.S_World[X,Y]
End; (* New_Char *)

Procedure Redisplay;
Var
  X,Y,CX,CY,Wid : Integer;

  Procedure Get_There;
  Var
    I,J : Integer;
  Begin (* Get_There *)
    If (Y < CY) Then
      DCA(X,Y)
    Else If (Y > CY + 1) Then
      DCA(X,Y)
    Else
      Begin
	I := X - CX;
	If (I < -4) Then
	  DCA(X,Y)
	Else If (I > 4) Then
	  DCA(X,Y)
	Else
	  Begin
	    If (Y = CY + 1) Then
	      DNSP; (* #63 down 1 space *)
	    If (I < 0) Then
	      For J := I to -1 Do
		BKSP (* #63 back 1 space *)
	    Else If (I > 0) Then
	      Begin
		I := Y;
		For J := CX to X - 1 Do
		  JSYS(74B;World.Screen[I,J]) (* PBOUT *)
	      End
	  End
      End;
    CY := Y;
    CX := X + 1
  End; (* Get_There *)

Begin (* Redisplay *)
  CX := 100; (* Force the next move to be DCA *)
  CY := 100;
  For Y := Redisp_Y_Orig to Redisp_Max_Y Do
    Begin
      If World.Lines[Y] Then
	Begin
	  World.Screen[Y,Real_X_Orig] := Chr(0);
	  Wid := Redisp_Max_X;
	  While (World.Screen[Y,Wid] = Space) Do
	    Wid := Wid - 1;
	  World.Screen[Y,Real_X_Orig] := Space;
	  X := Redisp_X_Orig;
	  While (X <= Redisp_Max_X) Do
	    Begin
	      If (World.Screen[Y,X] <> World.This_Screen[Y,X]) Then
		Begin
		  If (X > Wid) Then
		    Begin
		      X := Wid + 1;
		      Get_There;
		      CX := CX - 1; (* because we didn't Write a char *)
		      CLL;
		      World.This_Screen[Y,X] := World.Screen[Y,X];
		      While (X < Redisp_Max_X) Do
			Begin
			  X := X + 1;
			  If (World.Screen[Y,X] <> World.This_Screen[Y,X]) Then
			    World.This_Screen[Y,X] := World.Screen[Y,X];
			End
		    End
		  Else
		    Begin
		      Get_There;
		      JSYS(74B;World.Screen[Y,X]); (* #60 PBOUT *)
		      World.This_Screen[Y,X] := World.Screen[Y,X]
		    End;
		End;
	      X := X + 1
	    End;
	  World.Lines[Y] := False
	End
    End;
  X := Player.Loc.X;
  Y := Player.Loc.Y;
  Get_There
End; (* Redisplay *)

Procedure Gen_Screen;
Var
  I,J : Integer;
Begin (* Gen_Screen *)
  For j := Y_Orig to S_Max_Y do
    If World.Lines[j] Then
      For i := X_Orig to S_Max_X do
	If (Player.Blind_Count > 0) Then
	  World.Screen[j,i] := ' '
	Else If (World.Seeable[i,j]) Then
	  (* Monsters may be seen in this case (Within sight) *)
	  World.Screen[j,i] := New_Char(i,j,True)
	Else If (World.Seen[i,j]) Then
	(* But may not be seen in this case (in a place that has been seen) *)
	  World.Screen[j,i] := New_Char(i,j,False)
	Else
	  (* NOTHING may be seen in this case *)
	  World.Screen[j,i] := ' '
End; (* Gen_Screen *)

Procedure Show_Stats;
Var
  I : Integer;
Begin (* Show_Stats *)
  With Player do
    Begin
      If (Level >= 5) And (S_top In Change_stats) Then
	Begin
	  World.Lines[23] := True;
	  For I := 1 to 80 Do
	    S[I] := ' ';
	  StrWrite(F,S);
	  Write(F,'St: ',St:0,'(',Max_ST:0,') Dex: ',Dx:0,'(',
		Max_DX:0,') Int: ',IQ:0,'(',Max_IQ:0,')');
	  For I := Redisp_X_Orig to Redisp_Max_X Do
	    World.Screen[23,I] := S[I]
	End;
      If S_bottom In Change_stats Then
	Begin
	  World.Lines[24] := True;
	  For I := 1 to 80 Do
	    S[I] := ' ';
	  StrWrite(F,S);
	  Write(F,'Gold: ',Gold:0,' Level: ',World.Level:0,' Xp:',Level:0,
		'/',XP:0,' Ac: ',ac:0,' Hp: ',Hp:0,'(',Max_HP:0,')');
	  If Player.Last_Meal >= Fainting_Meal then
	    Write(F,' Fainting')
	  Else If Player.Last_Meal >= Weak_Meal then
	    Write(F,' Weak')
	  Else If Player.Last_Meal >= Hungry_Meal then
	    Write(F,' Hungry');
	  For I := Redisp_X_Orig to Redisp_Max_X Do
	    World.Screen[24,I] := S[I]
	End
    End;
  Change_stats := []
End; (* Show_Stats *)

Procedure Update_screen;
Begin (* Update_screen *)
  If (Not (Valid_Command and Switches.Jump_Swi)) Then
    Begin
      Gen_Screen; (* Build the new screen setting the Lines and Show flags *)
      Show_Stats;
      Redisplay
    End
End; (* Update_screen *)

Procedure Echo_Init; (* #63 *)
Begin (* Echo_Init *)
  S := Spaces;
  StrWrite(F,S)
End; (* Echo_Init *)

(* Procedure to echo a line on the top of the screen *)
(* The procedure should NOT change the value of string S *)
(* Many changes, including ring buffer of last 5 echoes *)
Procedure Echo(S : Packed Array[Low..High:Integer] Of Char);
Var
  I,J : Integer;
  More,Save_Valid : Boolean;
Begin (* Echo *)
  If Not Empty_echo Then
    More := Not Wait_for_space(False);
  Empty_echo := False;
  If (S[Low] <> Space) Then
    Begin
      I := Low;
      J := 1; (* #54 *)
      More := True;
      While More Do
	If (I > High) Then
	  More := False
	Else
	  Begin
	    Last_echo[Echo_point,J] := S[I]; (* #50,#54 *)
	    I := I + 1;
	    J := J + 1 (* #54 *)
	  End;
      For I := J To Redisp_Max_X Do
	Last_echo[Echo_point,I] := Space; (* #50,#54 *)
      For I := Redisp_X_Orig to Redisp_Max_X Do
	World.Screen[1,I] := Last_Echo[Echo_Point,I];
      J := Redisp_Max_X - 1;
      While (World.Screen[1,J] = Space) Do
	J := J - 1;
      Echo_Pos_X := J + 2;
      Echo_index := Echo_point;	(* #50 *)
      Echo_point := (Echo_point + 4) Mod 5; (* #50 make it go backwards *)
    End
  Else
    Begin
      For I := Redisp_X_Orig to Redisp_Max_X Do
	World.Screen[1,I] := Last_Echo[Echo_Index,I];
      Echo_index := (Echo_index + 1) Mod 5
    End;
  World.Lines[1] := True;
  Save_Valid := Valid_Command; (* #60 *)
  Valid_Command := False;
  Update_Screen;
  Valid_Command := Save_Valid
End; (* Echo *)

Procedure Scr_Text(Y : Integer; S : Packed Array[Low..High:Integer] Of Char);
Var
  I,J : Integer;
  More : Boolean;
  Line : Long_String;
Begin (* Scr_Text *)
  I := Low;
  J := 1; (* #54 *)
  More := True;
  While More Do
    If (I > High) Then
      More := False
    Else
      Begin
	Line[J] := S[I];
	I := I + 1;
	J := J + 1
      End;
  For I := J To Redisp_Max_X Do
    Line[I] := Space;
  For I := Redisp_X_Orig to Redisp_Max_X Do
    World.Screen[Y,I] := Line[I];
  World.Lines[Y] := True
End; (* Scr_Text *)

(* This turns on/off the lights In a lit room. *)
Procedure Draw_Room (Room : Integer; Lights_On : Boolean);
Var
  i,j : Integer;
Begin (* Draw_Room *)
  If (Room = 0) Then
    Echo('Error!! Draw_Room called With Room = 0!')
  Else
    Begin
      With World.Rooms[Room] Do
	Begin
	  If Not Light Then
	    Echo('Error!! Draw_Room called With Dark room!')
	  Else
	    Begin
	      If (Not Seen) and Lights_On Then
		Begin
		  For J := Abs_Y To (Abs_Y + Max_Y + 1) Do
		    For I := Abs_X To (Abs_X + Max_X + 1) Do
		      World.Seen[i,j] := True;
		  Seen := True
		End;
	      For j := Abs_Y to (Abs_Y + Max_Y + 1) do
		Begin
		  World.Lines[j] := True;
		  For i := Abs_X to (Abs_X + Max_X + 1) do
		    World.Seeable[i,j] := (Lights_On or
					   ((Player.SeeMon_Count > 0) and
					    (World.Mon[i,j] <> Chr(0))))
		End
	    End
	End
    End
End; (* Draw_Room *)

(* D_Hallway used While moving from hallway To hallway *)
Procedure D_Hallway;
Var
  X_Dif,Y_Dif,
  I,J,T,U,V : Integer;
Begin (* D_Hallway *)
  X_Dif := Player.Loc.X - Player.Prev.X;
  Y_Dif := Player.Loc.Y - Player.Prev.Y;
  If ((abs(x_dif) > 1) or (abs(y_dif) > 1)) Then
    Echo('You shouldn''t have called this procedure with this location.')
  Else
    Begin
      If (X_dif <> 0) Then
	Begin
	  T := Player.Prev.X - X_dif;
	  U := Player.Loc.X + X_Dif;
	  For J := -1 To 1 Do
	    Begin
	      V := Player.Prev.Y + J;
	      World.Lines[V] := True;
	      World.Seeable[T,V] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,V] <> Chr(0)));
	      V := Player.Loc.Y + J;
	      World.Seen[U,V] := ((World.S_World[U,V] In ['#','+'])
				  or (World.Seen[U,V]));
	      World.Seeable[U,V] := World.Seen[U,V];
	      World.Lines[V] := True
	    End
	End;
      If (Y_dif <> 0) Then
	Begin
	  T := Player.Prev.Y - Y_dif;
	  U := Player.Loc.Y + Y_Dif;
	  World.Lines[Player.Prev.Y] := True;
	  World.Lines[Player.Loc.Y] := True;
	  World.Lines[T] := True;
	  World.Lines[U] := True;
	  For I := -1 To 1 Do
	    Begin
	      V := Player.Prev.X + I;
	      World.Seeable[V,T] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[V,T] <> Chr(0)));
	      V := Player.Loc.X + I;
	      World.Seen[V,U] := ((World.S_World[V,U] In ['#','+'])
				  or (World.Seen[V,U]));
	      World.Seeable[V,U] := World.Seen[V,U]
	    End
	End
    End
End; (* D_Hallway *)

(* D_Dark_Room is used While stepping within a dark room *)
Procedure D_Dark_Room;
Var
  X_Dif,Y_Dif, I,J,T,U,V : Integer;
Begin (* D_Dark_Room *)
  X_Dif := Player.Loc.X - Player.Prev.X;
  Y_Dif := Player.Loc.Y - Player.Prev.Y;
  If ((abs(x_dif) > 1) or (abs(y_dif) > 1)) Then
    Echo('You shouldn''t have called this procedure with this location.')
  Else
    Begin
      If (X_dif <> 0) Then
	Begin
	  T := Player.Prev.X - X_dif;
	  U := Player.Loc.X + X_Dif;
	  For J := -1 To 1 Do
	    Begin
	      V := Player.Prev.Y + J;
	      World.Lines[V] := True;
	      World.Seeable[T,V] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,V] <> Chr(0)));
	      World.Seen[T,V] := ((World.S_World[T,V] <> '.')
				  or (World.Obj[T,V] <> Chr(0)));
	      V := Player.Loc.Y + J;
	      World.Seen[U,V] := True;
	      World.Seeable[U,V] := True;
	      World.Lines[V] := True
	    End
	End;
      If (Y_dif <> 0) Then
	Begin
	  T := Player.Prev.Y - Y_dif;
	  U := Player.Loc.Y + Y_Dif;
	  World.Lines[Player.Prev.Y] := True;
	  World.Lines[Player.Loc.Y] := True;
	  World.Lines[T] := True;
	  World.Lines[U] := True;
	  For I := -1 To 1 Do
	    Begin
	      V := Player.Prev.X + I;
	      World.Seeable[V,T] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[V,T] <> Chr(0)));
	      World.Seen[V,T] := ((World.S_World[V,T] <> '.')
				  or (World.Obj[V,T] <> Chr(0)));
	      V := Player.Loc.X + I;
	      World.Seen[V,U] := True;
	      World.Seeable[V,U] := True
	    End
	End
    End
End; (* D_Dark_Room *)

Procedure D_Lit_Room;
Begin (* D_Lit_Room *)
  World.Lines[Player.Prev.Y] := True;
  World.Lines[Player.Loc.Y] := True
End; (* D_Lit_Room *)

(* Used when stepping from a doorway into the hallway *)
Procedure D_Out_Door;
Var
  Oroom, T, U, I, J : Integer;
Begin (* D_Out_Door *)
  Oroom := World.Room_Array[Player.Prev.X,Player.Prev.Y];
  If World.Rooms[ORoom].Light Then
    Draw_Room(Oroom,False) (* Turn off the lights *)
  Else
    Begin (* was In dark room *)
      For J := -1 To 1 Do
	Begin
	  U := Player.Prev.Y + J;
	  World.Lines[U] := True;
	  For I := -1 To 1 Do
	    Begin
	      T := Player.Prev.X + I;
	      World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,U] <> Chr(0)));
	      World.Seen[T,U] := ((World.S_World[T,U] <> '.')
				  or (World.Obj[T,U] <> Chr(0)))
	    End
	End
    End;
  For J := -1 To 1 Do
    Begin
      U := Player.Loc.Y + J;
      World.Lines[U] := True;
      For I := -1 To 1 Do
	Begin
	  T := Player.Loc.X + I;
	  World.Seen[T,U] := ((World.S_World[T,U] In ['#','+'])
			      or (World.Seen[T,U]));
	  World.Seeable[T,U] := World.Seen[T,U]
	End
    End
End; (* D_Out_Door *)

(* Used when stepping from hallway onto the doorway *)
Procedure D_In_Door;
Var
  Room, X_Dif, Y_Dif, T, U, I, J : Integer;
Begin (* D_In_Door *)
  X_Dif := Player.Loc.X - Player.Prev.X;
  Y_Dif := Player.Loc.Y - Player.Prev.Y;
  If (X_dif <> 0) Then
    Begin
      T := Player.Prev.X - X_dif;
      For J := -1 To 1 Do
	Begin
	  U := Player.Prev.Y + J;
	  World.Lines[U] := True;
	  World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				 (World.Mon[T,U] <> Chr(0)));
	End
    End;
  If (Y_dif <> 0) Then
    Begin
      U := Player.Prev.Y - Y_dif;
      World.Lines[U] := True;
      World.Lines[Player.Prev.Y] := True;
      For I := -1 To 1 Do
	Begin
	  T := Player.Prev.X + I;
	  World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				 (World.Mon[T,U] <> Chr(0)));
	End
    End;
  Room := World.Room_Array[Player.Loc.X,Player.Loc.Y];
  If World.Rooms[Room].Light Then
    Draw_Room(Room,True) (* Turn on the lights *)
  Else
    For J := -1 To 1 Do
      Begin
	U := Player.Loc.Y + J;
	World.Lines[U] := True;
	For I := -1 To 1 Do
	  Begin
	    T := Player.Loc.X + I;
	    World.Seen[T,U] := True;
	    World.Seeable[T,U] := True
	  End
      End
End; (* D_In_Door *)

(* used when stepping from the room proper onto the doorway *)
Procedure D_On_Door;
Var
  Room, X_Dif, Y_Dif, T, U, I, J : Integer;
Begin (* D_On_Door *)
  Room := World.Room_Array[Player.Prev.X,Player.Prev.Y];
  If Not World.Rooms[Room].Light Then
    Begin
      X_Dif := Player.Loc.X - Player.Prev.X;
      Y_Dif := Player.Loc.Y - Player.Prev.Y;
      If (X_dif <> 0) Then
	Begin
	  T := Player.Prev.X - X_dif;
	  For J := -1 To 1 Do
	    Begin
	      U := Player.Prev.Y + J;
	      World.Lines[U] := True;
	      World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,U] <> Chr(0)));
	      World.Seen[T,U] := ((World.S_World[T,U] <> '.')
				  or (World.Obj[T,U] <> Chr(0)))
	    End
	End;
      If (Y_dif <> 0) Then
	Begin
	  U := Player.Prev.Y - Y_dif;
	  World.Lines[U] := True;
	  World.Lines[Player.Prev.Y] := True;
	  For I := -1 To 1 Do
	    Begin
	      T := Player.Prev.X + I;
	      World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,U] <> Chr(0)));
	      World.Seen[T,U] := ((World.S_World[T,U] <> '.')
				  or (World.Obj[T,U] <> Chr(0)))
	    End
	End;
    End;
  For J := -1 To 1 Do
    Begin
      U := Player.Loc.Y + J;
      World.Lines[U] := True;
      For I := -1 To 1 Do
	Begin
	  T := Player.Loc.X + I;
	  World.Seen[T,U] := ((World.S_World[T,U] In ['#','+'])
			      or (World.Seen[T,U]));
	  World.Seeable[T,U] := True (* #56 *)
	End
    End
End; (* D_On_Door *)

(* Used when stepping from a doorway into the room proper *)
Procedure D_Off_Door;
Var
  Room, T, U, I, J : Integer;
Begin (* D_Off_Door *)
  For J := -1 To 1 Do
    Begin
      U := Player.Prev.Y + J;
      World.Lines[U] := True;
      For I := -1 To 1 Do
	Begin
	  T := Player.Prev.X + I;
	  Room := World.Room_Array[T,U];
	  If (Room = 0) Then
	    World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				   (World.Mon[T,U] <> Chr(0)))
	  Else If Not World.Rooms[Room].Light Then
	    Begin
	      World.Seeable[T,U] := ((Player.SeeMon_Count > 0) and
				     (World.Mon[T,U] <> Chr(0)));
	      World.Seen[T,U] := ((World.S_World[T,U] <> '.')
				  or (World.Obj[T,U] <> Chr(0)))
	    End
	End
    End;
  Room := World.Room_Array[Player.Loc.X,PLayer.Loc.Y];
  If Not World.Rooms[Room].Light Then
    For J := -1 To 1 Do
      Begin
	U := Player.Loc.Y + J;
	World.Lines[U] := True;
	For I := -1 To 1 Do
	  Begin
	    T := Player.Loc.X + I;
	    If (World.Room_Array[T,U] <> 0) Then
	      Begin
		World.Seen[T,U] := True;
		World.Seeable[T,U] := True
	      End
	  End
      End
End; (* D_Off_Door *)

Procedure Player_Disappears;
Var
  Dark : Boolean;
  Room,
  T, U,
  I, J : Integer;
Begin (* Player_Disappears *)
  Room := World.Room_Array[Player.Prev.X,Player.Prev.Y];
  Dark := True;
  If (Room <> 0) Then
    If World.Rooms[Room].Light Then
      Begin
	Draw_Room(Room,False);
	Dark := False;
      End;
  For J := -1 To 1 Do
    Begin
      T := PLayer.Prev.Y + J;
      World.Lines[T] := True;
      For I := -1 To 1 Do
	Begin
	  U := Player.Prev.X + I;
	  World.Seeable[U,T] := ((Player.SeeMon_Count > 0) and
				 (World.Mon[U,T] <> Chr(0)));
	  If Dark Then
	    World.Seen[U,T] := (Not (World.S_World[U,T] In [' ','.'])
				or (World.Obj[U,T] <> Chr(0)))
	End
    End
End; (* Player_Disappears *)

Procedure Player_Appears;
Var
  Room,PRoom,
  I, J, T, U : Integer;
Begin (* Player_Appears *)
  PRoom := World.Room_Array[Player.Loc.X,Player.Loc.Y];
  If (PRoom <> 0) Then
    If World.Rooms[PRoom].Light Then
      Draw_Room(PRoom,True); (* Turn on the lights *)
  For J := -1 To 1 Do
    Begin
      T := PLayer.Loc.Y + J;
      World.Lines[T] := True;
      For I := -1 To 1 Do
	Begin
	  U := Player.Loc.X + I;
	  Room := World.Room_Array[U,T];
	  If (Room <> 0) Then
	    If (World.S_World[U,T] In ['-','|']) Then
	      World.Seen[U,T] := (World.Seen[U,T] or (Proom <> 0))
	    Else
	      Begin
		World.Seen[U,T] := (World.S_World[U,T] <> ' ');
		World.Seeable[U,T] := World.Seen[U,T]
	      End
	  Else
	    Begin
	      World.Seen[U,T] := (World.S_World[U,T] = '#');
	      World.Seeable[U,T] := World.Seen[U,T]
	    End
	End
    End
End; (* Player_Appears *)

Procedure Player_Jumps;
Begin (* Player_Jumps *)
  Player_Disappears;
  Player_Appears
End; (* Player_Jumps *)

Procedure New_Place_Player;
Begin (* New_Place_Player *)
  Player.Prev := Player.Loc
End; (* New_Place_Player *)

Procedure Player_Takes_Step;
Var
  Room,ORoom : Integer;
Begin (* Player_Takes_Step *)
  ORoom := World.Room_Array[Player.Prev.X,PLayer.Prev.Y];
  Room := World.Room_Array[Player.Loc.X,Player.Loc.Y];

  If (Room = 0) Then
    If (Oroom = 0) Then
      D_Hallway (* still In hallway *)
    Else D_Out_Door (* stepped from a room into hall *)
  Else If (Oroom = 0) Then
    D_In_Door (* stepped from hall into doorway *)
  Else
    Begin
      If (World.S_World[Player.Loc.X,Player.Loc.Y] = '+') Then
	Begin
	  If (World.S_World[Player.Prev.X,Player.Prev.Y] = '+') Then
	    D_Off_Door;
	  D_On_Door (* stepped from room onto doorway *)
	End
      Else If (World.S_World[Player.Prev.X,Player.Prev.Y] = '+') Then
	D_Off_Door (* stepped from doorway into room proper *)
      Else
	If World.Rooms[Room].Light Then
	  D_Lit_Room
	Else D_Dark_Room
    End
End; (* Player_Takes_Step *)

Procedure Restore_screen;
Var I,J : Integer;
Begin
  Cls;
  Change_stats := [s_top,s_bottom];
  For j := Real_Y_Orig to Real_Max_Y do
    Begin
      World.Lines[j] := True;
      For i := Real_X_Orig to Real_Max_X do
	World.This_Screen[j,i] := ' ';
    End;
  New_Place_Player;
  UpDate_Screen
End;

Procedure Null_end_name (Name1 : Name_string; Var Name2 : Name_string);
Var
  I:Integer;
Begin
  Name2 := Name1;
  I := Name_Len;
  While (I >= 1) and (Name1[I] = ' ') Do
    Begin
      Name2[I] := Chr(0);
      I := I-1
    End
End;

Procedure Upcase(Name1:Name_string; Var Name2:Name_string);
Var I:Integer;
Begin
  For I := 1 To Name_Len Do
    If (Name1[I] >= 'a') And (Name1[I] <= 'z') Then
      Name2[I] := Chr(Ord(Name1[I]) - 40B)
    Else Name2[I] := Name1[I]
End;

Procedure Fix_String (Var S : Packed Array[Low..High:Integer] of Char);
Var
  I,J : Integer;
  More : Boolean;
Begin (* Fix_String *)
  More := True;
  I := Low;
  While More Do
    If I > High Then
      More := False
    Else If S[I] = Chr(0) Then
      More := False
    Else I := I + 1;
  For J := I To High Do
    S[J] := ' '
End; (* Fix_String *)

Function Name_check : Boolean;
Var
  Found,U,Name_Same : Boolean;
  Usernum,Cmp : Integer;
  Uname,Cname : Name_string;
  This : Name_Rec;
  Entry,List : Nam_ptr;
Begin
  Null_end_name(Player.name,Uname);
  Found := False;
  JSYS(13B;;Cmp); (* GJINF *)
  If Valid(Uname,Usernum) Then
    If (Usernum <> Cmp) Then
      Found := True;
  If Not Found Then
    Begin
      Found := False;
      U := True;
      New(List);
      Entry := List;
      List^.Num := Cmp;
      List^.Next := NIL;
      List^.Nam := Player.Name;
      Name_Same := False;
      Reset(Nm,Files.Names^,'/D/F/O',0,0,[29]);
      While U Do
	If EOF(Nm) Then
	  U := False
        Else
	  Begin
	    This := Nm^;
	    Get(Nm);
	    If (This.Num = List^.Num) Then
	      Begin
		If This.Nam = List^.Nam Then
		  Begin
		    U := False;
		    Found := False;
		    Name_Same := True
		  End
	      End
	    Else
	      Begin
		Null_end_name(This.Nam,Cname);
		JSYS(540B;-1:Cname,-1:UName;Cmp); (* STCMP *)
		If (Cmp = 0) Then
		  Begin
		    Found := True;
		    U := False
		  End
		Else
		  Begin
		    New(Entry^.Next);
		    Entry := Entry^.Next;
		    Entry^ := This;
		    Entry^.Next := NIL;
		  End
	      End
	  End;
      Close(Nm);
      If (Found or Name_Same) Then
	Begin
	  Entry := List;
	  While Entry <> NIL Do
	    Begin
	      List := Entry;
	      Entry := Entry^.Next;
	      Dispose(List)
	    End
	End
      Else
	Begin
	  Cmp := 0;
	  Loop
	    Rewrite(Nm,Files.Names^,'/D/F/O',0,0,[29]);
	    Exit If (Erstat(Nm) = 0) or (Cmp = 60);
	    If (Cmp = 0) Then
	      Begin
		DCA(70,1);
		Write(tty,'Wait...')
	      End;
	    Cmp := Cmp + 1;
	    JSYS(167B;1000) (* DISMS 1 sec *)
	  End;
	  If (Cmp > 0) Then
	    Begin
	      DCA(70,1);
	      CLL;
	      If (Cmp = 60) Then
		ReWrite(Nm,'NUL:')
	    End;
	  Entry := List;
	  While Entry <> NIL Do
	    Begin
	      List := Entry;
	      Entry := Entry^.Next;
	      Nm^ := List^;
	      Put(Nm);
	      Dispose(List)
	    End;
	  Close(Nm)
	End
    End;
  Name_Check := Not Found
End; (* Name_check *)

Procedure Write_killer(Var Fp : Text; Killer : Char);
Var
  Mon_num : Integer;
Begin (* Write_killer *)
  If Killer = ' ' Then
    Write(fp,' Quit')
  Else If killer = '$' Then
    Write(fp,' A Winner!')
  Else If killer = ')' Then
    Write(fp,' Killed by an arrow')
  Else If killer = '=' Then
    Write(Fp,' Killed by magic')
  Else If killer = 'j' Then
    write(Fp,' Killed by Juiblex')
  Else
    Begin
      If killer >= 'a' Then
	Mon_num := Ord(killer) - Mon_hi_offset
      Else
	Mon_num := Ord(killer) - Mon_lo_offset;
      With Monster[Mon_num] Do
	If (Long_Name[1] in ['a','e','h','i','o','u']) Then
	  Write(Fp,' Killed by an ',Long_name:Len)
	Else
	  Write(Fp,' Killed by a ',Long_name:Len)
    End
End; (* Write_killer *)

Function Personal_scores : Integer;
Var
  I,J : Integer;
  Found : Boolean;
  Personal : Personals;
  Today : Packed Array[1..9] Of Char;
Begin (* Personal_scores *)
  For I := 1 To 10 Do
    Begin
      Personal[I].Score := 0;
      Personal[I].Rest := Nulls;
    End;
  I := 1;
  Reset(F,'Rogue.Scores','/D/F/O'); (* suppress OPENF, data, format errors *)
  While (Not Eof(F)) and (I <= 10) Do
    Begin
      Read(F,Personal[I].Score);
      If Eof(F) Then (* This will be true if the read failed *)
	Writeln(tty,'?ROGUE: Bad format in personal score file.')
      Else
	Readln(F,Personal[I].Rest);
      I := I + 1
    End;
  Close(F);
  I := 1;
  Found := False;
  Personal_scores := 0;
  While (I <= 10) and (Not Found) Do
    If Player.Gold > Personal[I].Score Then
      Found := True
    Else
      I := I + 1;
  If Found Then
    Begin
      Personal_scores := I;
      For J := 10 Downto I+1 Do
	Begin
	  Personal[J].Score := Personal[J-1].Score;
	  Personal[J].Rest := Personal[J-1].Rest;
	End;
      Personal[I].Score := Player.Gold;
      Strwrite(F,Personal[I].Rest);
      Today := Date;
      Write(F,' ',Player.Name:25,' ',Today:9,' ');
      Write_killer(F,Killer);
      Write(F,' (',World.Level:0,')',' ':72);
      Rewrite(F,'Rogue.Scores','/D/F/O');
      If (Erstat(F) = 0) Then
	Begin
	  For I := 1 To 10 Do
	    If Personal[I].Score > 0 Then
	      Writeln(F,Personal[I].Score:5,Personal[I].Rest:72);
	  Close(F)
	End
    End
End; (* Personal_scores *)

Procedure Lose_Old_world;
Var
  T : Obj_ptr;
  M : Mon_ptr;
  R : Trap_ptr;
Begin (* Lose_old_world *)
  While (World.Traps <> NIL) Do (* Rid the world of traps, *)
    Begin
      R := World.Traps;
      World.Traps := World.Traps^.Next;
      Dispose(R)
    End;
  While (World.Objs <> NIL) Do (* of objects, *)
    Begin
      T := World.Objs;
      World.Objs := World.Objs^.Next;
      Dispose(T)
    End;
  While (World.Monsters <> NIL) Do (* and of monsters. *)
    Begin
      M := World.Monsters;
      World.Monsters := World.Monsters^.Next;
      Dispose(M)
    End
End; (* Lose_old_world *)

Function Get_Names : Nam_ptr; (* #63 *)
Var
  More : Boolean;
  This_un : Name_Rec;
  Names,Entry : Nam_ptr;
Begin (* Get_names *)
  Lose_old_world; (* #6 Put it back in, maybe monster cleanup fixed it. *)
(* #5 I don't know why this is dying, but somehow the object list is *)
(*    getting fucked up, so Lose_Old_World dies in the Object Dispose *)
(*    loop.  I guess it's not exactly important to clean this stuff up *)
(*    so we'll just skip it fornaio. *)
  Names := NIL;
  Reset(Nm,Files.Names^,'/I/D/F/O',0,0,[29]);
  More := True;
  While More Do
    If EOF(Nm) Then
      More := False
    Else
      Begin
	Get(Nm);
	This_Un.Num := Nm^.Num;
	This_Un.Nam := Nm^.Nam;
	If (Names = NIL) Then
	  Begin
	    New(Names);
	    Entry := Names
	  End
	Else
	  Begin
	    New(Entry^.Next);
	    Entry := Entry^.Next
	  End;
	Entry^ := This_un;
	Entry^.Next := NIL
      End;
  Close(Nm);
  Get_Names := Names
End; (* Get_names *)

Procedure Write_name (Names : Nam_ptr; Usernum : Integer); (* #63 *)
Var
  More : Boolean;
  Name : Long_string;
  Entry : Nam_ptr;
Begin (* Write_name *)
  More := True;
  Entry := Names;
  While More Do
    If (Entry = NIL) Then
      More := False
    Else
      If (Entry^.Num = Usernum) Then
      More := False
    Else
      Entry := Entry^.Next;
  If (Entry = NIL) Then
    Begin
      JSYS(41B,1;-1:Name,Usernum); (* DIRST *)
      Fix_String(Name);
      Write(tty,Name:25)
    End
  Else
    Write(tty,Entry^.Nam:25)
End; (* Write_name *)

Procedure Show_scores (Score, Level : Integer;
		       Killer : Char;
		       Show_em : Boolean);
Var
  This_guy : Score_rec;
  I,Personal_rank : Integer;
  Ch : Char;
  Names,Entry : Nam_ptr;
  All_time,Weekly : Score_array;
Begin (* Show_Scores *)
  If Isddt Then
    Writeln(tty)
  Else
    Begin
      Names := NIL;
      JSYS(13B;;This_guy.User);	(* GJINF *)
      This_guy.Score := Score;
      This_guy.Level := Level;
      This_guy.Day := '     ';
      This_guy.Killer := Killer;
      If Not Scores(All_time,Weekly,This_guy,Files.Score^) Then
	Show_em := False; (* #48 *)
      Deinterrupts;
      If Show_em Then
	Begin
	  Names := Get_names; (* #63 *)
	  Writeln(tty,'Weekly high scores:');
	  For I := 1 To 41 Do Write(Tty,'-'); Writeln(Tty);
	  For I := 1 To 10 Do
	    With Weekly[I] Do
	      If Score > 0 Then
		Begin
		  Write(tty,I:2,'. ',Score:5,' ');
		  Write_name(Names,User); (* #63 *)
		  Write(tty,' ',Day:5);
		  Write_killer(tty,Killer);
		  Writeln(tty,' (',Level:0,')');
		End;
	  Write(tty,'[Press space to continue, delete to stop]'); (* #2 *)
	  Show_em := (Comand <> Chr(177B)); (* #50 *)
	End;
      If Show_em Then
	Begin
	  Cls;
	  Writeln(tty,'All-time high scores:');
	  For I := 1 To 41 Do Write(tty,'-'); Writeln(tty);
	  For I := 1 To 10 Do
	    With All_time[I] Do
	      If Score > 0 Then
		Begin
		  Write(tty,I:2,'. ',Score:5,' ');
		  Write_name(Names,User); (* #63 *)
		  Write(tty,' ',Day:5);
		  Write_killer(tty,Killer);
		  Writeln(tty,' (',Level:0,')')
		End
	End (* If Show_Em *)
      Else
	Writeln(tty);
      While (Names <> NIL) Do (* #63 *)
	Begin
	  Entry := Names;
	  Names := Names^.Next;
	  Dispose(Entry)
	End;
      Personal_rank := Personal_scores;
      If (Personal_rank > 0) Then
	Begin
	  Writeln(tty);
	  Writeln(tty,'This game is #',personal_rank:0,' on your personal best-game list.');
	End
    End
End; (* Show_Scores *)

Function Die (Limit : Integer) : Integer;
Var
  Sum : real;
Begin (* Die *)
(*  Die := Trunc(Random(Seed)*Limit) + 1;
  Seed := (24281 * seed + 99991) mod 199021;
  foo := seed / 199021;
  die := trunc(foo * limit) + 1;*)
  Sum := Rnds[Rnd_j] + Rnds[Rnd_k]; (* #63 *)
  If Sum > 1.0 Then
    Sum := Sum - 1.0;
  Rnds[Rnd_k] := Sum;
  Rnd_j := Rnd_j - 1;
  If Rnd_j = 0 Then
    Rnd_j := 55;
  Rnd_k := Rnd_k - 1;
  If Rnd_k = 0 Then
    Rnd_k := 55;
  Die := Trunc(Sum * Limit) + 1
End; (* Die *)

Function Max (i,j : Integer):Integer;
Begin (* Max *)
  If (I > J) Then
    Max := I
  Else Max := J;
End; (* Max *)

Function Min(i,j : Integer):Integer;

Begin (* Min *)
  If (I < J) Then
    Min := i
  Else Min := j;
End; (* Min *)

Function Two_to_the(A:Integer):Integer;
Var X,I:Integer;
Begin
  X := 1;
  For I := 1 To A Do
    X := X*2;
  Two_to_the := X;
End;

Function Sign(i : Integer):Integer;
Begin
  If (I > 0) Then
    Sign := 1
  Else If  (I < 0) Then
    Sign := -1
  Else Sign := 0;
End;

Procedure FUL;
var room:integer;
Begin (* FUL *)

(* these next two sets of array assignments should be in an initprocedure,
   but this will have to do until it's determined why their values get
   changed.  *)

  Orig_X[1] := 1;  Orig_X[2] := 27;  Orig_X[3] := 53;
  Orig_X[4] := 1;  Orig_X[5] := 27;  Orig_X[6] := 53;
  Orig_X[7] := 1;  Orig_X[8] := 27;  Orig_X[9] := 53;

  Orig_Y[1] := 2;  Orig_Y[2] := 2;   Orig_Y[3] := 2;
  Orig_Y[4] := 9;  Orig_Y[5] := 9;   Orig_Y[6] := 9;
  Orig_Y[7] := 16; Orig_Y[8] := 16;  Orig_Y[9] := 16;
  For Room := 1 to Max_room Do
    Begin
      World.Rooms[Room].Abs_X := Die(Max_Cell_X - 4) + Orig_X[Room] - 1;
      World.Rooms[Room].Abs_Y := Die(Max_Cell_Y - 4) + Orig_Y[Room] - 1;
      World.Rooms[Room].Max_X := 0;
      World.Rooms[Room].Max_Y := 0
    End
End; (* FUL *)

Procedure Siz;
Var
  I,J,Room : Integer;

  Function R_X (Room : Integer) : Integer;
  Begin (* R_X *)
    Case Room of
      1,2,4,5,7,8 : R_X := World.Rooms[Room+1].Abs_X;
      3,6,9 : R_X := S_Max_X
    End
  End; (* R_X *)

  Function RD_X (Room : Integer) : Integer;
  Begin (* RD_X *)
    Case Room of
      1,2,4,5 : RD_X := World.Rooms[Room+4].Abs_X;
      3,6,7,8,9 : RD_X := S_Max_X
    End
  End; (* RD_X *)

  Function UR_X (Room : Integer) : Integer;
  Begin (* UR_X *)
    Case Room Of
      4,5,7,8 : UR_X := World.Rooms[Room-2].Abs_X;
      1,2,3,6,9 : UR_X := S_Max_X
    End
  End; (* UR_X *)

  Function RD_Y (Room : Integer) : Integer;
  Begin (* RD_Y *)
    Case Room of
      1,2,4,5 : RD_Y := World.Rooms[Room+4].Abs_Y;
      3,6,7,8,9 : RD_Y := S_Max_Y_1
    End
  End; (* RD_Y *)

  Function DL_Y (Room : Integer) : Integer;
  Begin (* DL_Y *)
    Case Room Of
      2,3,5,6 : DL_Y := World.Rooms[Room+2].Abs_Y;
      1,4,7,8,9 : DL_Y := S_Max_Y_1
    End
  End; (* DL_Y *)

  Function D_Y (Room : Integer) : Integer;
  Begin (* D_Y *)
    Case Room of
      1,2,3,4,5,6 : D_Y := World.Rooms[Room+3].Abs_Y;
      7,8,9 : D_Y := S_Max_Y_1
    End
  End; (* D_Y *)

Begin (* Siz *)
  For Room := 1 to Max_room Do
    With World.Rooms[Room] Do
      If (Not Existant) Then
	Begin
	  Max_X := 0;
	  Max_Y := 0
	End
      Else
	Begin
	  Max_X := Max(
		       Die(Min(Min(R_X(Room),RD_X(Room)),
			       UR_X(Room)) - 5 - Abs_X) + 1,
		       Die(Min(Min(R_X(Room),RD_X(Room)),
			       UR_X(Room)) - 5 - Abs_X) + 1);
	  Max_Y := Max(
		       Max(Die(Min(Min(D_Y(Room),RD_Y(Room)),
				   DL_Y(Room)) - 5 - Abs_Y) + 1,
			   Die(Min(Min(D_Y(Room),RD_Y(Room)),
				   DL_Y(Room)) - 5 - Abs_Y) + 1),
		       Max(Die(Min(Min(D_Y(Room),RD_Y(Room)),
				   DL_Y(Room)) - 5 - Abs_Y) + 1,
			   Die(Min(Min(D_Y(Room),RD_Y(Room)),
				   DL_Y(Room)) - 5 - Abs_Y) + 1));

	  (* Maybe this will catch some of the weird errors *)
	  If (Max_y > Max_room_y) or (Max_y < 2) Then
	    Max_y := Max_room_y;
	  If (Max_x > Max_room_x) or (Max_x < 2) Then
	    Max_x := Max_room_x;

	  For I := Abs_Y to Abs_Y + Max_Y + 1 Do
	    Begin
	      World.S_World[Abs_X,i] := '|';
	      World.S_World[Abs_x + Max_x + 1,I] := '|';
	      World.Room_array[Abs_x,I] := Room;
	      World.Room_array[Abs_x+Max_x+1,I] := Room
	    End;
	  For I := Abs_X to Abs_X + Max_X + 1 Do
	    Begin
	      World.S_World[I,Abs_Y] := '-';
	      World.S_World[I,Abs_Y + Max_Y + 1] := '-';
	      World.Room_array[I,Abs_y] := Room;
	      World.Room_array[I,Abs_y+Max_y+1] := Room
	    End;
	  For I := Abs_X +1 to Abs_X + Max_X Do
	    For J := Abs_Y + 1 To Abs_Y + Max_Y Do
	      Begin
		World.S_world[I,J] := '.';
		World.Room_array[I,J] := Room
	      end
	End
End; (* Siz *)

Procedure Dig (Source,Dest : Integer);
Var
  Start_loc,End_loc : Loc_type;
  I,J,Door_num,Incr,Ran_dis : Integer;
  More,Broke : Boolean;

Begin (* Dig *)
      (* Door numbering system: *)
      (* up			*)
      (*      ---1---		*)
      (*      |     |		*)
      (*      4     2		*)
      (*      |     |		*)
      (* down ---3---		*)

  If (Dest = Source + Maze_max_x) Then
    Door_num := 3 (* Down *)
  Else If (Dest = Source - Maze_max_x) Then
    Door_num := 1 (* Up *)
  Else If (Dest = Source - 1) Then
    Door_num := 4 (* Left *)
  Else
    Door_num := 2; (* Right *)
  If Not World.Rooms[Source].Existant Then
    Begin
      Start_loc.X := World.Rooms[Source].Abs_x;
      Start_loc.Y := World.Rooms[Source].Abs_y
    End
  Else
    With World.Rooms[source] do
      case door_num of
	1: begin
	     start_loc.x := abs_x+die(max_x);
	     start_loc.y := abs_y;
	   end;
	2: begin
	     start_loc.x := abs_x+max_x+1;
	     start_loc.y := abs_y+die(max_y);
	   end;
	3: begin
	     start_loc.x := abs_x+die(max_x);
	     start_loc.y := abs_y+max_y+1;
	   end;
	4: begin
	     start_loc.x := abs_x;
	     start_loc.y := abs_y+die(max_y);
	   end;
	others:
	writeln(tty,'Horrible error in DIG');
      end;
  If not world.rooms[dest].existant Then
    Begin
      end_loc.x := world.rooms[dest].abs_x;
      end_loc.y := world.rooms[dest].abs_y;
    End
  Else
    With world.rooms[dest] do
      case ((door_num+1) mod 4)+1 of
	1: begin
	     end_loc.x := abs_x+die(max_x);
	     end_loc.y := abs_y;
	   end;
	2: begin
	     end_loc.x := abs_x+max_x+1;
	     end_loc.y := abs_y+die(max_y);
	   end;
	3: begin
	     end_loc.x := abs_x+die(max_x);
	     end_loc.y := abs_y+max_y+1;
	   end;
	4: begin
	     end_loc.x := abs_x;
	     end_loc.y := abs_y+die(max_y);
	   end;
	others:
	writeln(tty,'Horrible error in DIG');
      end;

  If ((door_num = 1) or (door_num = 3)) Then (* up or down *)
    ran_dis := die(abs((end_loc.y-start_loc.y)-1))
  Else
    ran_dis := die(abs((end_loc.x-start_loc.x)-1));

  If ((door_num = 1) or (door_num = 4)) Then (* up or left *)
    ran_dis := -ran_dis;

  broke := false;
  If ((door_num = 1) or (door_num = 3)) Then (* up or down *)
    Begin
      If (door_num = 1) Then (* up *)
	incr := -1
      Else incr := 1;
      i := start_loc.x;
      j := start_loc.y+incr;
      More := True;
      while More do
	With world do
	  If (s_world[i,j] in ['|','-','+']) Then
	    begin
	      j := j-incr;
	      More := false
	    end
	  else
	    Begin
	      More := (j <> (start_loc.y+ran_dis));
	      s_world[i,j] := '#';
	      if More Then
		j := j+incr;
	    End;
      if i <> end_loc.x Then
	Begin
	  If start_loc.x < end_loc.x Then
	    incr := 1
	  Else incr := -1;
	  repeat
	    i := i+incr;
	    With world do
	      begin
		if (s_world[i,j] In ['|','-','+']) Then
		  begin
		    i := i-incr;
		    if start_loc.y < end_loc.y Then
		      j := j+1
		    else j := j-1;
		    broke := ((j <= y_orig) or (j >= s_max_y));
		  end;
		s_world[i,j] := '#';
	      end;
	  until (i = end_loc.x) or broke;
	End;
      If (door_num = 1) Then (* up *)
	incr := -1
      Else incr := 1;
      while ((j <> end_loc.y) and (not broke)
	     and (j >= y_orig) and (j <= s_max_y)) do
	begin
	  world.s_world[i,j] := '#';
	  j := j+incr;
	end;
    End
  Else (*dig right *)
    Begin
      If door_num = 4 Then
	incr := -1
      Else incr := 1;
      i := start_loc.x+incr;
      j := start_loc.y;
      More := True;
      while More do
	With world do
	  if (s_world[i,j] In ['|','-','+']) Then
	    begin
	      i := i-incr;
	      More := False
	    end
	  else
	    Begin
	      More := (i <> (start_loc.x+ran_dis));
	      s_world[i,j] := '#';
	      if More Then
		i := i+incr;
	    End;
      if j <> end_loc.y Then
	Begin
	  If start_loc.y < end_loc.y Then
	    incr := 1
	  Else incr := -1;
	  repeat
	    j := j+incr;
	    With world do
	      begin
		if (s_world[i,j] In ['|','-','+']) Then
		  begin
		    j := j-incr;
		    if start_loc.x < end_loc.x Then
		      i := i+1
		    else i := i-1;
		    broke := ((i <= x_orig) or (i >= s_max_x));
		  end;
		s_world[i,j] := '#';
	      end;
	  until (j = end_loc.y) or broke;
	End;
      If door_num = 4 Then
	incr := -1
      Else incr := 1;
      while ((i <> end_loc.x) and (not broke)
	     and (i >= x_orig) and (i <= s_max_x)) do
	begin
	  World.s_world[i,j] := '#';
	  i := i+incr;
	end;
    End;
  With world do
    Begin
      rooms[source].doors[door_num].abs_loc := start_loc;
      if (die(100) < level-2) and rooms[source].existant Then
	rooms[source].doors[door_num].secret := (15*die(6))
      else rooms[source].doors[door_num].secret := 0;

      If rooms[source].existant Then
	if rooms[source].doors[door_num].secret > 0 Then
	  if (door_num = 1) or (door_num = 3) (* top or bottom *) Then
	    s_world[start_loc.x,start_loc.y] := '-'
          else s_world[start_loc.x,start_loc.y] := '|'
	else s_world[start_loc.x,start_loc.y] := '+'
      else s_world[start_loc.x,start_loc.y] := '#';

      if not broke Then
	begin
	  door_num := ((door_num+1) mod 4)+1;
	  rooms[dest].doors[door_num].abs_loc := end_loc;
	  if (die(100) < level-2) and rooms[dest].existant Then
	    rooms[dest].doors[door_num].secret := (15*die(6))
	  else rooms[dest].doors[door_num].secret := 0;

	  If rooms[dest].existant Then
	    if rooms[dest].doors[door_num].secret > 0 Then
	      if (door_num = 1) or (door_num = 3) Then
		s_world[end_loc.x,end_loc.y] := '-'
	      else s_world[end_loc.x,end_loc.y] := '|'
	    else s_world[end_loc.x,end_loc.y] := '+'
	  else s_world[end_loc.x,end_loc.y] := '#';
	End;
    End;
End; (* Dig *)

Procedure Con_Table;

Var I,J,X,Y : Integer;

  Procedure Build( X,Y : Integer);
  Begin (* Build *)
    Ct[x,y].u := True;
    If (Not Ct[X,Y-1].U) then
      Begin
	Ct[x,y].up := True;
	Ct[x,y-1].dn := True;
	Build(x,y-1);
      End;
    If (Not Ct[X,Y+1].U) then
      Begin
	Ct[x,y].dn := True;
	Ct[x,y+1].up := True;
	Build(x,y+1);
      End;
    If (Not Ct[X-1,Y].U) then
      Begin
	Ct[x,y].Lt := True;
	Ct[x-1,y].Rt := True;
	Build(x-1,y);
      End;
    If (Not Ct[X+1,Y].U) then
      Begin
	Ct[x,y].Rt := True;
	Ct[x+1,y].Lt := True;
	Build(x+1,y);
      End;
  End; (* Build *)

Begin (* Con_Table *)
  For I := 1 to 3 do
    For J := 1 to 3 do
      Begin
	Ct[I,J].U := False;
	Ct[I,J].Lt := False;
	Ct[I,J].Rt := False;
	Ct[I,J].Up := False;
	Ct[I,J].Dn := False;
      End;
  For I := 0 to 4 do
    Begin
      CT[I,0].U := True;
      CT[I,4].U := True;
      CT[0,I].U := True;
      CT[4,I].U := True;
    End;
  Build(Die(3),Die(3));
  J := Die(3);
  For I := 1 to J do
    Begin
      X := Die(3);
      Y := Die(3);
      If ((Not Ct[x,y].rt) and (X <> 3)) then
	Begin
	  ct[x,y].rt := True;
	  ct[x+1,y].lt := True;
	End
      Else If ((Not ct[x,y].lt) and (X <> 1)) then
	Begin
	  ct[x,y].lt := True;
	  ct[x-1,y].rt := True;
	End
      Else If ((Not ct[x,y].up) and (Y <> 1)) then
	Begin
	  ct[x,y].up := True;
	  ct[x,y-1].dn := True;
	End
      Else If ((Not ct[x,y].dn) and (Y <> 3)) then
	Begin
	  ct[x,y].dn := True;
	  ct[x,y+1].up := True;
	End;
    End;
  For X := 1 to 3 do
    For Y := 1 to 3 do
      Begin
	If ct[x,y].rt Then
	  Dig((y-1)*3+x,(y-1)*3+x+1);
	If ct[x,y].dn Then
	  Dig((y-1)*3+x,(Y*3+x));
      End;
  Writeln(tty);
End; (* Con_Table *)

Procedure Pick_A_Place(Var X,Y : Integer);
Var Room : Integer;
Begin (* Pick_A_Place *)
  Repeat
    (* Find a random room *)
    Room := Die(9);
    While (Not World.Rooms[Room].Existant) do
      Room := ((Room+1) mod 9) + 1;
    (* And then a random place in that room *)
    X := Die(World.Rooms[Room].Max_X) + World.Rooms[Room].Abs_X;
    Y := Die(World.Rooms[Room].Max_Y) + World.Rooms[Room].Abs_Y;
  Until ((World.S_World[x,y] = '.') And
	 (World.Obj[x,y] = Chr(0)) And
	 (World.Mon[x,y] = Chr(0))); (* Make sure the place is virgin *)
End; (* Pick_A_Place *)


Procedure Magic_Aids(Level,Idx : Integer; P : Obj_Ptr; Typ : Obj_Class_Type);
Begin
  Case Typ of	(* Handle special cases.. if any *)
    Gold_T :
    Begin
      P^.Quan := 1;
      If Level > Amulet_level Then
	P^.Quan := 1 + Die(30)
      else
	P^.Quan := P^.Quan + Max(Die(15*level),Die(15*level));
    End;
    Wand_T :
    if P^.Index in [w_fire,w_lightning,w_cold,w_alchemy,w_curing] Then
      P^.Plus_hit := 2+die(2)
    Else If P^.Index = w_light Then
      P^.Plus_hit := 10+die(6)
    Else If (P^.Index in [w_wonder,w_blunder]) Then
      P^.Plus_Hit := 15 + die(20)
    else P^.Plus_hit := 5+die(2);
    Ring_T :
    Begin
      if (P^.Index in [r_teleport,r_aggra]) Then
	P^.Plus_hit := -1
      Else If P^.index in [r_protect,r_dex,r_str,r_int,r_incr_dam] Then
	with P^ do
	  case die(9) of
	    1: Plus_hit := -2;
	    2,3,4: Plus_hit := -1;
	    5,6,7,8: Plus_hit := +1;
	    9: Plus_hit := +2;
	  End
      Else If P^.Index = r_resur Then
	case Die (100) of
	  1 : P^.Plus_Hit := -1; (* Bad news for the team! *)
	  90,91,92,93,94,95,96,97,98,99
	  : P^.Plus_Hit := +2; (* Wow two extra lives! *)
	  100 : p^.Plus_Hit := +9; (* Just like the cat on tv! *)
	  others : P^.Plus_Hit := 1; (* Boring! *)
	end (* case *)
      Else If P^.Index = R_Decode Then (* #55 *)
	Case Die(10) Of
	  1,2,3,4,5 : P^.Plus_Hit := 20000000001B; (* signal scrolls, good *)
	  6,7,8 : P^.Plus_Hit := (Die(76B) + 1) * 2000000000B + 1; (* good *)
	  9,10 : P^.Plus_Hit := (Die(76B) + 1) * 2000000000B (* bad *)
	End;
      P^.Plus_dam := 0
    End;
    Armor_T :
    Begin
      With P^ Do
	Case Die(20) Of
	  1	: Plus_Hit := -(Die(2) + 2); (* Horribly cursed *)
	  2,3	: Plus_Hit := -(Die(2)); (* Cursed *)
	  4,5,6 : Plus_Hit := Die(2); (* Average *)
	  7,8	: Plus_Hit := (Die(2) + 1); (* Above Average *)
	  9	: Plus_Hit := (Die(2) + 2); (* Incredible! *)
	  others: Plus_hit := 0;
	End;
	P^.Plus_dam := 0;
    End;
    Weapon_T :
    Begin
      P^.Plus_Hit := 0;
      P^.Plus_Dam := 0;
      If (Idx in [wp_arrows,wp_rocks,wp_bolts,wp_sil_arrows]) Then
	If (Idx = wp_sil_arrows) Then
	  Begin
	    P^.Quan := 2 + Die(3); (* silver arrows *)
	    P^.Plus_Hit := 5 + die(5);
	    P^.Plus_Dam := 5+die(5);
	  End
	Else If (Idx = wp_arrows) Then
	  P^.Quan := 20 + Die(20) (* Arrows *)
	Else
	  P^.Quan := 5 + Die(10) (* Bolts and Rocks *)
      Else
	P^.Quan := 1; (* only one of them *)
      WITH P^ DO
	CASE Die(20) OF
	  1     : Plus_Hit := Plus_Hit-(Die(2) + 2); (* Horribly cursed *)
	  2,3   : Plus_Hit := Plus_Hit-(Die(2)); (* Cursed *)
	  4,5,6 : Plus_Hit := Plus_Hit+Die(2); (* Average *)
	  7,8   : Plus_Hit := Plus_Hit+(Die(2) + 1); (* Above Average *)
	  9     : Plus_Hit := Plus_Hit+(Die(2) + 2); (* Incredible! *)
	END;
      IF (P^.Plus_Hit < 0) THEN
	P^.Plus_Dam := Die(3) - 2
      ELSE If (P^.Plus_hit > 0) then
	P^.Plus_dam := P^.Plus_Hit + (Die(3) - 2)
      else P^.plus_dam := 0;
    End;
  End; (* Case *)
  P^.Cursed := (P^.Plus_Hit < 0) or (P^.Plus_Dam < 0);
  If (Die(30) = 1) Then
    P^.Cursed := Not P^.Cursed
end; (* magic aids to game playing *)

Procedure Gen_Obj(Level : Integer; Var P : Obj_Ptr);

Var
  Idx,I,Thing : Integer;
  Typ		: Obj_Class_Type;

  Procedure Rand_Obj(Var Typ : Obj_Class_Type; Var Index : Integer);
  Var T : Integer;
    Begin (* Rand_Obj *)
      T := Die(Max_Chance);
      Index := 1;
      While (T > Treasure[Index].Chance) do
	Begin
	  T := T - Treasure[Index].Chance;
	  Index := Index + 1;
	End;
      (* Return the numbers *)
      Typ := Treasure[Index].Typ;
      Index := Treasure[Index].Index;
    End; (* Rand_Obj *)

Begin (* Gen_Obj *)
  New(P);
  If Die(40) = 1 Then (* #63 *)
    Begin
      Typ := Food_T;
      Idx := Die(2) - 1
    End
  Else
    Rand_Obj(Typ,Idx);
  P^.Obj_Typ := Typ; (* Defaults *)
  P^.Index := Idx;
  P^.Plus_Hit := 0;
  P^.Plus_Dam := 0;
  P^.Know_magic := False;
  P^.Quan := 1;

  Pick_A_Place(P^.Loc.X,P^.Loc.Y);
  (* Try to spread out objects.  O_Used_list declared globally. *)
  If O_Used_list[world.room_array[P^.Loc.X,P^.Loc.Y]] Then
    Pick_a_place(P^.Loc.X,P^.Loc.Y);
  O_Used_list[world.room_array[P^.Loc.X,P^.Loc.Y]] := True;
  Magic_Aids(Level,Idx,P,Typ); (* Add magic plusses *)
End; (* Gen_Obj *)

Procedure Place_Obj(P : Obj_Ptr);

Begin (* Place_Obj *)
  P^.Next := World.Objs;
  World.Objs := P;
  With P^.Loc Do
    Case P^.Obj_Typ of
      Gold_T : World.Obj[X,Y] := '*';
      Food_T : World.Obj[X,Y] := '&';
      Scroll_T : World.Obj[X,Y] := '?';
      Potion_T : World.Obj[X,Y] := '!';
      Wand_T : World.Obj[X,Y] := '/';
      Ring_T : World.Obj[X,Y] := '=';
      Armor_T : World.Obj[X,Y] := '[';
      Weapon_T : World.Obj[X,Y] := ')';
      Amulet_t : World.Obj[X,Y] := '$';
      Others : Echo('God-awful error in Place_Obj : No such object type!')
    End;
  World.Lines[P^.Loc.Y] := True
End; (* Place_Obj *)

Procedure Gen_monster(Level,Avoid : Integer; Var P : Mon_ptr;
		      All_awake : Boolean);
Var
  I : Integer;
  P_Obj : Obj_Ptr;

  Function Get_Index:Integer;
  Var
    Index : Integer;
    Count : Integer;
  Begin (* Get_Index *)
    Count := 0;
    Repeat
      Index := Die(Max_Monster);
      If ((Index = M_mimic) and (World.Objs = NIL)) Then
	Index := Index + Die(Max_monster - M_mimic);
      Count := Count + 1;
    Until (((World.Level >= Monster[Index].Min_Level) And
	    (World.Level <= Monster[Index].Max_Level)) Or
	   ((Count >= 500) and (World.Level <= Monster[Index].Max_Level)));
    Get_Index := Index;
  End; (* Get_Index *)

Begin (* Gen_Monster *)
  New(P);
  With P^ Do
    Begin
      Next := Nil;
      Index := Get_Index;
      HP := 0;
      Paralyzed_Count := 0;
      Confused_count := 0;
      Speed := 2;
      Speed_count := 0;
      Who_first := 0;

      (* Find out where it should go *)
      (* If a mimic, Then Put it In the same place as an object *)
      Repeat
	Pick_A_Place(Loc.X,Loc.Y);
	If M_used_list[World.Room_array[Loc.X,Loc.Y]] Then
	  Pick_a_place(Loc.X,Loc.Y)
      Until (Avoid = 0) or (World.Room_array[P^.Loc.X,P^.Loc.Y] <> Avoid);
      If (Index = M_mimic) Then
	Loc := World.Objs^.Loc;
      M_Used_list[World.Room_array[Loc.X,Loc.Y]] := True;

      (* Get monsters hit points *)
      For i := 1 to Monster[Index].Hit_Dice Do
	Hp := Hp + Die(8);

      (* Don''t allow more than 1 leprechaun or nymph *)
      (* or mimic or githyanki per level *)
      If Index In [M_lep,M_nymph,M_mimic,M_gith] Then
	Monster[Index].Min_level := World.Level + 1;

      (* See if the monster is asleep. *)
      (* Rings of Stealth/Aggravate handled here. *)
      I := 100;
      If Has_on_ring(R_stealth) Then
	I := I Div 3;
      If Has_on_ring(R_aggra) Then
	I := I * 3;
      Awake := (((Die(i) >= Monster[Index].Sleep) or all_awake)
		and (Monster[Index].Sleep <> 100))
    End
End; (* Gen_Monster *)

Procedure Place_Monster(Var P : Mon_Ptr);

Begin (* Place_Monster *)
  P^.Next := World.Monsters;
  World.Monsters := P;
  With P^ do
    Begin
      If ((Index = M_mimic) and (Player.Seemon_count = 0)) Then
	World.Mon[Loc.X,Loc.Y] := World.Obj[World.Objs^.Loc.X,World.Objs^.Loc.Y]
      Else
	World.Mon[Loc.X,Loc.Y] := Monster[Index].Name;
      If (Player.SeeMon_Count > 0) Then
	Begin
	  World.Lines[Loc.Y] := True;
	  World.Seeable[Loc.X,Loc.Y] := True
	End
    End
End; (* Place_Monster *)

Procedure Gen_traps;
Var
  I : Integer;
  T : Trap_ptr;
Begin (* Gen_traps *)
  For I := 1 To World.Level div 5 Do
    Begin
      New(T);
      T^.Next := World.Traps;
      World.Traps := t;
      Pick_a_place(T^.Loc.X,T^.Loc.Y);
      T^.Chance := 60+Die(20);
      Case Die(15) Of
	1 : T^.Kind := T_dart;
	2,3 : T^.kind := T_door;
	4,5,6 : T^.kind := T_teleport;
	7,8,9,10 : T^.kind := T_bear;
	Others : T^.kind := T_arrow
      End;
      If ((World.Level = Amulet_Level) And (T^.Kind = 3)) Then
        T^.Kind := 4
    End
End; (* Gen_traps *)

Procedure Stock_World;
Var
  I,J,X,Y : Integer;
  P_Mon : Mon_Ptr;
  P_Obj : Obj_Ptr;
  Other : Loc_Type;
Begin (* Stock_world *)
(* Turn off some lights, re-initalize used_list *)
  For I := 1 to Max_room do
    Begin
      If (World.Level > Die(20)) Then
	World.Rooms[i].Light := False;
      O_Used_list[i] := false;
      M_Used_list[i] := false
    End;

  (* Put in the stairs down... *)
  Pick_A_Place(X,Y);
  World.S_World[x,y] := '%';

  (* Place the character *)
  Pick_A_Place(Player.Loc.X,Player.Loc.Y);
  World.Mon[Player.Loc.X,Player.Loc.Y] := '@';

  (* Check for amulet, Put Juiblex on it *)
  If (World.Level = Amulet_level) Then
    Begin
      New(P_Obj);
      P_Obj^.obj_typ := Amulet_t;
      Pick_a_place(P_Obj^.Loc.X,P_Obj^.Loc.Y);
      P_obj^.Cursed := False;
      P_obj^.Index := 0;
      P_obj^.Quan := 1;
      Place_obj(P_Obj);
      New(P_Mon);
      With P_Mon^ Do
	Begin
	  Next := NIL;
	  Index := M_juiblex;
	  HP := 88;
	  Paralyzed_Count := 0;
	  Confused_count := 0;
	  Speed := 2;
	  Speed_count := 0;
	  Who_first := 0;
	  Loc.Y := P_Obj^.Loc.Y;
	  Loc.X := P_Obj^.Loc.X;
	  Awake := False
	End;
      Place_Monster(P_Mon)
    End;

  (* Some Treasures... *)
  I := Die(3) + Die(3); (* 2..6 *)
  For j := 1 To I Do
    Begin
      Gen_Obj(World.Level,P_Obj);
      Place_Obj(P_Obj)
    End;
(* At this point, World.Obj_List <> NIL and the first item is Not the  *)
(* Amulet, so If we place a mimic, it won't be on the amulet. *)

(* Some Monsters!!! *)
  World.Max_mons := 2 + Die(3);	(* #63 was die(2) *)
  World.Num_mons := World.Max_mons;
  j := 1;
  i := 0;
  While (j <= world.num_mons) do
    Begin
      Gen_Monster(World.Level,0,P_Mon,False);
      Place_Monster(P_Mon);
      If ((P_Mon^.Index <> M_kill) and (I <= 5)) Then
	J := J + 1
      Else
	I := I + 1
    End;

  (* And now traps too! *)
  Gen_traps
End; (* Stock_World *)

Procedure Gen_Level(Var World : World_Rec);
Var
  I,J : Integer;
Begin (* Gen_Level *)
  Lose_Old_World;
  World.Level := World.Level + 1;
  For J := Y_Orig_1 to S_Max_Y_1 do
    For I := X_Orig_1 to S_Max_X_1 do
      Begin
	World.S_World[i,j] := ' ';
	World.Room_array[i,j] := 0;
	World.Mon[i,j] := Chr(0);
	World.Obj[i,j] := Chr(0)
      End;
  For J := Redisp_Y_Orig + 1 to Redisp_Max_Y - 2 Do (* don''t Do stats lines *)
    Begin
      World.Lines[J] := True;
      For I := Real_X_Orig to Real_Max_X Do
	World.Screen[J,I] := ' '
    End;
  With World Do
    Begin
      Seen := False_array;
      Seeable := False_array;
    End;
  For I := 1 to Max_Room do
    Begin
      World.Rooms[I].Existant := True;
      World.Rooms[I].Light := True;
      World.Rooms[I].Seen := False;
      For J := 1 to Max_Doors Do
	Begin
	  World.Rooms[I].Doors[J].Secret := 0;
	  World.Rooms[I].Doors[J].Abs_loc.X := 0;
	  World.Rooms[I].Doors[J].Abs_loc.Y := 0
	End
    End;
  Ful;
  J := 0;
  For I := 1 to Max_Room Do
    If (Die(Chance_Of_No_Room)=1) and (J < 4) Then
      Begin
	World.Rooms[i].Existant := False;
	J := J + 1
      End;
  Siz;
  Con_Table;
  Stock_World
End; (* Gen_Level *)

Procedure Figure_Ac;
Var
  Hand : Hand_Type;
Begin
  With Player Do
    Begin
      If (Cur_Arm <> NIL) Then
	Ac := Armor[Cur_Arm^.Index].Ac - Cur_arm^.Plus_hit
      Else
	Ac := 10;
      For Hand := Left_H To Right_H Do
	If (Cur_ring[Hand] <> NIL) Then
	  If (Cur_ring[Hand]^.Index = R_protect) Then
	    Ac := Ac - Cur_ring[Hand]^.Plus_hit;
    End;
  Change_stats := Change_stats![S_bottom];
End;

Procedure Gen_Character(P : Player_Record);
Var Worker: Obj_ptr;
Begin (* Gen_Character *)
  With Player do
    Begin
      New(Obj_List);
      Obj_List^.Obj_Typ := Food_T;
      Obj_List^.Index := 0;
      Obj_List^.Quan := 1;
      New(Obj_List^.Next);
      Worker := Obj_list^.Next;
      Cur_Arm := Worker;
      With Worker^ Do
	Begin
	  Obj_typ := Armor_T;
	  Index := a_ring; (* Ring mail *)
	  Plus_Hit := 1;
	  Know_magic := true;
	  Quan := 1;
	  Cursed := False
	End;
      Figure_Ac;
      New(Worker^.Next);
      Worker := Worker^.Next;
      Cur_Wep := Worker;
      With Worker^ Do
	Begin
	  Obj_Typ := Weapon_T;
	  Index := wp_mace; (* +1 Mace *)
	  Plus_Hit := 1;
	  Plus_Dam := 1;
	  Know_magic := true;
	  Cursed := False;
	  Quan := 1
	End;
      New(Worker^.Next);
      Worker := Worker^.Next;
      With Worker^ Do
	Begin
	  Obj_typ := Weapon_t;
	  Index := wp_bow; (* +1 Short bow *)
	  Plus_hit := 1;
	  Plus_dam := 1;
	  know_magic := true;
	  Cursed := False;
	  Quan := 1
	End;
      New(Worker^.Next);
      Worker := Worker^.Next;
      With Worker^ Do
	Begin
	  Obj_typ := Weapon_t;
	  Index := wp_arrows; (* Arrows *)
	  Plus_hit := 0;
	  Plus_dam := 0;
	  Know_magic := true;
	  Quan := 20+die(20);
	  Cursed := False;
	  Next := NIL
	End;
      Cur_Ring[Left_H] := NIL;
      Cur_ring[Right_H] := NIL;
      Max_ST := 13 + Die(4);
      St := Max_ST;
      Max_DX := 13 + Die(4);
      DX := Max_DX;
      Max_IQ := 13 + Die(4);
      IQ := Max_IQ;
      Hp := 12;
      Max_HP := 12;
      Level := 1;
      Xp := 0;
      Speed := 2;
      Speed_count := 0;
      Gold := 0;
      Died_Count := 0; (* #49 all from here To end *)
      SeeMon_Count := 0;
      Faint_count := 0;
      Confused_count := 0;
      Blind_count := 0;
      Paralyzed_count := 0;
      Sleep_count := 0;
      Trapped_count := 0;
      Fixed_count := 0;
      Invis_count := 0;
      Last_meal := 0;
      Heal_count := 0;
      Eaten_Count := 0;
      Eaten_Loss := 0;
      Blind := False;
      Stuck := False;
      Will_confuse := False;
      Has_amulet := False
    End (* With *)
End; (* Gen_Character *)

Procedure Init_obj_descriptions;
Var
  Ran_array : Array[1..Max_word] of Integer;
  I,A,B,J,Num,Start,Ran_word : Integer;

    Procedure Swap (A,B : Integer);
    Var
      T : Integer;
    Begin
      T := Ran_array[B];
      Ran_array[B] := Ran_array[A];
      Ran_array[A] := T
    End;

Begin
  For I := 1 to Max_potion Do
    Ran_array[I] := I;
  For I := 1 to Max_potion Do
    Begin
      A := Die(Max_potion);
      B := Die(Max_potion);
      Swap(A,B);
    end;
  for i := 1 to max_potion do
    begin
      for j := 1 to color[ran_array[i]].leng do
	potion[i].desc[j] := color[ran_array[i]].name[j];
      for j := color[ran_array[i]].leng+1 to Name_Len do
	potion[i].desc[j] := ' ';
      potion[i].d_leng := color[ran_array[i]].leng;
    end;

  for i := 1 to max_ring do
    ran_array[i] := i;
  for i := 1 to max_ring do
    begin
      a := die(max_ring);
      b := die(max_ring);
      swap(a,b);
    end;
  for i := 1 to max_ring do
    begin
      for j := 1 to stone[ran_array[i]].leng do
	ring[i].desc[j] := stone[ran_array[i]].name[j];
      for j := stone[ran_array[i]].leng+1 to Name_Len do
	ring[i].desc[j] := ' ';
      ring[i].d_leng := stone[ran_array[i]].leng;
    end;

  for i := 1 to max_wand do
    ran_array[i] := i;
  for i := 1 to max_wand do
    begin
      a := die(max_wand);
      b := die(max_wand);
      swap(a,b);
    end;
  for i := 1 to max_wand do
    begin
      wand[i].is_wand := (die(2) = 1);
      if wand[i].is_wand Then (* wands are metal *)
	begin
	  for j := 1 to metal[ran_array[i]].leng do
	    wand[i].desc[j] := metal[ran_array[i]].name[j];
	  for j := metal[ran_array[i]].leng+1 to Name_Len do
	    wand[i].desc[j] := ' ';
	  wand[i].d_leng := metal[ran_array[i]].leng;
	end
      else  (* staves are wood *)
	begin
	  for j := 1 to wood[ran_array[i]].leng do
	    wand[i].desc[j] := wood[ran_array[i]].name[j];
	  for j := wood[ran_array[i]].leng+1 to Name_Len do
	    wand[i].desc[j] := ' ';
	  wand[i].d_leng := wood[ran_array[i]].leng;
	end
    end;

  for i := 1 to max_word do
    ran_array[i] := i;
  for i := 1 to max_word do
    begin
      a := die(max_word);
      b := die(max_word);
      swap(a,b);
    end;
  ran_word := 1;
  for i := 1 to max_scroll Do
    With Scroll[I] Do
      Begin
	Start := 1;
	j := 1;
	num := die(4);
	while (j <= num) and (start <= Name_Len) do
	  begin
	    a := 1;
	    while (a <= 10) and (start <= Name_Len) do
	      begin
		if (word[ran_array[ran_word]].name[a] <> Space) Then
		  begin
		    Desc[start] := word[ran_array[ran_word]].name[a];
		    start := start+1
		  end;
		a := a+1
	      end;
	    j := j+1;
	    ran_word := ran_word+1;
	    if start <= Name_Len Then
	      begin
		Desc[start] := Space;
		Start := Start + 1
	      End;
	    If start = Name_Len then (* #2 *)
	      begin
		Desc[start] := Space;
		start := start+1
	      End
	  End;
	For a := start to Name_Len do
	  Desc[a] := Space;
	Desc[1] := Chr(Ord(Desc[1]) - 40B); (* #2 capitalize it *)
	If Desc[Name_Len] = Space Then
	  D_leng := start-2
	Else
	  D_leng := start-1;
	If Desc[D_Leng] = Space Then (* #6 *)
	  D_Leng := D_Leng - 1 (* #6 *)
      End
End; (* Init_obj_descriptions *)

Procedure Second_Init;
Var
  I,J : Integer;
Begin (* Second_Init *)
  World.Level := 0; (* Initialize the first level (0th) *)
  World.Objs := NIL;
  World.Monsters := NIL;
  World.Traps := NIL;
  Init_obj_descriptions;
  Amulet_level := 26+die(2); (* #63 *)
  Blank_message := die(3);
  Gen_Character(Player);
  Gen_Level(World);
  Change_stats := [S_top,S_bottom];
  Dead := False
End; (* Second_Init *)

Procedure First_Init;
Var
  I,J : Integer;
Begin (* First_Init *)
  JSYS(14B;;Seed); (* #60 TIME *)
  Seed := Seed mod 199021;
  Setran(Seed);
  For I := 1 to 55 Do
    Rnds[I] := Random(0); (* #63 *)
  Rnd_J := 55;
  Rnd_K := 24;
  Virgin := False;
  Dead := False;
  Quit_game := False;
  Ctrl_L := Chr(14B); (* #49 *)
  Wait_Chars := [' ','0',Chr(15B),Chr(33B),Chr(177B)]; (* #54 add DEL *)
  Echo_point := 4; (* #50 *)
  Okdirs := ['1','2','3','4','6','7','8','9','h','j','k','l','y','u',
	     'b','n','H','J','K','L','Y','U','B','N',Chr(33B)];
  Resp_chars := ['T','F','t','f',Chr(33B),Chr(15B),Chr(12B)];
  Okmons := ['a'..'z','A'..'Z'];
  For I := X_orig to S_max_x Do
    For J := Y_orig to S_max_y Do
      False_array[I,J] := False;
  For I := 1 to 80 Do
    Nulls[I] := Chr(0);
  F_temp := False;
  Fast := False;
  For J := Real_Y_Orig to Real_Max_Y Do
    For I := Real_X_Orig to Real_Max_X Do
      Begin
	World.This_screen[J,I] := ' ';
	World.Screen[J,I] := ' '
      End;
  Player.Loc.X := 1;
  Player.Loc.Y := 1;
  Trmchk(0); (* #2 0 = Rogue *)
  Interrupts;
  Settty;
  ReWrite(tty,'TTY:','/M:1')
End; (* First_Init *)

Procedure Insert (Var List : Obj_Ptr; P : Obj_Ptr);
Var
  Q,Ptemp : Obj_Ptr;
  U,More,Finished : Boolean;
Begin (* Insert *)
  Ptemp := Nil;
  Q := List;
  More := True;
  Finished := False;
  Last_Item := 'a';
  While (Q <> Nil) and More do
    If (P^.Obj_Typ >= Q^.Obj_Typ) Then
      If p^.obj_typ = q^.obj_typ Then
	begin
	  u := (P^.Index = Q^.Index);
	  u := u and ((P^.Obj_typ in [Food_t,Scroll_t,Potion_t])
		      or ((P^.Obj_typ = Weapon_t)
			  and (P^.Index in [wp_rocks,wp_bolts,wp_arrows,wp_sil_arrows])
			  and ((p^.plus_hit = q^.plus_hit)
			       and (p^.plus_dam = q^.plus_dam))));
	  If U Then
	    Begin
	      Q^.Quan := Q^.Quan+Max(P^.Quan,1);
	      Finished := true;
	      More := False;
	      Dispose(P)
	    End
	  Else
	    Begin
	      Ptemp := Q;
	      Q := Q^.Next;
	      Last_item := Succ(Last_item)
	    End
	end
      Else
	Begin
	  Ptemp := Q;
	  Q := Q^.Next;
	  Last_item := Succ(Last_item)
	End
      Else
	More := False;
      if not finished Then
	If (Ptemp <> Nil) Then
	  Begin
	    Ptemp^.Next := P;
	    P^.Next := Q
	  End
	Else
	  Begin
	    P^.Next := List;
	    List := P
	  End
End; (* Insert *)

Procedure Remove_Obj(Var List,Befor : Obj_Ptr);

Begin (* Remove_Obj *)
  If (Befor <> Nil) Then
    Befor^.Next := Befor^.Next^.Next
  Else
    List := List^.Next;
End; (* Remove_Obj *)

FUNCTION Has_One(P: Obj_Ptr;
		 Exact: BOOLEAN): BOOLEAN;

VAR More: BOOLEAN; (* Some day pascal will have multiple EXIT loops... *)
    q: Obj_Ptr;
BEGIN (* Has_One *)
  q := Player.Obj_List;
  More := True;
  Has_One := FALSE;
  WHILE More AND (q <> NIL) DO
    BEGIN
      IF (Q^.Obj_Typ = P^.Obj_Typ) THEN
	BEGIN
	  IF (Q^.index = P^.index) THEN
	    BEGIN
	      IF Exact THEN
		BEGIN
		  IF (P^.Obj_Typ IN [food_t,scroll_t,potion_t]) THEN
		    BEGIN
		      Has_One := TRUE;
		      More := False
		    END (* IF *)
		  ELSE IF ((P^.Obj_Typ = Weapon_t) AND
			   (P^.Index IN [wp_arrows,wp_sil_arrows,
					 wp_rocks,wp_bolts])) THEN
		    BEGIN
		      IF (q^.plus_dam = p^.plus_dam) THEN
			BEGIN
			  IF (q^.plus_hit = p^.plus_hit) THEN
			    BEGIN
			      More := False;
			      has_one := TRUE;
			    END; (* IF *)
			END; (* IF *)
		    End; (* IF *)
		END (* IF Exact *)
	      ELSE
		BEGIN
		  More := False;
		  Has_One := TRUE
		END; (* ELSE *)
	    END; (* IF *)
	END; (* IF *)
      q := q^.next;
    END; (* WHILE *)
END; (* Has_One *)

FUNCTION Can_Carry(P : Obj_Ptr): BOOLEAN;

    FUNCTION Item_Count: INTEGER;

    VAR c: INTEGER;
	p: Obj_Ptr;

    BEGIN (* Item_Count *)
      c := 0;
      p := player.Obj_List;
      WHILE (p <> NIL) DO
	BEGIN
	  c := c + 1;
	  p := p^.next;
	END; (* WHILE *)
      Item_Count := c;
    END; (* Item_Count *)

BEGIN (* Can_carry *)
  IF (P^.Obj_Typ = Gold_T) THEN
    BEGIN
      Can_Carry := TRUE;
    END (* IF *)
  ELSE
    BEGIN
      IF Has_One(P,TRUE) THEN
	BEGIN
	  Can_Carry := TRUE;
	END (* IF *)
      ELSE
	BEGIN
	  IF (Item_Count < Max_Item) THEN
	    BEGIN
	      Can_Carry := TRUE;
	    END (* IF *)
	  ELSE
	    BEGIN
	      Can_Carry := FALSE;
	    END; (* ELSE *)
	END; (* ELSE *)
    END; (* ELSE *)
END; (* Can_Carry *)

Procedure Write_obj_name (Var Fp : Text; What : Obj_ptr; Another : Boolean);
Var
  Len : Integer;
  Is_Id, Know_the_magic, (* #55 *)
  More : Boolean;

  Procedure Decoding (P_Obj : Obj_Ptr; Var Is_Id, Know_da_magick : Boolean);
  Var
    Hand : Hand_Type;
    Has,Good : Boolean;
    Magick : Fudge_Type;
  Begin (* Decoding *)
    Has := False;
    If Player.Cur_Ring[Right_H] <> NIL Then
      If Player.Cur_Ring[Right_H]^.Index = R_decode Then
	Begin
	  Magick.Int := Player.Cur_Ring[Right_H]^.Plus_Hit;
	  Has := Magick.Boo[Ord(P_Obj^.Obj_Typ)];
	  Good := Magick.Boo[35] (* check high bit, If on, it''s good. *)
	End;
    If Player.Cur_Ring[Left_H] <> NIL Then
      If Player.Cur_Ring[Left_H]^.Index = R_Decode Then
	Begin
	  Magick.Int := Player.Cur_Ring[Left_H]^.Plus_Hit;
	  If Magick.Boo[Ord(P_Obj^.Obj_Typ)] Then
	    If Has Then
	      Begin
		If Good <> Magick.Boo[35] Then
		  Has := False
	      End
	    Else
	      Begin
		Has := Magick.Boo[Ord(P_Obj^.Obj_Typ)];
		Good := Magick.Boo[35] (* check high bit, If on, it''s good. *)
	      End
	End;
    If Has Then
      Begin
	Is_Id := Good;
	Know_Da_Magick := Good
      End
    Else
      With P_Obj^ Do
	Case Obj_Typ Of
	  Potion_T : Begin
		       Is_Id := Potion[Index].Id;
		       Know_Da_Magick := Know_Magic
		     End;
	  Scroll_T : Begin
		       Is_Id := Scroll[Index].Id;
		       Know_Da_Magick := Know_Magic
		     End;
	  Weapon_T : Begin
		       Is_Id := True;
		       Know_Da_Magick := Know_Magic
		     End;
	  Armor_T : Begin
		      Is_Id := True;
		      Know_Da_Magick := Know_Magic
		    End;
	  Wand_T : Begin
		     Is_Id := Wand[Index].Id;
		     Know_Da_Magick := Know_Magic
		   End;
	  Ring_T : Begin
		     Is_Id := Ring[Index].Id;
		     Know_Da_Magick := Know_Magic
		   End
	End
  End; (* Decoding *)

  Procedure Write_With_A_An_Or_Number (Var Fp:Text; Name: Name_String;
				       N_Leng : Integer; Another : Boolean);
  Begin (* Write_With_A_An_Or_Number *)
    If What^.obj_typ <> Armor_t Then
      Begin
	If (What^.Quan <= 1) Then
	  If Another Then
	    Write(fp,'another ')
	  Else If (Name[1] in ['A','E','H','I','O','U','a','e','h','i','o','u']) Then
	    Write(Fp,'an ')
	  Else
	    Write(Fp,'a ')
	Else
	  Begin
	    Write(Fp,What^.Quan:0);
	    If Another Then
	      Write(fp,' more ')
	    Else
	      Write(fp,' ')
	  End;
	Write(fp,name:n_leng)
      End
    End; (* Write_With_A_An_Or_Number *)

Begin
  With What^ do
    Begin
      Decoding(What,Is_Id,Know_The_Magic);
      If Know_The_magic Then
	If (((Obj_typ = Ring_t) and
	     (Index In [R_protect,R_dex,R_str,R_int,R_incr_dam]))
	    or (Obj_typ In [Armor_t,Weapon_t])) Then
	  Begin
	    If Another Then
	      If (Obj_Typ = Weapon_t) Then
		If (Index In [wp_rocks,wp_bolts,wp_arrows,wp_sil_arrows]) Then
		  Write(fp,'another ');
	    If Plus_hit < 0 Then
	      Write(fp,'-')
	    Else
	      Write(fp,'+');
	    Write(fp,Abs(Plus_hit):1);
	    If Obj_typ = Weapon_T Then
	      Begin
		If Plus_dam < 0 Then
		  Write(fp,',-')
		Else
		  Write(fp,',+');
		Write(fp,Abs(Plus_dam):1)
	      End;
	    Write(fp,' ')
	  End;
      Case Obj_typ Of
	Wand_t : Begin
		   With Wand[Index] Do
		     If Is_id Then
		       Begin
			 If (Quan <= 1) Then
			   Begin
			     If Another Then
			       Write(fp,'another ')
			     Else
			       Write(fp,'a ');
			     If Is_Wand Then
			       Write(fp,'wand of ')
			     Else
			       Write(fp,'staff of ')
			   End
			 Else
			   Begin
			     Write(fp,quan:0);
			     If Another Then
			       Write(fp,' more ');
			     If Is_Wand Then
			       Write(fp,'wands of ')
			     Else
			       Write(fp,'staves of ')
			   End;
			 write(fp,name:n_leng)
		       End (* if Is_Id *)
		     Else
		       Begin
			 Write_With_A_An_Or_Number(Fp,Desc,D_leng,Another);
			 If Is_wand Then
			   If (Quan <= 1) Then
			     Write(fp,' wand')
			   Else
			     Write(fp,' wands')
			 Else If (Quan <= 1) Then
			   Write(fp,' staff')
			 Else
			   Write(fp,' staves')
		       End
		 End;
	Potion_t : Begin
		     With Potion[Index] Do
		       Begin
			 If Player.Blind Then
			   If Quan > 1 Then
			     Write(Fp,Quan:0)
			   Else
			     Write(Fp,'a')
			 Else If Is_Id Then
			   Write_With_A_An_Or_Number(Fp,Name,N_Leng,Another)
			 Else
			   Write_With_A_An_Or_Number(Fp,Desc,D_leng,Another);
			 If Quan > 1 Then
			   Write(Fp,' potions')
			 Else
			   Write(Fp,' potion')
		       End
		   End;
	Scroll_t : Begin
		     With Scroll[Index] Do
		       If Is_id Then
			 If Player.Blind Then
			   If Quan > 1 Then
			     Write(Fp,Quan:0,' scrolls')
		           Else
			     Write(Fp,'a scroll')
		         Else
			   Begin
			     If Quan > 1 Then
			       If Another Then
				 Write(Fp,Quan:0,' more scrolls of ')
			       Else
				 Write(Fp,Quan:0,' scrolls of ')
			     Else If Another Then
			       Write(fp,'another scroll of ')
			     Else
			       Write(Fp,'a scroll of ');
			     Write(Fp,Name:N_leng)
			   End
		       Else
			 Begin
			   If Quan > 1 Then
			     Begin
			       Write(Fp,Quan:0);
			       If Another and (Not Player.Blind) Then
				 Write(fp,' more scrolls')
			       Else
				 Write(fp,' scrolls')
			     End
			   Else
			     Begin
			       If Another and (Not Player.Blind) Then
				 Write(Fp,'another scroll')
			       Else
				 Write(Fp,'a scroll')
			     End;
			   If Not Player.Blind Then
			     Begin
			       If Called Then
				 Write(Fp,' called ')
			       Else
				 Write(Fp,' titled "');
			       Write(Fp,Desc:D_leng);
			       If Not Called Then
				 Write(Fp,'"')
			     End
			 End
		   End;
	Ring_t : Begin
		   With Ring[Index] Do
		     If Is_Id Then
		       If (Quan = 1) Then
			 Begin
			   If Not Know_The_magic Then
			     If Another Then
			       Write(fp,'another ')
			   Else
			     Write(Fp,'a ');
			   Write(Fp,'ring of ',Name:N_leng);
			 End
		       Else
			 Write(Fp,'Error - Ring quantity not 1')
		     Else
		       Begin
			 Write_With_A_An_Or_Number(Fp,Desc,D_leng,Another);
			 Write(Fp,' ring')
		       End
		 End;
	Armor_t : Begin
		    If Another Then
		      Write(fp,'more ');
		    Write(Fp,Armor[Index].Name:Armor[Index].N_leng)
		  End;
	Weapon_t : Begin
		     With Weapon[Index] Do
		       If Know_The_magic Then
			 Write(Fp,Name:N_leng)
		       Else
			 Write_with_a_an_or_number(fp,name,n_leng,Another);
		     If Quan > 1 Then
		       Write(Fp,'s');
		   End;
	Food_t : Begin
		   If (Index = 0) Then
		     If (Quan <= 1) Then
		       If Another Then
			 Write(Fp,'more food')
		       Else
			 Write(Fp,'some food')
		     Else If Another Then
		       Write(Fp,Quan:0,' more rations of food')
		     Else
		       Write(Fp,Quan:0,' rations of food')
		   Else
		     Begin
		       Len := Name_Len;
		       More := True;
		       While More Do
			 If Len = 0 Then
			   More := False
		         Else If (Fruit_Name[Len] <> ' ') Then
			   More := False
		         Else
			   Len := Len - 1;
		       Write_with_a_an_or_number(Fp,Fruit_name,Len,Another)
		     End
		 End;
	Amulet_t : Write(Fp,'the AMULET of YENDOR!!!');
	Others : Write(Fp,'Error - Unknown type of object in Write_obj_name')
      End;
      If Know_The_magic And (Obj_typ = Wand_t) Then
	Write(fp,' [',Plus_hit:0,']');
      If ((Obj_typ = Weapon_t)
	  and (Index in [Wp_rocks,Wp_bolts,Wp_arrows,Wp_sil_arrows])
	  and Know_The_magic and (Quan > 1)) Then
	Write(fp,' [',Quan:0,']')
    End
End; (* Write_obj_name *)


Procedure Get_Treasure(X,Y : Integer);
Var
  P,Q : Obj_Ptr;
  More, Found, Silly : Boolean;
  I : Integer;
Begin (* Get_Treasure *)
  P := World.Objs;
  Q := Nil;
  Found := False;
  More := True;
  While (More) Do
    If (P = NIL) Then
      More := False
    Else If ((P^.Loc.X = X) And (P^.Loc.Y = Y)) Then
      Begin
	Found := True;
	More := False
      End
    Else
      Begin
	Q := P;
	P := P^.Next;
      End;
    If (Not Found) Then
      Begin
	World.Obj[X,Y] := Chr(0);
	World.Lines[Y] := True;
	If Switches.Terse_swi Then
	  Echo('It was an illusion')
	Else
	  Echo('The illusion wavers as you try to pick it up, and fades')
      End
    Else
      Begin
	If Can_Carry(P) Then
	  Begin
	    Case P^.Obj_Typ of
	      Gold_T : Begin
			 Echo_Init;
			 If Not Switches.Terse_swi Then
			   write(f,'You found ');
			 Write(f,P^.Quan:0,' pieces of gold');
			 Player.Gold := Player.Gold + P^.Quan;
			 Change_stats := Change_stats![s_bottom];
			 Remove_Obj(World.Objs,Q);
			 Dispose(P);
			 Echo(s);
		       End;
	      Others : Begin
			 Echo_Init;
			 If not switches.terse_swi Then
			   Write(F,'You found ');
			 Silly := Has_one(P,False);
			 Write_obj_name(F,P,Silly);
			 If P^.Obj_typ = Amulet_t Then
			   Player.Has_amulet := True;
			 Remove_obj(World.Objs,Q);
			 Insert(Player.Obj_List,P);
			 Write(F,' (',Last_Item,')');
			 If S[1] In ['a'..'z'] Then
			   S[1] := Chr(Ord(S[1]) - 40B); (* #55 *)
			 Echo(s);
			 If (P^.Obj_typ = Scroll_t) then
			   begin
			     if ((Die(15) <= (Player.Iq-15))
				 And (Not Player.Blind)
				 And (Scroll[P^.Index].Can_ID)
				 And (Not Scroll[p^.Index].Id)) Then
			       Begin
				 Scroll[P^.Index].Id := True;
				 Echo_Init;
				 Write(F,'You know this to be ');
				 Write_obj_name(F,P,silly);
				 Echo(S)
			       End;
			     Scroll[P^.Index].Can_ID := False
			   End
		       End
	    End; (* Case *)
	    World.Obj[X,Y] := Chr(0);
	    I := World.Room_array[X,Y];
	    If (i <> 0) Then
	      If (Not World.Rooms[i].Light) Then
		World.Seen[x,y] := False
	  End
	Else
	  Begin
	    If Switches.Terse_swi Then
	      Echo('You''re carrying too much already')
	    Else
	      Echo('Your load is too heavy.  You''ll have to drop something first')
	  End
      End
End; (* Get_Treasure *)

Function Inventory (List : Obj_ptr; Which : Obj_class_type;
		    Ask_object : Boolean) : Char; (* #1 *)
Var
  Ch,Item,Low,High : Char;
  Worker : Obj_ptr;
  Have_One,More : Boolean; (* #46 *)
(*  Fp : text; *)
  I,Line : Integer;
Begin
  Inventory := Space; (* #1 *)
  Item := 'a';
  Low := 'z';
  High := 'a';
  Line := Redisp_Y_Orig;
  Have_One := False; (* #46 *)
  More := True;
  Empty_echo := True;
  Worker := List;
  If Worker <> NIL Then
    Begin
      While (Worker <> NIL) and More Do
	Begin
	  With Worker^ Do
	    If (Which in [All_t,Obj_typ]) Then
	      Begin
		If (Item < Low) Then
		  Low := Item;
		If (Item > High) Then
		  High := Item;
(*		S := Spaces;
		Strwrite(Fp,S); *)
		Echo_init;
		Write(f(*p*),Item:1,') ');
		Write_obj_name(f(*p*),Worker,Not_Another);
		If Worker = Player.Cur_wep Then
		  Write(f(*p*),' (in hand)')
		Else If Worker = Player.Cur_arm Then
		  Write(f(*p*),' (being worn)')
		Else If Worker = Player.Cur_Ring[Left_H] Then
		  Write(f(*p*),' (on left hand)')
		Else If Worker = Player.Cur_ring[Right_H] Then
		  Write(f(*p*),' (on right hand)');
		Scr_Text(Line,S);
		If Switches.Slow_swi Then
		  Begin
		    If Have_one Then
		      More := Wait_For_Space(False);
		    If More Then
		      Redisplay
		  End
		Else
		  Line := Line + 1;
		Have_One := True
	      End;
	  Worker := Worker^.Next;
	  Item := Succ(Item)
	End
    End;
  If Not Have_One Then
    Begin
      Echo('Nothing appropriate');
      Inventory := Chr(33B)
    End
  Else
    Begin
      If More Then
	Begin
	  If Ask_Object Then
	    Begin
	      Scr_Text(Line,'--Type the letter of your choice or <Space>--');
	      Redisplay;
	      DCA(47,Line);
	      Repeat
		Ch := Comand;
		If (Ch in ['A'..'Z']) Then
		  Ch := Chr(Ord(Ch) + 40B)
	      Until (Ch In [' ',Chr(33B),Low..High]);
	      If (Ch = Space) Then
		Inventory := '*'
	      Else
		Inventory := Ch
	    End
	  Else
	    Begin
	      Redisplay;
	      More := Wait_For_Space(False);
	      Inventory := '*'
	    End
	End;
      For Line := Redisp_Y_Orig to Redisp_Max_Y Do
	World.Lines[Line] := True;
      Change_Stats := [S_top,S_Bottom];
      Clear_Echo;
      Update_Screen;
      Empty_echo := True
    End
End; (* Inventory *)

(* Discard : remove from Pack *)
(* Only_One to remove only one of multivalued items (1 arrow) *)
Function Take_from_pack(Var Ch : Char; Var List : Obj_ptr;
			Which : Obj_class_type;
			Discard, Only_one : Boolean) : Obj_ptr;
Var
  Worker,Parent,Removed_obj : Obj_ptr;
  Count : Char;
Begin
  If (Ch in ['*','?']) Then (* #54 *)
    Ch := Inventory(List,Which,True); (* #1 Begin edit *)
  If (Ch = Chr(33B)) Then
    Take_from_pack := NIL
  Else If (Ch = '*') Then
    Take_from_pack := NIL
  Else (* #1 End edit *)
    Begin
      Take_from_pack := NIL;
      If (Ch > 'A') and (Ch < 'Z') Then
	Ch := Chr(Ord(Ch)+40B);
      Worker := List;
      Parent := NIL;
      Count := Chr(140B);
      While (Worker <> NIL) and (Count >= Chr(140B)) Do
	Begin
	  Count := Succ(Count);
	  If Count = Ch Then
	    Begin
	      If (Worker^.Obj_typ = Which) or (Which = All_t) Then
		Begin
		  Take_from_pack := Worker;
		  If Discard Then
		    If ((Worker^.Quan > 1) and Only_one) Then
		      Begin
			Worker^.Quan := Worker^.Quan - 1;
			New(Removed_obj);
			Removed_obj^ := Worker^;
			Removed_obj^.Quan := 1;
			Take_from_pack := Removed_obj;
		      End
		    Else If Parent = NIL Then
		      List := List^.Next
		    Else
		      Parent^.Next := Worker^.Next
		End
	      Else
		Take_from_pack := NIL;
	      Worker := NIL;
	    End
	  Else
	    Begin
	      Parent := Worker;
	      Worker := Worker^.Next
	    End
	End
    End
End; (* Take_from_pack *)

Procedure Put_on_floor(This_one:Obj_ptr; Xloc,Yloc:Integer);
Var
  Temp:Obj_ptr;
Begin
  New(Temp);
  Temp^ := This_one^;
  Temp^.Loc.X := Xloc;
  Temp^.Loc.Y := Yloc;
  Place_obj(Temp);
  With Player Do
    If (This_one = Cur_arm) Then
      Begin
	Cur_arm := NIL;
	Figure_Ac
      End
    Else If (This_one = Cur_wep) Then
      Cur_wep := NIL
    Else If (This_one = Cur_ring[Left_H]) Then
      Cur_ring[Left_H] := NIL
    Else If (This_one = Cur_ring[Right_H]) Then
      Cur_ring[Right_H] := NIL;
end; (* Put_on_floor *)

Procedure Name_obj(This_one:Obj_ptr);
Var
  New_Desc : Name_String;
  New_Len : Integer;
Begin
  Echo('Call it:');
  Move_To_Echo;
  If Get_Line(New_Desc,New_Len) Then (* #54 *)
    With This_one^ Do
      If New_Len > 0 Then
	Case Obj_typ Of
	  Ring_t:   Begin
		      Ring[Index].Desc := New_Desc;
		      Ring[Index].D_leng := New_Len;
		      Ring[Index].Called := True
		    End;
	  Wand_t:   Begin
		      Wand[Index].Desc := New_Desc;
		      Wand[Index].D_leng := New_Len;
		      Wand[Index].Called := True
		    End;
	  Scroll_t: Begin
		      Scroll[Index].Desc := New_Desc;
		      Scroll[Index].D_leng := New_Len;
		      Scroll[Index].Called := True
		    End;
	  Potion_t: Begin
		      Potion[Index].Desc := New_Desc;
		      Potion[Index].D_leng := New_Len;
		      Potion[Index].Called := True
		    End;
	  Others:   Writeln(tty,'Error - Bad object type in name_obj')
	End
      Else (* #54 Ok, they typed <CR>, give them the old name *)
	Case Obj_typ Of
	  Ring_t : Ring[Index].Called := True;
	  Wand_t : Wand[Index].Called := True;
	  Scroll_t : Scroll[Index].Called := True;
	  Potion_t : Potion[Index].Called := True;
	  Others : Writeln(tty,'Error - Bad object type in name_obj')
	End;
  Clear_Echo;
  Redisplay;
  Empty_Echo := True
End; (* Name_obj *)

Procedure Translate_Direction (Dir : Char; Var Dx, Dy : Integer); (* #6 new *)
Begin (* Translate_Direction *)
  If Dir in ['7','8','9','y','u','k','Y','U','K'] Then
    dy := -1
  Else If Dir in ['1','2','3','j','J','b','B','n','N'] Then (* #6 *)
    dy := 1
  Else
    dy := 0;
  if dir in ['1','4','7','y','h','b','Y','H','B'] Then
    dx := -1
  Else If dir in ['9','6','3','l','L','u','U','n','N'] Then (* #6 *)
    dx := 1
  Else
    dx := 0
End; (* Translate_Direction *)

Function Get_direction : Char;
Var
  Ch : Char;
begin
  Empty_echo := True;
  Repeat
    Echo('Direction?');
    Move_To_Echo;
    Ch := Comand;
    If Not (Ch In Okdirs) Then
      Begin
	Empty_echo := True;
	Echo('Please specify a one-character direction')
      End
  Until (Ch In Okdirs);
  Get_direction := Ch
end;

Procedure Place_Next_To (Source : Loc_Type;
	       Var Dest : Loc_Type;
	       Is_Obj : Boolean);
Var
  I, J : Integer;
  X_Disp, Y_Disp : Array[0..2] Of Integer;
  Tmp : Loc_Type;
  Found : Boolean;
Begin (* Place_Next_To *)
  Dest := Source;
  Repeat
    If ((Dest.X < X_Orig) or (Dest.X > S_Max_X)) Then
      Dest.X := Die(S_Max_X);
    If ((Dest.Y < Y_Orig) or (Dest.Y > S_Max_Y)) Then
      Dest.Y := Die(S_Max_Y);
    Tmp := Dest;
    X_Disp[0] := Die(3)-2;
    Repeat
      X_Disp[1] := Die(3)-2
    Until (X_Disp[0] <> X_Disp[1]);
    X_Disp[2] := -(X_Disp[0] + X_Disp[1]);
    Y_Disp[0] := Die(3)-2;
    Repeat
      Y_Disp[1] := Die(3)-2
    Until (Y_Disp[0] <> Y_Disp[1]);
    Y_Disp[2] := -(Y_Disp[0] + Y_Disp[1]);
    I := 0;
    Found := False;
    Repeat
      Dest.X := Tmp.X + X_Disp[I];
      J := 0; (* #58 *)
      If ((Dest.X >= X_Orig) and (Dest.X <= S_max_x)) Then
	Repeat
	  Dest.Y := Tmp.Y + Y_Disp[J];
	  If ((Dest.Y >= Y_Orig) and (Dest.Y <= S_Max_y)) Then
	    If ((Dest.X <> Source.X) or (Dest.Y <> Source.Y)) Then
	      If World.S_World[Dest.X,Dest.Y] In ['.','^','#','+'] Then
		If Is_Obj Then
		  Begin
		    If (World.Obj[Dest.X,Dest.Y] = Chr(0)) Then
		      Found := True
		  End
		Else If (World.Mon[Dest.X,Dest.Y] = Chr(0)) Then
		  Found := True;
	  J := J + 1
	Until ((J = 3) or Found);
      I := I + 1
    Until ((I = 3) or Found);
  Until Found;
End; (* Place_Next_To *)

Procedure No_more_blindness;
Var
  I : Integer;
Begin
  Player.Blind_count := 0;
  Player.Blind := False;
  For I := Y_orig to S_max_y Do
    World.Lines[I] := True;
  Echo('The cloak of darkness lifts')
end;

Procedure Take_It_Off(Which:Obj_ptr); Forward;

Procedure Give_cursed_message;
Begin
  Empty_echo := True;
  Echo('You can''t.  It appears to be cursed')
End;

procedure give_stuck_message;
begin
  empty_echo := true;
  Echo_Init;
  Write(f,'You have been ');
  Case Die(3) Of
    1 : Write(f,'entrapped ');
    2 : Write(f,'ensnared ');
    3 : Write(f,'captured ');
  End;
  Case Die(3) Of
    1 : Write(f,'by the fiend');
    2 : Write(f,'by the monster');
    3 : Write(f,'by the beastie');
  End;
  If Not Switches.Terse_swi Then
    Write(f,' and can''t move');
  Echo(s)
End;

(* Procedure Magic_Mapping; Forward; (* #6 debug *)

Procedure Down_a_level;
Begin (* Down_a_level *)
  Gen_Level(World);
  New_Place_Player;
  Player_Appears;
  Change_stats := [s_bottom];
(*  Magic_Mapping; (* #6 debug *)
  Update_Screen;
End; (* Down_a_level *)

Function Choose_Item (Typ : Action_Type; O_Typ : Obj_Class_Type;
		      Discard,Only_1 : Boolean) : Obj_Ptr; (* #54 *)
Var
  More : Boolean;
  Ch : Char;
  This_one : Obj_ptr;
Begin (* Choose_Item *)
  This_one := NIL;
  More := True;
  Loop
    If Switches.Terse_swi Then
      Case Typ Of
	Eat_A : Echo('Eat what?');
	Put_On_A : Echo('Put on what?');
	Zap_A : Echo('Zap what?');
	Read_A : Echo('Read what?');
	Quaff_A : Echo('Quaff what?');
	Wear_A : Echo('Wear what?');
	Wield_A : Echo('Wield what?');
	Call_A : Echo('Call what?');
	Drop_A : Echo('Drop what?');
	Identify_A : Echo('Identify what?');
	Throw_A : Echo('Throw what?');
	Others : Echo('Oh god!  Choose_Item called illegally')
      End
    Else
      Case Typ Of
	Eat_A : Echo('What do you wish to eat (* for list)?');
	Put_On_A : Echo('Which ring do you wish to put on (* for list)?');
	Zap_A : Echo('What to you wish to zap with (* for list)?');
	Read_A : Echo('What to you wish to read (* for list)?');
	Quaff_A : Echo('What to you wish to quaff (* for list)?');
	Wear_A : Echo('Which armor do you wish to wear (* for list)?');
	Wield_A : Echo('Which weapon do you wish to wield (* for list)?');
	Call_A : Echo('Which item do you wish to call (* for list)?');
	Drop_A : Echo('Which item do you wish to drop (* for list)?');
	Identify_A : Echo('What do you want to identify (* for list)?');
	Throw_A : Echo('What do you want to throw (* for list)?');
	Others : Echo('Oh god!  Choose_Item called illegally')
      End;
      Move_To_Echo;
      Ch := Comand;
      More := (Ch <> Chr(33B));
      If More Then
	Begin
	  This_one := Take_from_pack(Ch,Player.Obj_list,O_Typ,Discard,Only_1);
	  More := (This_one = NIL) and (Ch <> Chr(33B))
	End
      Else
	Begin
	  Clear_echo;
	  Redisplay
	End;
      Exit If Not More;
      If Not (Ch In ['*','?']) Then
	Begin
	  Empty_echo := True;
	  If (Switches.Terse_swi) Then
	    Case Typ Of
	      Eat_A : Echo('You can''t eat that!');
	      Put_On_A : Echo('You can''t put that on!');
	      Zap_A : Echo('You can''t zap that!');
	      Read_A : Echo('That''s illegible!');
	      Quaff_A : Echo('That''s undrinkable!');
	      Wear_A : Echo('You can''t wear that!');
	      Wield_A : Echo('You can''t wield that!');
	      Call_A, Drop_A, Identify_A : Echo('You don''t have that!');
	      Throw_A : Echo('You can''t throw that!');
	      Others : Echo('You can''t!')
	    End
	  Else
	    Case Typ Of
	      Eat_A : Echo('Icky-poo! Why would you want to eat that?');
	      Put_On_A : Echo('You can''t put that on your finger!');
	      Zap_A : Echo('You can''t zap with that!');
	      Read_A : Echo('You can''t read that!');
	      Quaff_A : Echo('You can''t drink that!');
	      Wear_A : Echo('You can''t wear that!');
	      Wield_A : Echo('You can''t wield that!');
	      Call_A : Echo('You have no such object');
	      Drop_A : Echo('That is not a valid object to drop');
	      Identify_A : Echo('That is not a valid object to identify');
	      Throw_A : Echo('You can''t throw that!');
	      Others : Echo('You can''t and you won''t!')
	    End
	End;
  End;
  Choose_Item := This_one
End; (* Choose_Item *)

Function Drop : Boolean;
Var
  This_one : Obj_ptr;
  Hand : Hand_Type;
  More : Boolean;
Begin
  Drop := False;
  If (World.Obj[Player.Loc.X,Player.Loc.Y] <> Chr(0)) Then
    Echo('You can''t.  There is something there already')
  Else
    Begin
      This_One := Choose_Item(Drop_A,All_T,True,False); (* #54 *)
      If This_One <> NIL Then
	Begin
	  More := True;
	  If This_one = Player.Cur_wep Then
	    If Player.Cur_wep^.Cursed Then
	      Begin
		Insert(Player.Obj_list,This_one);
		More := False;
		Give_cursed_message
	      End;
	  If This_one = Player.Cur_arm Then
	    Begin
	      Insert(Player.Obj_list,This_one);
	      More := False;
	      Empty_echo := True;
	      If Switches.Terse_swi Then
		Echo('Take it off first')
	      Else
		Echo('You must take it off before you drop it')
	    End;
	  For Hand := Left_h To Right_H Do
	    If (This_one = Player.Cur_ring[Hand]) Then
	      If Player.Cur_ring[Hand]^.Cursed Then
		Begin
		  Insert(Player.Obj_list,This_one);
		  More := False;
		  Give_cursed_message
		End
	      Else
		Take_it_off(This_one);
	  If More Then
	    Begin
	      Drop := True;
	      Put_on_floor(This_one,Player.Loc.X,Player.Loc.Y);
	      Empty_echo := True;
	      Echo_Init;
	      Write(F,'Dropped ');
	      Write_obj_name(F,This_one,Not_Another);
	      Echo(S);
	      If This_one^.Obj_typ = Amulet_t Then
		Player.Has_amulet := False
	    End
	End
    End
End; (* Drop *)

			    (* *********
			     * Scrolls *
			     ***********)
Procedure Enchant_Armor;
Begin (* Enchant_Armor *)
  If (Player.Cur_Arm <> Nil) Then
    Begin
      Echo_Init;
      If Not Switches.Terse_Swi Then (* #54 *)
	Write(F,'As the scroll vanishes, ');
      With Armor[Player.Cur_arm^.Index] Do
	Write(F,'your ',Name:N_leng,' glows blue');
      If S[1] In ['a'..'z'] Then
	S[1] := Chr(Ord(S[1]) - 40B); (* #55 *)
      Echo(s);
      Player.Cur_Arm^.Plus_Hit := Player.Cur_Arm^.Plus_Hit + 1;
      Player.Cur_Arm^.Cursed := false;
      Figure_ac
    End
End; (* Enchant_Armor *)

Procedure Enchant_Weapon;
Var Plus : Integer;
Begin (* Enchant_Weapon *)
  If (Player.Cur_Wep <> Nil) Then
    Begin
      Echo_Init;
      If Not Switches.Terse_Swi Then
	Write(F,'As the scroll vanishes, ');
      With Weapon[Player.Cur_Wep^.Index] do
	Write(F,'your ',Name:N_Leng,' twists in your hand');
      If S[1] In ['a'..'z'] Then
	S[1] := Chr(Ord(S[1]) - 40B); (* #55 *)
      Echo(s);
      Plus := 1 + Ord(Die(5) = 1);
      If Die(2) = 1 Then
	Player.Cur_Wep^.Plus_Hit := Player.Cur_Wep^.Plus_Hit + Plus
      Else
	Player.Cur_Wep^.Plus_Dam := Player.Cur_Wep^.Plus_Dam + Plus;
      Player.Cur_wep^.Cursed := False
    End
End; (* Enchant_Weapon *)

Procedure Identify (Known : Boolean);
Var
  This_one : Obj_ptr;
Begin (* Identify *)
  If Not Known Then
    Echo('This scroll is an identify scroll');
  Scroll[s_identify].Id := True;
  This_one := Choose_Item(Identify_A,All_T,False,False); (* #54 *)
  If (This_one <> NIL) Then
    Begin
      Case This_one^.Obj_Typ of
	Ring_t : Ring[This_one^.Index].Id := True;
	Wand_t : Wand[This_one^.Index].Id := True;
	Scroll_t : Scroll[This_one^.Index].Id := True;
	Potion_t : Potion[This_one^.Index].Id := True
      End;
      Empty_echo := True;
      Echo_Init;
      This_one^.Know_magic := True;
      Write_obj_name(F,This_one,Not_another);
      Echo(S)
    End
End; (* Identify *)

Procedure Check_Player_Level;
Var
  T : Integer;
Begin (* Check_Player_Level *)
  With Player Do
    While Xp >= Two_to_the(Level-1) * 10 do
      Begin
	Echo_Init;
	Level := Level+1;
	Write(F,'Welcome to level ',Player.Level:0);
	Echo(S);
	T := Max(Die(10),Die(10));
	Hp := Hp+T;
	Max_hp := Max_hp+T;
	If player.level = 5 Then
	  begin
	    Echo('Through past experience, you now know your abilities well');
	    Change_stats := Change_stats![s_top];
	  end;
	Change_stats := Change_stats![s_bottom];
      End
End; (* Check_Player_Level *)

Procedure Genocide;
Var
  Y_or_n,Ch : Char;
  Mon_Num : Integer; (* #55 *)

  Procedure Remove_Monsters(Var L : Mon_Ptr; Idx : Integer);
  Var
    T : Mon_Ptr;
  Begin (* Remove_Monsters *)
    If (L <> Nil) Then
      Begin
	If (L^.Index = Idx) Then
	  Begin
	    (* Remove this monster from the Screen Arrays *)
	    World.Mon[L^.Loc.X,L^.Loc.Y] := Chr(0);
	    World.Lines[L^.Loc.Y] := True;
	    Player.Xp := Player.Xp + Monster[L^.Index].XPVal;
	    If (L^.Index In [M_mimic,M_fungi]) Then
	      Player.Stuck := False
	    Else If (l^.Index = M_purple) Then
	      If (Player.Eaten_Count > 0) Then
		Begin
		  If World.Mon[Player.Loc.X,Player.Loc.Y] = Chr(0) Then
		    Begin
		      World.Mon[Player.Loc.X,Player.Loc.Y] := '@';
		      Player_Appears
		    End;
		  Monster[m_purple].AC := 6;
		  Player.Eaten_Count := 0;
		  Player.Stuck := False (* #52 *)
		End;
	    World.Num_mons := World.Num_mons - 1;
	    (* Delink this monster *)
	    T := L;
	    L := L^.Next;
	    Dispose(T);
	    Remove_Monsters(L,Idx) (* Get the rest of the icky-bobs *)
	  End
	Else
	  Remove_Monsters(L^.Next,Idx) (* Remove the others from the list *)
      End
  End; (* Remove_Monsters *)

Begin (* Genocide *)
  Echo('You have been granted the boon of genocide');
  Repeat
    Y_or_n := 'n';
    Echo('Which monster?');
    Move_To_Echo;
    Ch := Comand;
    Empty_echo := True;
    If Not (Ch In Okmons) Then
      Echo('Please specify a letter in the alphabet')
    Else
      Repeat
	If Ch >= 'a' Then
	  Mon_Num := Ord(Ch) - Mon_hi_offset (* #55 *)
	Else
	  Mon_Num := Ord(Ch) - Mon_lo_offset;
	Echo_Init;
	Write(F,'You have specified: ');
	With Monster[Mon_Num] Do (* #55 *)
	  Write(F,Long_name:Len,'... is this correct?');
	Echo(S);
	Move_To_Echo;
	Y_or_n := Comand
      Until (Y_or_n In ['y','n','Y','N'])
  Until (Ch In Okmons) and (Y_or_n In ['y','Y']);
  Monster[Mon_Num].Min_level := Maxint;	(* goodbyeee *)
  OkMons := OkMons - [Ch]; (* #55 remove this monster from genocidable ones *)
  Remove_Monsters(World.Monsters,Mon_Num);
  Check_Player_Level
end; (* Genocide *)

Procedure Scare_monster;
Begin (* Scare_monster *)
  Echo('You hear maniacal laughter in the distance');
  Scare_count := Scare_count+20+Die(10)
End; (* Scare_monster *)

Procedure Remove_curse;
Begin
  Echo('You feel as if someone is watching over you');
  With Player Do
    Begin
      If Cur_arm <> NIL Then
	Cur_arm^.Cursed := False;
      If Cur_wep <> NIL Then
	Cur_wep^.Cursed := False;
      If Cur_ring[Left_H] <> NIL Then
	Cur_ring[Left_H]^.cursed := False;
      If Cur_ring[Right_H] <> NIL Then
	Cur_ring[Right_h]^.Cursed := False
    End
End; (* Remove_curse *)

Procedure Magic_mapping;
Var
  I,J : Integer;
  T : Trap_Ptr;	(* #6 *)
Begin (* Magic_mapping *)
  Echo('Oh, now this scroll has a map on it...');
  For I := 1 To Max_room Do
    If World.Rooms[I].Existant Then
      For J := 1 To Max_doors Do
	With World.Rooms[I] Do
	  If Doors[J].Secret > 0 Then
	    Begin
	      Doors[J].Secret := 0;
	      World.S_world[Doors[J].Abs_loc.X,Doors[J].Abs_loc.Y] := '+'
	    End;

  T := World.Traps; (* #6 add trap finding routine *)
  While T <> NIL Do
    Begin
      T^.Chance := 0;
      World.S_world[T^.Loc.X,T^.Loc.Y] := '^';
      World.Seen[T^.Loc.X,T^.Loc.Y] := True;
      T := T^.Next
    End; (* #6 End of New routine *)

  For J := Y_orig To S_max_y Do
    Begin
      World.Lines[J] := True;
      For I := X_orig To S_max_x Do
	If World.S_world[I,J] In ['-','|','+','%','#'] Then
	  World.Seen[I,J] := True
    End;
  Player_Appears; (* #54 *)
  Update_screen
End; (* Magic_mapping *)

Procedure Nothing_Scroll;
Begin
  case blank_message of
    1: echo('This scroll appears to be blank');
    2: echo('You hear a high-pitched humming noise in the distance');
    3: echo('You hear a rustling in the shadows behind you');
  end;
end;

Procedure Teleportation;
var i,j:integer;
Begin
  Player.Stuck := False;
  If (Player.Eaten_Count = 0) Then
    World.Mon[Player.Loc.X,Player.Loc.Y] := Chr(0);
  Monster[m_purple].AC := 6;
  Player.Eaten_Count := 0;
  Player.Prev := Player.Loc;
  Pick_a_place(Player.Loc.X,Player.Loc.Y);
  World.Mon[Player.Loc.X,Player.Loc.Y] := '@';
  Player_Jumps
End; (* Teleportation *)

Function Pick_Random_Object (Var Ch : Char) : Obj_Ptr;
Var
  I, Max : Integer;
  Object : Obj_Ptr;
Begin
  Max := Die(Max_Item);
  Ch := 'a';
  Object := Player.Obj_list;
  For I := 1 To Max Do
    Begin
      Object := Object^.Next;
      Ch := Succ(Ch);
      If (Object = NIL) Then
	Begin
	  Object := Player.Obj_list;
	  ch := 'a';
	end;
    end;
  Pick_Random_Object := Object
End;

Procedure Cancellation;
Var
  Cancel : obj_ptr;
  Saved_Obj : Boolean;
  Hand : Hand_Type;
  Ch : Char;
Begin (* Cancellation *)
  Echo_Init;
  Cancel := Pick_Random_Object(Ch);
  If (Cancel <> NIL) Then
    With Cancel^ Do
      Begin
	Case Obj_Typ Of
	  Ring_T : Saved_Obj := (Die(20) >= 17);
	  Wand_T : If Wand[Index].Is_Wand Then
		     Saved_Obj := (Die(20) >= 15)
		   Else
		     Saved_Obj := (Die(20) >= 13);
	  Scroll_T : Saved_Obj := (Die(20) >= 19);
	  Potion_T : Saved_Obj := (Die(20) >= 20);
	  Armor_T : Saved_Obj := (Die(20) >= 11);
	  Weapon_t : Saved_Obj := (Die(20) >= 9);
	  Others : Saved_Obj := True
	End; (* Case Obj_Typ *)
	If Not Saved_Obj Then
	  Begin
	    Plus_Hit := 0;
	    Plus_Dam := 0;
	    Cursed := False;
	    Case Obj_Typ of
	      Ring_T :
	      Begin
		For Hand := Left_H To Right_H Do
		  If (Player.Cur_Ring[Hand] <> NIL) Then
		    if (Player.Cur_Ring[Hand] = Cancel) Then
		      If (Index = R_resur) Then
			Begin
			  If (Plus_Dam > 0) Then
			    Begin (* He is now REALLY Dead! *)
			      Echo('The wand cancels the magic of your ring and you are dead!');
			      Dead := True;
			      Want_Scores := True;
			      Killer := '=';
			    end; (* He is now REALLY Dead! *)
			End
		      Else
			Take_it_off(Cancel)
	      End;
	      Armor_T : Figure_Ac;
	      Scroll_T : Index := s_nothing;
	      Potion_T : Index := p_nothing;
	      Others:;
	    End (* Case Obj_Typ *)
	  End (* If Not Saved_Obj *)
      End (* With Cancel^ *)
End; (* Cancellation *)

Procedure Alchemy; (* Convert some item into something else *)
Var
  Stolen : Obj_Ptr;
  Typ : Obj_Class_Type;
  Index, I : Integer;
  Ch : Char;
  Hand : Hand_Type;
Begin
  Echo_Init;
  Stolen := Pick_Random_Object(Ch);
  if (Stolen <> NIL) Then
    Begin
      stolen := take_from_pack(ch,player.obj_list,all_t,true,false);
      with player do
	if stolen = cur_arm Then
	  Begin
	    cur_arm := nil;
	    Figure_Ac;
	  End
	Else If (Stolen = Cur_wep) Then
	  cur_wep := nil
	Else
	  For Hand := Left_H To Right_H Do
	    If Not Dead Then
	      If (Stolen = Cur_ring[Hand]) Then
		Begin
		  Cur_Ring[Hand] := NIL;
		  If (Stolen^.Index <> R_Resur) Then
		    Take_it_off(Stolen)
		  Else If (Stolen^.Plus_Dam > 0) Then
		    Begin
		      Echo('As your ring is transformed your life force drains away');
		      Echo('You are dead!');
		      Killer := '=';
		      Dead := True;
		      Want_Scores := True
		    End
		End;
	Index := 0;
	While Index = 0 do
	  Begin
	    I := Die (Max_Chance);
	    Index := 1;
	    While (I > Treasure[Index].Chance) do
	      Begin
		I := I - Treasure[Index].Chance;
		Index := Index + 1;
	      End;
	    (* Return the numbers *)
	    Typ := Treasure[Index].Typ;
	    Index := Treasure[Index].Index;
	  End;
	Stolen^.Obj_Typ := Typ; (* Defaults *)
	Stolen^.Index := Index;
	Stolen^.Plus_Hit := 0;
	Stolen^.Plus_Dam := 0;
	Stolen^.Know_magic := False;
	Stolen^.Quan := 1;
	Magic_Aids(I,Index,Stolen,Typ); (* NOTE: I is bogus here... *)
	Insert(Player.Obj_List,Stolen)
    End (* if (Stolen <> NIL) *)
End; (* Alchemy *)

Procedure Curing;
Begin (* curing *)
  If (Player.Hp < Player.Max_Hp) Then
    Begin
      Player.Hp := Min(Player.Hp+Die(16)+5,Player.Max_Hp);
      empty_echo := true;
      Echo('You begin to feel better');
    End
  Else
    Begin
      Player.Max_hp := Player.Max_hp+1;
      Player.Hp := Player.Hp+1;
      Echo('You feel more virile now');
    End;
  If (Player.Blind_count > 0) Then
    No_more_blindness;
  Change_stats := Change_stats![s_bottom];
End; (* Curing *)

Procedure Summon_monster;
Var
  other : Loc_type;
  M : Mon_ptr;
Begin (* Summon_monster *)
  Place_next_to(Player.Loc,Other,False);
  Gen_monster(World.Level,0,M,True);
  If (M^.Index <> M_mimic) Then
    M^.Loc := Other;
  Place_monster(M);
  World.Lines[m^.loc.y] := True;
  Update_Screen;
End; (* Summon_monster *)

Procedure Light;
Var Room:Integer;
Begin
  Room := World.Room_array[Player.Loc.X,Player.Loc.Y];
  If (Room <= 0) Then
    Begin
      If Player.Blind Then
	Echo('Nothing happens')
      Else
	Echo('The corridor glows and then fades')
    End
  else
    Begin
      If Player.Blind Then
	Echo('Nothing happens')
      Else If World.Rooms[Room].Light Then
	Echo('The room is already lit')
      Else
	Echo('The room is now lit');
      World.Rooms[Room].Light := True;
      World.Rooms[Room].Seen := False;
      Draw_room(Room,True)
    End;
  Update_screen
End;

Procedure Hold_Portal;
Var
  I,Room : Integer;
Begin
  Room := World.Room_Array[Player.Loc.X,Player.Loc.Y];
  If (Room <> 0) Then
    With World.Rooms[Room] do
      Begin
	For I := 1 To Max_Doors Do
	  If (Doors[I].Abs_loc.X <> 0) and (Doors[I].Abs_loc.Y <> 0) Then
	    If (World.Mon[Doors[I].Abs_Loc.X,Doors[I].Abs_Loc.Y] = Chr(0)) Then
	      Begin
		Doors[I].Secret := 5;
		World.Lines[Doors[I].Abs_loc.Y] := True;
		If ((I = 1) or (I = 3)) Then
		  World.S_world[Doors[I].Abs_loc.X,Doors[I].Abs_loc.Y] := '-'
		Else
		  World.S_world[Doors[I].Abs_loc.X,Doors[I].Abs_loc.Y] := '|'
	      End;
	Update_Screen
      End
End;

Function Eat_Food : Boolean;
Var
  Ch : Char;
  This_One : Obj_Ptr;
Begin (* Eat_Food *)
  Eat_Food := False;
  This_one := Choose_Item(Eat_A,Food_T,True,True); (* #54 *)
  If (This_one <> NIL) Then
    Begin
      Eat_Food := True;
      If This_one^.Quan = 0
	Then Dispose(This_one);
      Player.Faint_count := 0;
      Player.Last_meal := 0;
      Empty_echo := True;
      Echo_Init;
      If This_one^.Index = 1 Then
	Begin
	  Case Die(5) Of
	    1 : Write(f,'My, that was a yummy ',fruit_name);
	    2 : Write(f,'Your eyes water as you eat the ',fruit_name);
	    3 : Write(f,'Yecch!  That was a putrid ',fruit_name);
	    4 : Write(F,'What a satisfying ',fruit_name);
	    5 : Write(f,'That was a very refreshing ',fruit_name);
	  End;
	  Player.invis_count := Player.invis_count+75+die(50);
	End
      else
	Case Die(7) of
	  1 : Write(f,'My, that tasted good');
	  2 : Write(f,'Yecch!  That food tasted awful!');
	  3 : Write(f,'The repast was filling but tasteless');
	  4 : Write(f,'One Whopper, no onions, extra pickle and tomato down the hatch!');
	  5 : Write(f,'Your limited culinary expertise made the food taste awful');
	  6 : Write(f,'That ration tasted surprisingly like a Tommyburger');
	  7 : Write(f,'Your tastebuds are delighted and your stomach is filled');
	End;
	Echo(S);
	Change_stats := Change_stats![s_bottom]
    End
End; (* Eat_Food *)

Procedure Slow_Inventory (List:Obj_ptr); (* #54 many changes *)
Var
  This_one : Obj_ptr;
(*  Bogus : Boolean; *)
  Ch : Char;
Begin (* Slow_Inventory *)
  If Switches.Terse_swi Then
    Echo('Inventory what?')
  Else
    Echo('Which item do you want inventoried (* for all)?');
  Move_To_Echo;
  Ch := Comand;
  Empty_Echo := True;
  If (Ch = Chr(33B)) Then
    Clear_echo
  Else
    Begin
      If (Ch In ['a'..'z','A'..'Z']) Then
	Begin
	  This_one := Take_from_pack(Ch,List,All_t,False,False);
	  If (Ch = Chr(33B)) Then
	    Clear_Echo
	  Else If (This_One = NIL) Then
	    Begin
	      Empty_echo := True;
	      Echo('You don''t have such an object')
	    End
	  Else
	    Begin
	      Empty_echo := True;
	      Echo_Init;
	      If Not Switches.Terse_swi Then
		Write(F,'That is: ');
	      Write_obj_name(F,This_one,Not_Another);
	      Echo(S)
	    End
	End
      Else
	Case Ch Of
	  '*' : Ch := Inventory(List,All_T,False); (* #1 *)
	  '!' : Ch := Inventory(List,Potion_T,False); (* #1 *)
	  ')' : Ch := Inventory(List,Weapon_T,False); (* #1 *)
	  '[' : Ch := Inventory(List,Armor_T,False); (* #1 *)
	  '&' : Ch := Inventory(List,Food_T,False); (* #1 *)
	  '$' : Ch := Inventory(List,Amulet_T,False); (* #1 *)
	  '?' : Ch := Inventory(List,Scroll_T,False); (* #1 *)
	  '/' : Ch := Inventory(List,Wand_T,False); (* #1 *)
	  '=' : Ch := Inventory(List,Ring_T,False); (* #1 *)
	  Others : Echo('You have no such object')
	End
    End;
  Update_Screen	(* #61 *)
End; (* Slow_Inventory *)

Function Read_scroll : Boolean;
Var
  This_one : Obj_ptr;
Begin (* Read_scroll *)
  Read_scroll := False;
  If (Player.Blind_count > 0) Then
    Begin
      If Switches.Terse_swi Then
	Echo('You are blind')
      Else
	Echo('How can you do that?  You are blind, remember?')
    End
  Else If (Player.Eaten_Count > 0) Then
     Begin
       If Switches.Terse_swi Then
	 Echo('It''s dark in here')
       Else
	 Echo('It''s too dark in the Purple Worm''s stomach to see ANYTHING')
     End
   Else
     Begin
       This_One := Choose_Item(Read_A,Scroll_T,True,True); (* #54 *)
       If (This_One <> NIL) Then
	 Begin
	   Empty_echo := True;
	   Echo('As you read the scroll, it vanishes...');
	   Read_scroll := True;
	   If ((Player.Iq < 7) and (Die(10) <= (7 - Player.Iq))) Then
	     If Switches.Terse_swi Then
	       Echo('You lose your place')
	     Else
	       Echo('You lose your place while reading the scroll, wasting it')
	   Else
	     Begin
	       Case This_one^.Index Of
		 S_armor : Enchant_armor;
		 S_weapon : Enchant_weapon;
		 S_curse : Remove_curse;
		 S_mapping : Magic_mapping;
		 S_identify : Identify(Scroll[This_one^.Index].Id);
		 S_genocide : Genocide;
		 S_scare : Scare_monster;
		 S_nothing : Nothing_scroll;
		 S_teleport : Teleportation;
		 S_summon : Summon_monster;
		 S_light : Light;
		 S_hold : Hold_portal;
		 Others : Writeln(Tty,'Error - Non-existant scroll type');
	       End;
	       Update_Screen; (* #60 *)
	       With Scroll[This_one^.Index] Do
		 Begin
		   If (This_one^.Index In [S_mapping,S_identify,
					   S_genocide,S_teleport,S_light]) Then
		     Id := True;
		   If (Not Id) and (Not Called) and Switches.Ask_swi Then
		     Name_obj(This_one)
		 End
	     End;
	   If This_one^.Quan = 0 Then
	     Dispose(This_one)
	 End (* got a scroll *)
     End (* Not blind *)
 End; (* Read_scroll *)
 
Function Wield_weapon : Boolean;
Var
  More : Boolean;
  This_one : Obj_ptr;
Begin
  Wield_weapon := False;
  More := True;
  If (Player.Cur_wep <> NIL) Then
    If Player.Cur_wep^.Cursed Then
      Begin
	Give_cursed_message;
	More := False
      End;
  If More then
    Begin
      This_One := Choose_Item(Wield_A,Weapon_T,False,False); (* #54 *)
      If (This_One <> NIL) Then
	Begin
	  Wield_weapon := True;
	  Empty_echo := True;
	  Echo_Init;
	  Write(F,'Now wielding ');
	  Write_obj_name(F,This_one,Not_Another);
	  Echo(S);
	  Player.Cur_wep := This_one
	End (* got armor *)
    End (* Not cursed armor *)
end;

Procedure Move_Monsters (M : Mon_ptr); Forward;

Function Wear_armor : Boolean;
Var
  This_one : Obj_ptr;
Begin
  Wear_armor := False;
  If Player.Cur_arm <> NIL Then
    Echo('You are already wearing some')
  Else
    Begin
      This_one := Choose_Item(Wear_A,Armor_T,False,False); (* #54 *)
      If (This_One <> NIL) Then
	Begin
	  Wear_armor := True;
	  Empty_echo := True;
	  (* a free move for monsters while player is busy *)
	  Move_monsters(World.Monsters);
	  Echo_Init;
	  Write(F,'Now wearing ');
	  Write_obj_name(F,this_one,Not_Another);
	  Echo(S);
	  Player.Cur_arm := This_one;
	  Figure_ac;
	  This_one^.Know_magic := True
	End (* got some armor *)
    End	(* old armor uncursed *)
End; (* Wear_Armor *)

Function Take_off_armor : Boolean;
Var
  More : Boolean;
Begin
  More := True;
  Take_off_armor := False;
  If Player.Cur_arm <> NIL Then
    If Player.Cur_arm^.Cursed Then
      Begin
	Give_cursed_message;
	More := False
      End
    Else
      With player do
	Begin
	  (* a free move for monsters while player is busy *)
	  Move_monsters(World.Monsters);
	  Echo_Init;
	  Take_off_armor := True;
	  Write(F,'Was wearing ');
	  Write_obj_name(F,Cur_arm,Not_Another);
	  Echo(S);
	  Cur_arm := NIL;
	  Figure_ac
	End
  Else
    Echo('But you aren''t wearing any armor!')
End;

			    (* *******)
			    (* Rings *)
			    (* *******)

Procedure On_R_Dexterity (How_much : Integer);
Begin (* On_R_Dexterity *)
  Player.Max_dx := Player.Max_dx + How_much;
  Player.Dx := Player.Dx + How_much;
  Change_stats := Change_stats![S_top]
End; (* On_R_Dexterity *)

Procedure On_R_Strength (How_much : Integer);
Begin (* On_R_Strength *)
  Player.Max_st := Player.Max_st + How_much;
  Player.ST := Player.ST + How_much;
  Change_stats := Change_stats![S_top]
End; (* On_R_Strength *)

Procedure On_R_Intelligence (How_much : Integer);
Begin (* On_R_Intelligence *)
  Player.Max_iq := Player.Max_iq + How_much;
  Player.IQ := Player.IQ + How_much;
  Change_stats := Change_stats![S_top]
End; (* On_R_Intelligence *)

Procedure On_R_Resurrection (p : Integer);
Begin (* On_R_Resurrection *)
  If (p <= 0) Then
    Begin
      Echo('Your life force drains into the fell ring on your finger');
      Echo('You are dead!');
      Killer := '=';
      Dead := True;
      Want_Scores := True
    End;
End; (* On_R_Resurrection *)

Function Put_on_ring : Boolean;	(* #54 a few changes *)
Var
  Hand : Char;
  This_one : Obj_ptr;
Begin
  Put_on_ring := False;
  If ((Player.Cur_ring[Left_H] <> NIL) and
      (Player.Cur_ring[Right_H] <> NIL)) Then
    Begin
      If Switches.Terse_swi Then
	Echo('You have no free hand')
      Else
	Echo('You have no free hand on which to put a ring!')
    End
  Else
    Begin (* We have a free hand *)
      This_One := Choose_Item(Put_On_A,Ring_T,False,False); (* #54 *)
      If (This_One <> NIL) Then
	If ((This_one = Player.Cur_ring[Left_H])
	    or (This_one = Player.Cur_ring[Right_h])) Then
	  Begin
	    Empty_echo := True;
	    Echo('You already have that ring on')
	  End
	Else
	  Begin
	    Empty_echo := True;
	    If (Player.Cur_ring[Left_H] <> NIL) Then
	      Hand := 'R'
	    Else If (Player.Cur_ring[Right_H] <> NIL) Then
	      Hand := 'L'
	    Else
	      Loop (* #54 *)
		Echo('Which hand?');
		Move_To_Echo;
		Hand := Comand;
		If ((Hand >= 'a') and (Hand <= 'z')) Then
		  Hand := Chr(Ord(Hand) - 40B);
		Exit If (Hand In ['L','R',Chr(33B)]);
		Empty_echo := True;
		Echo('Please type "L","R" or <Esc>')
	      End;
	    If (Hand = Chr(33B)) Then (* #3 *)
	      Begin
		Clear_Echo;
		Redisplay
	      End
	    Else
	      Begin
		Empty_echo := True;
		If (Hand = 'R') Then
		  Player.Cur_ring[Right_H] := This_one
		Else
		  Player.Cur_ring[Left_H] := This_one;
		Echo_Init;
		Write(F,'Now wearing ');
		Write_obj_name(F,This_one,Not_Another);
		Echo(S);
		Case This_one^.Index Of
		  R_protect : Figure_ac;
		  R_dex : On_r_dexterity(This_one^.Plus_hit);
		  R_str : On_r_strength(This_one^.Plus_hit);
		  R_int : On_r_intelligence(This_one^.Plus_hit);
		  R_resur : On_r_resurrection(This_one^.Plus_hit);
		  Others : ;
		End;
		Update_Screen; (* #60 *)
		Put_on_ring := True
	      End (* got a hand *)
	  End (* got a ring *)
    End (* We have a free hand *)
End; (* Put_on_ring *)

Procedure Off_R_Dexterity (How_much : Integer);
Begin (* Off_R_Dexterity *)
  Player.Dx := Player.Dx - How_much;
  Player.Max_dx := Player.Max_dx - How_much;
  Change_stats := Change_stats![S_top]
End; (* Off_R_Dexterity *)

Procedure Off_R_Strength (How_much : Integer);
Begin (* Off_R_Strength *)
  Player.Max_st := Player.Max_st - How_much;
  Player.St := Player.St - How_much;
  Change_stats := Change_stats![S_top]
End; (* Off_R_Strength *)

Procedure Off_R_Intelligence (How_much : Integer);
Begin (* Off_R_Intelligence *)
  Player.Max_iq := Player.Max_iq - How_much;
  Player.Iq := Player.Iq - How_much;
  Change_stats := Change_stats![S_top]
End; (* Off_R_Intelligence *)

(* need to check if Ring of resurrection is dropped after being used *)
Procedure Off_R_Resurrection (P : Integer);
Begin (* Off_R_Resurrection *)
  If (P > 0) Then
    Begin
      Echo('As the ring is removed so is your life force...');
      Echo('You are dead!');
      Killer := '=';
      Dead := True;
      Want_Scores := True
    End
End; (* Off_R_Resurrection *)

Procedure Take_It_Off (* (Which : Obj_Ptr) *) ;
Begin
  Case which^.index of
    r_protect : Figure_Ac;
    r_dex     : Off_R_Dexterity(which^.plus_hit);
    r_str     : Off_R_Strength(which^.plus_hit);
    r_int     : Off_R_Intelligence(which^.plus_hit);
    r_resur   : Off_R_Resurrection(Which^.Plus_Dam);
    Others : ;
  End
End;

Function Remove_Ring: boolean;
Var
  Bogus,More : Boolean;
  Ch : Char;
  Hand : Hand_Type;
  The_Ring : Obj_Ptr;
Begin (* Remove_Ring *)
  Remove_ring := False;
  More := True;
  Bogus := True;
  Empty_echo := True;
  Repeat
    With Player Do
      If (Cur_ring[Right_H] = NIL) And (Cur_ring[Left_H] = NIL) Then
	Begin
	  Empty_echo := True;
	  Echo('You''re not wearing a ring');
	  More := False
	End
      Else If Cur_ring[Left_H] = NIL Then
	Ch := 'r'
      Else If Cur_ring[Right_H] = NIL Then
	Ch := 'l'
      Else
	Begin
	  Echo('Which ring?');
	  Move_To_Echo;
	  Ch := Comand;
	  If Ch = '*' Then
	    Begin
	      Echo_Init;
	      Write(F,'l) ');
	      Write_Obj_Name(f,Player.Cur_Ring[Left_H],Not_Another);
	      Scr_Text(Redisp_Y_Orig,S);
	      Echo_Init;
	      Write(f,'r) ');
	      Write_Obj_Name(F,Player.Cur_ring[Right_H],Not_Another);
	      Scr_Text(Redisp_Y_Orig+1,S);
	      Redisplay;
	      Bogus := Wait_For_Space(False);
	      Empty_Echo := True;
	      Clear_echo;
	      World.Lines[Redisp_Y_Orig] := True;
	      World.Lines[Redisp_Y_Orig+1] := True;
	      Update_Screen
	    End
	  Else If Not (Ch In ['l','r','L','R',Chr(33B)]) Then
	    Begin
	      Empty_Echo := True;
	      Echo('Please type "l", "r", "*", or <esc>')
	    End
	End
  Until (Ch in ['l','r','L','R',Chr(33B)]) or (Not More);
  If (Ch = Chr(33B)) Then
    Begin
      Clear_Echo;
      Redisplay
    End
  Else If More Then
    Begin
      Empty_echo := True;
      If (Ch In ['l','L']) Then
	Hand := Left_H
      Else
	Hand := Right_H;
      If Player.Cur_ring[Hand]^.Cursed Then
	Give_cursed_message
      Else
	Begin
	  The_Ring := Player.Cur_Ring[Hand];
	  Player.Cur_ring[Hand] := NIL;
	  Echo_Init;
	  Write(F,'Was wearing ');
	  Write_obj_name(F,The_Ring,Not_Another);
	  Echo(s);
	  Take_it_off(The_Ring);
	  Update_Screen (* #60 *)
	End;
      Remove_ring := True
    End
End; (* Remove_Ring *)

			    (* *********
			     * Potions *
			     ***********)

Procedure Random_Potion (Index : Integer);
Begin (* Random_Potion *)
  Case Die(8) Of
    1 : Echo('The potion has no discernable effect');
    2 : Echo('You''re not sure what that potion did');
    3 : Echo('You feel strange for a moment, but the feeling passes');
    4 : Echo('What an odd-tasting potion...');
    5 : Echo('That hit the spot!');
    6 : Echo('Well, you''re not thirsty anymore...');
    7 : Echo('That was a waste of a potion');
    8 : Begin
	  Echo_Init;
	  Write(f,'A bit of ',potion[Index].desc:potion[index].d_leng);
	  Write(f,' fluid dribbles down your chin');
	  Echo(s);
	End;
  End;
End; (* Random_Potion *)

Procedure Gold_detection(var id:boolean);
Var
  p:obj_ptr;
  found:boolean;
Begin
  found := false;
  p := world.objs;
  while p <> nil do
    Begin
      if p^.obj_typ = gold_t Then
	begin
	  World.Seen[p^.loc.x,p^.loc.y] := True;
	  World.Lines[P^.Loc.Y] := True;
	  Found := True
	end;
      p := p^.next;
    End;
  id := found or id;
  if found Then
    Echo('You feel greedy and sense the presence of gold')
  Else Random_Potion(P_gold_det)
end;

Procedure Monster_detection(var id:boolean);
Var
  p:mon_ptr;
  found:boolean;
begin
  found := false;
  p := world.monsters;
  Player.SeeMon_Count := Die(100) + 100;
  Player.Invis_count := Max(Player.SeeMon_Count,Player.Invis_Count);
  while p <> nil do
    begin
      World.Seeable[p^.loc.x,p^.loc.y] := True;
      World.Lines[P^.Loc.Y] := True;
      If (P^.Index = M_Mimic) Then
	Begin
	  World.Mon[P^.Loc.X,P^.Loc.Y] := Monster[M_Mimic].Name;
	  P^.Awake := True
	End;
      Found := True;
      p := p^.next
    end;
  id := found or id;
  if found Then
    Echo('Your spine chills as you sense the presence of monsters')
  else
    echo('You feel somehow reassured');
end;

Procedure Magic_detection(var id:boolean);
var p:obj_ptr;
    found:boolean;
begin
  found := false;
  p := world.objs;
  while p <> nil do
    begin
      if ((p^.obj_typ in [scroll_t,potion_t,ring_t,wand_t])
	  or (p^.plus_hit <> 0) or (p^.plus_dam <> 0)) Then
	Begin
	  World.Seen[p^.loc.x,p^.loc.y] := True;
	  World.Lines[P^.Loc.Y] := True;
	  Found := True
	End;
      p := p^.next;
    end;
  id := found or id;
  if found Then
    Echo('You feel strange and sense the presence of magic')
  Else
    Random_Potion(p_magic_det);
end;

Procedure Regain_Strength;
Begin (* Regain_Strength *)
  If (Player.St < Player.Max_St) Then
    Begin
      Player.St := Player.Max_St;
      echo('Hey!  This tastes great!  It makes you feel warm all over...');
      potion[p_reg_str].id := true;
    End
  Else
    Random_Potion(P_reg_str);
End; (* Regain_Strength *)

Procedure Regain_Intelligence;
Begin (* Regain_Intelligence *)
  If (Player.IQ < Player.Max_IQ) Then
    Begin
      Player.IQ := Player.Max_IQ;
      echo('The potion makes your head spin, but now you feel great!');
      potion[p_reg_int].id := true;
    End
  Else
    Random_Potion(p_reg_int);
End; (* Regain_Intelligence *)

Procedure Regain_Dexterity;
Begin (* Regain_Dexterity *)
  If (Player.DX < Player.Max_DX) Then
    Begin
      Player.DX := Player.Max_DX;
      Echo('The potion sends a tingling throughout your entire body. Wow!');
      Potion[P_reg_dex].Id := True
    End
  Else
    Random_Potion(P_reg_dex)
End; (* Regain_Dexterity *)

Procedure Poison;
Begin (* Poison *)
  If Not Has_on_ring(R_sustain) Then
    Begin
      Echo('You feel very sick now');
      Player.St := Player.St-Die(3)
    End
  Else
    Echo('The potion tasted very bad')
End; (* Poison *)

Procedure Feeblemind;
Begin
  Echo('You feel very stupid now');
  Player.IQ := Player.IQ-Die(3);
End;

Procedure Fumbling;
Begin
  Echo('You feel very clumsy now');
  Player.DX := Player.DX-Die(3);
end;

Procedure incr_strength;
Begin
  Echo('You feel much stronger now.  What bulging muscles!');
  Player.Max_ST := Player.Max_ST + 1;
  Player.ST := Player.ST + 1;
End;

procedure incr_intelligence;
begin
  Echo('You feel much smarter now.  Geez, what a brain');
  player.max_IQ := player.max_IQ+1;
  player.IQ := player.IQ+1;
end;

procedure incr_dexterity;
begin
  Echo('You feel much more nimble now.  Very impressive');
  player.max_DX := player.max_DX+1;
  player.DX := player.DX+1;
end;

procedure skillfulness; (* raise exp. level *)
var t:integer;
begin
  Echo('You suddenly feel much more skillful');
  player.xp := two_to_the(player.level-1) * 10;
  Check_Player_Level
end; (* skillfulness *)

Procedure Healing;
Begin (* Healing *)
  If (Player.Hp < Player.Max_Hp) Then
    Begin
      Player.Hp := Min(Player.Hp + Die(8) + 10,Player.Max_Hp);
      If Switches.Terse_swi Then
	Echo('You begin to feel better')
      Else
	Echo('As the potion enters your blood stream you begin to feel better')
    End
  Else
    Begin
      Echo('You feel more virile');
      Player.Max_hp := Player.Max_hp+1;
      Player.Hp := Player.Hp+1;
    End;
  If player.blind_count > 0 Then
    No_more_blindness
End; (* Healing *)

Procedure Extra_Healing;
Begin (* Extra_Healing *)
  If (PLayer.hp < PLayer.Max_Hp) Then
    Begin
      Player.Hp := Min(Player.Hp + Die(8) + Die(8) + 20,Player.Max_Hp);
      If Switches.Terse_swi Then
	Echo('You begin to feel much better')
      Else
	Echo('You swallow the fluid and begin to feel much better!')
    End
  Else
    Begin
      Echo('You feel exceptionally virile');
      Player.Max_hp := Player.Max_hp+1;
      Player.Hp := Player.Hp+1;
    End;
  If player.blind_count > 0 Then
    No_more_blindness
End; (* Extra_Healing *)

procedure see_invisible;
Begin
  Echo_Init;
  Write(f,'This potion tastes like the juice of a ',Fruit_Name);
  Echo(s);
  player.invis_count := 100+die(100)
End;

Procedure Haste_self;
Begin (* Haste_self *)
  If Player.Speed <> 1 Then
    Begin
      Echo('You feel yourself moving much faster');
      Player.Speed := 3;
      If Player.Speed_count = 0 Then
	Player.Speed_count := -1
      Else
	Player.Speed_count := - Player.Speed_count;
    End
  Else
    Player.Speed_count := 1
End; (* Haste_self *)

Procedure Slow_self;
Begin (* Slow_self *)
  If Player.Speed <> 3 Then
    Begin
      Echo('You become strangely sluggish');
      Player.Speed := 1;
      If Player.Speed_count = 0 Then
	Player.Speed_count := -1
      Else
	Player.Speed_count := - Player.Speed_count
    End
  Else
    Player.Speed_count := 1
End; (* Slow_self *)

Procedure Blindness;
Var
  Y : Integer;
  Was : Boolean;
Begin
  Was := Player.Blind_Count <> 0;
  Player.Blind := True;
  player.blind_count := player.blind_count+500+die(100);
  For Y := Redisp_Y_Orig to Redisp_Max_Y Do
    World.Lines[Y] := True;
  If Was Then
    Echo('Things seem a bit darker somehow')
  Else
    Echo('A cloak of darkness falls around you')
end;

Procedure Confusion;
Begin
  If Switches.Terse_Swi Then
    Echo('You feel very confused now')
  Else
    Echo('Wait, what''s going on here. Huh? What? Who?');
  If Player.Iq < 7 Then
    Player.Confused_count := 40+Die(10)+Player.Confused_count
  Else If Player.IQ > 14 Then
    Player.Confused_count := 10+Die(5)+Player.Confused_count
  Else
    Player.Confused_count := 20+Die(5)+Player.Confused_count
End;

Procedure confuse_monster;
begin
  Echo('Your hands glow red for a moment, then the color fades');
  player.will_confuse := true;
end;

Procedure Sleep;
begin
  if switches.terse_swi Then
    echo('You fall asleep')
  Else
    echo('The potion makes you feel very drowsy, and you collapse');
  player.sleep_count := die(10)+5;
end;

Procedure Paralysis;
Begin
  If Switches.Terse_swi Then
    Echo('You can''t move')
  Else
    Echo('You are frozen to the spot');
  Player.Paralyzed_count := Die(10)+5
End;

Procedure Nothing_Potion;
Begin
  Case Blank_message Of
    1: Echo('This potion tastes like water');
    2: Echo('Your vision blurs for a moment');
    3: Echo('A small insect buzzes around your head and flies away');
  end;
end;

Procedure Food_Potion; (* #54 *)
Begin (* Food_Potion *)
  Case Blank_Message Of
    1 : Echo('This potion makes your stomach stop grumbling');
    2 : Echo('This was a remarkably satisfying potion');
    3 : Echo('Yum!')
  End;
  Player.Last_Meal := -2 * Fainting_Meal;
  Player.Faint_Count := 0
End; (* Food_Potion *)

Function Quaff_potion : Boolean;
Var
  This_one : Obj_ptr;
Begin
  Quaff_potion := False;
  This_one := Choose_Item(Quaff_A,Potion_T,True,True); (* #54 *)
  If (This_One <> NIL) Then
    Begin
      Quaff_potion := True;
      Echo_Init;
      Empty_echo := True;
      Case This_one^.Index Of
	P_gold_det : Gold_detection(Potion[This_one^.Index].Id);
	P_mon_det : Monster_detection(Potion[This_one^.Index].Id);
	P_magic_det : Magic_detection(Potion[This_one^.Index].Id);
	P_reg_str : Regain_strength;
	P_reg_int : Regain_intelligence;
	P_reg_dex : Regain_dexterity;
	P_poison : Poison;
	P_feeble : Feeblemind;
	P_fumble : Fumbling;
	P_incr_str : Incr_strength;
	P_incr_int : Incr_intelligence;
	P_inc_dex : Incr_dexterity;
	P_skill : Skillfulness;
	P_healing : Healing;
	P_ex_healing : Extra_healing;
	P_invis : See_invisible;
	P_haste : Haste_self;
	P_slow : Slow_self;
	P_blind : Blindness;
	P_confuse : Confusion;
	P_confuse_mon : Confuse_monster;
	P_sleep : Sleep;
	P_paralysis : Paralysis;
	P_nothing : Nothing_potion;
	p_sustenance : Food_Potion;
	Others : Echo('Error - Non-existant potion type')
      End;
      If (This_one^.Index In [P_reg_str,P_reg_int,P_reg_dex,P_poison,P_feeble,
			      P_fumble,P_incr_str,P_incr_int,P_inc_dex]) Then
	Change_stats := Change_stats![S_top];
      If (This_one^.Index In [p_skill,p_healing,
			      p_ex_healing,p_sustenance]) Then (* #60 *)
	Change_stats := Change_stats![S_bottom];
      Update_Screen; (* #60 *)
      With Potion[This_one^.Index] Do
	Begin
	  If (This_one^.Index In [P_poison,P_feeble,P_fumble,P_skill,
				 P_healing,P_ex_healing,P_haste,P_slow,
				 P_blind,P_confuse,P_sleep,P_paralysis]) Then
	    id := true;
	  If (Not Id) and (Not Called) and Switches.Ask_swi Then
	    Name_obj(This_one)
	End;
      If This_one^.Quan = 0 Then
	Dispose(This_one)
    End
End; (* Quaff_potion *)

Function Call_obj : Boolean;
Var
  This_one : Obj_ptr;
  New_Name : Name_String;
  Nm_Len : Integer;
Begin
  Call_obj := False;
  This_One := Choose_Item(Call_A,All_T,False,False); (* #54 *)
  If (This_one <> NIL) Then (* #51 *)
    Begin
      Empty_echo := True;
      Echo_Init;
      Write(F,'Is now called: ');
      Write_obj_name(F,This_one,Not_Another);
      Echo(S);
      If (Not (This_one^.Obj_typ In [Food_t,Armor_t,Weapon_t])) Then
	Name_obj(This_one)
      Else If ((This_One^.Obj_Typ = Food_t) and (This_One^.Index = 1)) Then
	Begin (* #55 *)
	  Echo('Call it:');
	  Move_To_Echo;
	  If Get_Line(New_Name,Nm_Len) Then
	    Begin
	      If Nm_Len > 0 Then
		Fruit_Name := New_Name
	    End;
	  Clear_Echo;
	  Redisplay;
	  Empty_Echo := True
	End
    End
End; (* Call_obj *)

Function Attack(X,Y : Integer; Enforcer:Obj_ptr):Boolean; Forward;

Procedure Hurl_obj (What : Obj_ptr; Dir : Char);
Var
  Deltax, Deltay : Integer;
  Worker, Other : Loc_type;
  Missed : Boolean;
Begin (* Hurl_obj *)
  Empty_echo := True;
  If Dir = Chr(33B) Then
    Clear_echo
  Else
    Begin
      Translate_Direction(Dir,DeltaX,DeltaY); (* #6 *)
      If (Player.Eaten_Count > 0) Then
	Begin
	  Worker.X := Player.Loc.X - Deltax;
	  Worker.Y := Player.Loc.Y - Deltay;
	End
      Else
	Worker := Player.Loc;
      Repeat
	Worker.X := Worker.X + Deltax;
	Worker.Y := Worker.Y + Deltay
      Until ((World.Mon[Worker.X,Worker.Y] In ['a'..'z','A'..'Z'])
	       Or (World.S_world[Worker.X,Worker.Y] In ['|','-',' ']));
      Missed := True;
      If (World.Mon[Worker.X,Worker.Y] In ['a'..'z','A'..'Z']) Then
	If Attack(Worker.X,Worker.Y,What) Then
	  Missed := False;
      If Missed Then
	If (What^.Obj_typ = Wand_t) Then
	  If Switches.Terse_swi Then
	    Echo('The bolt missed')
          Else
	    Echo('There is a deafening roar as the bolt hits the wall')
        Else If (what^.obj_typ = weapon_t) Then
	  If (Die(10) = 1) Then
	    With Weapon[What^.Index] Do
	      Begin
		Echo_Init;
		Write(F,'Your ',Name:N_leng,' broke against the wall');
		Echo(S)
	      End
	  Else
	    Begin
	      Place_next_to(Worker,Other,True);
	      Put_on_floor(What,Other.X,Other.Y)
	    End
    End
End; (* Hurl_obj *)

Procedure Find_trap(T:Trap_ptr; Searching:Boolean);
Var
  M : Char;
Begin (* Find_trap *)
  T^.Chance := 0;
  World.S_world[T^.Loc.X,T^.Loc.Y] := '^';
  World.Lines[T^.Loc.Y] := True;
  World.Seen[T^.Loc.X,T^.Loc.Y] := True;
  M := World.Mon[T^.Loc.X,T^.Loc.Y];
  World.Mon[T^.Loc.X,T^.Loc.Y] := Chr(0);
  If (M <> '@') Then
    Update_Screen;
  World.Mon[t^.loc.x,t^.loc.y] := M;
  If Searching Then
    Begin
      Echo_Init;
      write(f,'You found a');
      Case T^.Kind Of
	T_arrow   : Write(F,'n arrow trap');
	T_bear    : Write(F,' beartrap');
	T_door    : Write(F,' trapdoor');
	T_dart    : Write(F,' dart trap');
	T_teleport: Write(F,' teleport trap');
	Others: Write(F,'Error - Unknown trap type in Find_trap')
      End;
      Echo(S)
    End
End; (* Find_trap *)

Function Search_Room(x,y:integer) : Boolean;
Var
  T:Trap_ptr;
  I,J,Inc,Room,K:Integer;
Begin (* Search_Room *)
  Room := World.Room_Array[x,y];
  Search_Room := False;
  t := world.traps;
  While T <> NIL Do
    Begin
      If (Room = World.Room_Array[t^.loc.x,t^.loc.y]) Then
	Begin
	  find_trap(t,false);
	  Search_Room := True
	End;
      t := t^.next
    End;
  If (Room = 0) Then
    Inc := 1
  Else Inc := 0;
  for i := x-inc to x+inc do
    for j := y-inc to y+inc Do
      Begin
	room := world.room_array[i,j];
	if room <> 0 Then
	  With World.Rooms[Room] do
	    begin
	      k := 0;
	      while (k < 4) do
		begin
		  k := k+1;
		  if (doors[k].secret > 0) Then
		    Begin
		      Search_Room := True;
		      doors[k].secret := 0;
		      world.s_world[doors[k].abs_loc.x,doors[k].abs_loc.y] := '+';
		      world.lines[doors[k].abs_loc.y] := true;
		      world.seen[doors[k].abs_loc.x,doors[k].abs_loc.y] := true
		    end;
		end;
	    end;
      End;
    Player_Appears
End; (* Search_Room *)

Procedure Blunder;
Var
  Strange : Integer;
Begin (* Blunder *)
  Case Die(14) Of
    1,2 : Echo('A stream of butterflies shoots forth from the wand');
    3 : Begin
	  Echo('There is a blinding flash of light...');
	  Echo('You find yourself at dinner with the Cleavers...');
	  JSYS(167B;2000); (* DISMS, 2 secs *)
	  Player.faint_count := 0;
	  Player.last_meal := -1000; (* #54 *)
	  Echo('You feel normal again');
	End;
    4,5:For strange := 1 To Die(5) Do
          Begin
	    Case Die(3) Of
	      1:Echo('You feel strange...');
	      2:Echo('You have a strange feeling for a moment...');
	      3:Echo('You feel somewhat disoriented...')
	    End;
	    Case Die(3) Of
	      1:Echo('You feel normal again');
	      2:Echo('You feel better now');
	      3:Echo('The feeling passes');
	    End;
	  End;
    6:Echo('You look stupid now');
    7:Begin
	Echo('You feel normal');
	Echo('The feeling passes...');
      End;
    8:Begin
	Echo('You DIE, buckwheat!!');
	Echo('[Press space to continue, delete to stop]'); (* #2 *)
	Echo('Haha...just kidding');
      End;
    9,10:Echo('Wow');
    11,12:Echo('Nothing happens');
    13,14:Begin	(* #54 *)
	    Echo('Poof --- You are engulfed in a cloud of orange smoke');
	    Echo('Coughing and gasping, you emerge from the smoke and find..');
	    Echo('Ooops, wrong game, sorry!')
	  End
  End
End; (* Blunder *)

Procedure Wonder(This_One : Obj_Ptr; Dir : Char);
Var
  Bogus : Boolean;
Begin (* Wonder *)
  With This_One^ Do
    Begin
      Index := Die(Max_Wand);
      Case Index of
	W_drain,W_fire,W_lightning,W_cold,W_poly,W_tele_away,W_missile,
	W_striking,W_slow,W_haste,W_paralyze : Hurl_obj(This_one,Dir);
	W_light : Light;
	W_tele_to : Teleportation;
	W_cancel : Cancellation;
	W_alchemy : Alchemy;
	W_curing : Curing;
	W_search : Bogus := Search_room(Player.Loc.X,Player.Loc.Y);
	Others : Blunder
      End;
      Index := W_Wonder
    End
End; (* Wonder *)

Function Zap_wand : Boolean;
Var
  Worked : Boolean;
  Dir : Char;
  This_one,Bogus_one : Obj_ptr;
Begin (* Zap_Wand *)
  Worked := True;
  Zap_wand := False;
  This_One := Choose_Item(Zap_A,Wand_T,False,False); (* #54 *)
  If (This_one <> NIL) Then
    Begin
      Zap_wand := True;
      If ((Not Wand[This_one^.Index].Id)
	  or (this_one^.index in [w_drain,w_fire,w_lightning,w_cold,w_poly,
				  w_tele_away,w_missile,w_striking,w_slow,
				  w_haste,w_wonder,w_paralyze,w_blunder])) Then
	Dir := Get_direction
      Else
	Dir := ' ';
      If (dir = Chr(33B)) Then
	Begin
	  Clear_Echo;
	  Redisplay;
	  Zap_Wand := False (* #59 *)
	End
      Else If (This_one^.plus_hit = 0) Then
	Begin
	  Empty_echo := True;
	  Echo('Nothing happens');
	End
      Else
	Begin (* Zapping *)
	  Empty_echo := True;
	  New(Bogus_One);
	  Bogus_one^ := This_one^;
	  This_one^.Plus_hit := This_one^.Plus_hit - 1;
	  Case This_one^.Index Of
	    W_drain,W_fire,W_lightning,W_cold,W_poly,W_tele_away,W_missile,
	    W_striking,W_slow,W_haste,W_paralyze : Hurl_obj(This_one,Dir);
	    W_light : Light; (* just like the scroll *)
	    W_tele_to : Teleportation;
	    W_nothing : Echo('Nothing happens');
	    W_cancel : Cancellation;
	    W_alchemy : Alchemy;
	    W_wonder : Wonder(Bogus_one,Dir);
	    W_blunder : Blunder;
	    W_curing : Curing;
	    W_search : Worked := (Search_Room(Player.Loc.X,Player.Loc.Y)
				  Or (Wand[This_One^.Index].Id));
	    Others : writeln(tty,'Error - Non-existant wand type')
	  End;
	  With Wand[Bogus_one^.Index] Do (* If alchemized *)
	    Begin
	      If Not (Bogus_one^.Index In [W_tele_away,W_nothing,w_striking,
					   W_cancel,W_wonder,W_blunder]) Then
		Id := Worked;
	      If (Not Id) and (Not Called) and Switches.Ask_swi Then
		Name_obj(this_one)
	    End;
	  Dispose(Bogus_One)
	End (* Zapping *)
    End (* got a wand *)
End; (* Zap_wand *)

Function Kill_Player : Boolean;
Var
  Hand : Hand_Type;
Begin (* Kill_Player *)
  Kill_Player := False;
  With Player Do
    For Hand := Left_H To Right_H Do
      If (Hp <= 0) Then
	If (Cur_ring[Hand] <> NIL) Then
	  If ((Cur_ring[Hand]^.Index = R_Resur) and
	      (Cur_ring[Hand]^.Plus_Dam < Cur_ring[Hand]^.Plus_Hit)) Then
	    Begin
	      Write (F,'.. Which should have killed you?!?');
	      Cur_ring[Hand]^.Plus_Dam := Cur_ring[Hand]^.Plus_Dam + 1;
	      Hp := Max_Hp;
	      Died_Count := Died_Count + 1;
	      Change_stats := Change_stats![s_bottom]
	    End;
  If (Player.Hp <= 0) Then
    Begin
      Case Die(3) Of
	1 : Write(f,'... you are dead!!!');
	2 : Write(f,'... and you die!!!');
	3 : Write(f,'... and you croak!!!');
      End;
      Dead := True;
      Kill_Player := True;
      Want_scores := true
    End
End; (* Kill_Player *)

Function Trap_at(X,Y:integer) : Boolean;
Var
  T:Trap_ptr;
  U:Boolean;
Begin (* Trap_at *)
  T := World.Traps;
  U := False;
  While (T <> Nil) And (Not U) Do
    If (T^.Loc.X = X) And (T^.Loc.Y = Y) Then
      U := True
    Else
      T := T^.Next;
  Trap_at := U;
End; (* Trap_at *)

Procedure Step_on_trap(X,Y:Integer);

var t:trap_ptr;
    found:boolean;

    procedure Trap_arrow;
    begin (* Trap_arrow *)
      if die(10) = 1 Then
	echo('An arrow shoots over your shoulder, falls, and breaks')
      else
	Begin
	  Echo_Init;
	  Write(f,'You are hit by an arrow!');
	  player.HP := Player.HP-die(6);
	  If Kill_Player Then
	    Killer := ')'
	  Else
	    Change_stats := Change_stats![s_bottom];
	  Echo(S);
	end;
    end; (* Trap_arrow *)

    procedure Trap_dart;
    begin (* Trap_dart *)
      if die(10) = 1 Then
	echo('A dart whizzes past your ear')
      else
	begin
	  echo('You feel a dart hit the back of your neck!');
	  If not Has_on_ring(r_sustain) then
	    Player.ST := Player.ST-1;
	  Change_stats := Change_stats![s_top];
	end;
    end; (* Trap_dart *)

    Procedure Trap_trapdoor;
    Var
      I : Integer;
    Begin (* Trap_trapdoor *)
      Echo('You fell in a trap!');
      Down_a_level
    End; (* Trap_trapdoor *)

    procedure Trap_beartrap;
    begin (* Trap_beartrap *)
      Echo('You are caught in a beartrap');
      player.trapped_count := 4+die(3);
    end; (* Trap_beartrap *)

begin (* Step_on_trap *)
  t := world.traps;
  found := false;
  While (T <> NIL) and (Not Found) Do
    If (t^.loc.x = x) and (t^.loc.y = y) Then
      Found := True
    Else
      T := T^.Next;
  If Not Found Then
    Writeln(tty,'Error - NIL trap in step_on_trap')
  Else
    Begin
      If T^.Chance > 0 Then
	Find_trap(T,False);
      Valid_Command := false;
      (* Flush TYPE ahead IF needed *)
      If (Switches.Flush_Swi) Then
	Flush_Input;
      Case T^.Kind Of
	T_arrow : Trap_arrow;
	T_bear : Trap_beartrap;
	T_door : Trap_trapdoor;
	T_dart : Trap_dart;
	T_teleport : Teleportation;
	Others : Writeln(tty,'Error - Non existant trap type')
      End
    End
End; (* Step_on_trap *)

Procedure Search(X,Y:Integer);
Var
  T:trap_ptr;
  i,j,room,k:integer;
  found:boolean;
begin
  t := world.traps;
  while t <> nil do
    begin
      if ((abs(t^.loc.x - x) <= 1) and (abs(t^.loc.y - y) <= 1)
	  and (die(100) <= t^.chance)) Then
	find_trap(t,true);
      t := t^.next;
    end;
  for i := x-1 to x+1 do
    for j := y-1 to y+1 do
      begin
	room := world.room_array[i,j];
	if room <> 0 Then
	  with world.rooms[room] do
	    begin
	      k := 0;
	      found := false;
	      while (k < 4) and not found do
		begin
		  k := k+1;
		  if (doors[k].abs_loc.x = i) and (doors[k].abs_loc.y = j) Then
		    found := true;
		end;
	      if found Then
		if (die(100) > doors[k].secret) and (doors[k].secret > 0) Then
		  begin
		    doors[k].secret := 0;
		    world.s_world[doors[k].abs_loc.x,doors[k].abs_loc.y] := '+';
		    world.lines[doors[k].abs_loc.y] := true;
		    world.seen[doors[k].abs_loc.x,doors[k].abs_loc.y] := true;
		  end;
	    end;
      end;
    Player_Appears
end; (* Search *)

Procedure Set_options;
Var
  More,Name_Ok : Boolean;
  New1,New2 : Name_String;
  I,J,Nm_Len,Line,Pos : Integer;

  Function Get_resp : Char;
  Var
    Ch : Char;
  Begin
    Repeat
      Ch := Comand;
      If Not (Ch In Resp_chars) Then
	Write(tty,Chr(7B)) (* bell *)
    Until (Ch In Resp_chars);
    If (Ch > 'Z') Then
      Ch := Chr(Ord(Ch)-40B);
    Get_resp := Ch;
  End;

(* #53,#63 much stuff following *)
  Function TF_Option (Var Line : Integer; Var Swit : Boolean;
		      S : Packed Array[Low..High : Integer] Of Char) : Boolean;
  Begin (* TF_Option *)
    TF_Option := True; (* Set To be false if hit <ESC> *)
    DCA(1,Line);
    Cll; (* #63 *)
    Write(tty,S,Swit);
    DCA(High-Low+3,Line);
    Case Ord(Get_resp) Of
      124B : Begin
	       Write(tty,' true');
	       Swit := true
	     End;
      106B : Begin
	       Write(tty,'false');
	       Swit := False
	     End;
      33B : Begin
	      TF_Option := False;
	      Line := Line - 1
	    End;
      12B,15B : (*Flush_input*);
    End;
    Line := Line + 1;
    Writeln(tty)
  End; (* TF_Option *)

Begin (* Set_Options *)
  Line := Redisp_Y_Orig;
  With Switches Do
    Begin
      More := TF_Option(Line,Terse_swi,'Terse output:');
      If More Then
	More := TF_Option(Line,Flush_swi,'Flush typeahead during battle:');
      If More Then
	More := TF_Option(Line,Jump_swi,'Show position only at end of run:');
      If More Then
	More := TF_Option(Line,Slow_swi,'Do inventories slowly:');
      If More Then
	More := TF_Option(Line,Turn_Swi,'Turn corners in fast move:');
      If More Then
	More := TF_Option(Line,Ask_swi,'Ask me about unidentified things:');
      If More Then
	More := TF_Option(Line,Tomb_Swi,'Display tombstone when dead:')
    End;
  If More Then
    Begin
      New1 := Player.Name; (* save original *)
      Pos := Line;
      Line := Line + 1;
      Repeat
	DCA(1,Pos);
	Cll;
	Player.Name := New1;
	Write(tty,'Name: ',Player.Name);
	DCA(7,Pos);
	More := True;
	If Get_Line(New2,Nm_Len) Then
	  Begin
	    If Nm_Len > 0 Then
	      Player.Name := New2;
	    Name_Ok := Name_Check;
	    If Not Name_Ok Then
	      Begin
		Line := Pos + 2;
		Writeln(tty);
		Cll;
		Write(tty,'Your name is already in use.  Please choose another')
	      End
	  End
	Else
	  Begin
	    Name_Ok := True;
	    More := False
	  End;
	DCA(7,Pos);
	Write(tty,Player.Name)
      Until Name_ok
    End;
    If More Then
      Begin
	Line := Pos + 1;
	DCA(1,Line);
	CLL;
	Write(tty,'Fruit: ',Fruit_name);
	DCA(8,Line);
	If Get_Line(New1,Nm_Len) Then (* #54 *)
	  Begin
	    If Nm_Len > 0 Then
	      Fruit_name := New1
	  End
	Else
	  More := False;
	DCA(8,Line);
	Write(tty,Fruit_name)
      End;
  If More Then
    Begin
      New1 := Save_file; (* save original *)
      Line := Line + 1;
      Pos := Line;
      Repeat
	DCA(1,Pos);
	Cll;
	Save_File := New1;
	Write(tty,'Save file: ',Save_File);
	DCA(12,Pos);
	More := True;
	If Get_Line(New2,Nm_Len) Then
	  Begin
	    If Nm_Len > 0 Then
	      Save_file := New2;
	    Name_Ok := Chk_File(Save_File);
	    If Not Name_Ok Then
	      Begin
		Line := Pos + 1;
		Writeln(tty);
		Cll;
		Write(tty,'Invalid file name, try again')
	      End
	  End
	Else
	  Name_Ok := True;
	DCA(12,Pos);
	Write(tty,Save_File)
      Until Name_Ok
    End;
  More := Wait_for_space(True);
  For J := Redisp_y_orig to Line Do
    Begin
      DCA(1,J);
      Cll;
      Scr_Text(J,Spaces)
    End;
  Redisplay;
  For J := Redisp_y_orig to Line Do
    World.Lines[J] := True;
  Update_Screen	(* #63 *)
End; (* Set_Options *)

Function Throw : Boolean;
Var
  More : Boolean;
  This_one : Obj_ptr;
  Ch,Dir : Char;
Begin (* Throw *)
  Throw := False;
  This_One := Choose_Item(Throw_A,Weapon_T,True,True); (* #54 *)
  More := (This_One <> NIL);
  If More Then
    If This_one = Player.Cur_wep Then
      If This_one^.Cursed Then
	Begin
	  Give_cursed_message;
	  Insert(Player.Obj_list,This_one);
	  More := False
	end;
  If More Then
    Begin
      Throw := True;
      Dir := Get_direction;
      Empty_echo := True;
      If (Dir = Chr(33B)) Then
	Begin
	  Throw := False;
	  Insert(Player.Obj_list,This_one);
	  Clear_Echo;
	  Redisplay;
	  More := False
	End
    End;
  If More Then
    Begin
      If (this_one^.index In [wp_rocks,wp_bolts,wp_arrows,wp_sil_arrows]) Then
	Begin
	  If (Player.Cur_Wep = NIL) Then
	    More := False
	  Else If (Player.Cur_wep^.Index <>
		   - Weapon[This_one^.Index].L_Num) Then
	    More := False;
	  If Not More Then
	    Begin
	      Echo_Init;
	      With Weapon[This_one^.Index] do
		Write(F,'You must wield a ',
		      Weapon[-L_Num].Name:Weapon[-L_Num].N_Leng,
		      ' to effectively use your ',Name:N_Leng);
	      Echo(s);
	      Place_Next_To(Player.Loc,This_One^.Loc,True);
	      Put_On_Floor(This_one,This_one^.Loc.X,This_one^.Loc.Y)
	    End
	End
      Else If (this_one^.index <> wp_dagger) Then
	Begin
	  Echo_Init;
	  If Switches.Terse_Swi Then
	    Write(f,'Really throw your ')
	  Else
	    Write(F,'Are you SURE you want to throw your ');
	  With Weapon[This_One^.Index] Do
	    Write(f,Name:N_leng,'?');
	  Echo(S);
	  Move_to_echo;
	  Repeat
	    Ch := Comand
	  Until (Ch in ['y','n','Y','N',Chr(33B)]);
	  if not (ch in ['Y','y']) Then
	    Begin
	      throw := false;
	      insert(player.obj_list,this_one);
	      Clear_Echo;
	      Redisplay;
	      More := False
	    End
	End
    End;
  If More Then
    Begin
      If (This_one = Player.Cur_Wep) Then
	Player.Cur_Wep := NIL;
      hurl_obj(this_one,dir)
    End
End; (* Throw *)

Function Trap_Identify : Boolean;
Var
  deltax,deltay:integer;
  worker:loc_type;
  Dir:Char;
  t:trap_ptr;
  found:boolean;
Begin (* Trap_Identify *)
  Trap_Identify := False;
  Dir := Get_direction;
  Empty_echo := True;
  if dir = Chr(33B) Then
    Begin
      Clear_echo;
      Redisplay
    End
  Else If Player.Blind Then
    Echo('You can''t see any traps to identify')
  Else
    begin
      Translate_Direction(Dir,DeltaX,DeltaY);
      worker := player.loc;
      repeat
	worker.x := worker.x+deltax;
	worker.y := worker.y+deltay
      until (world.s_world[worker.x,worker.y] in ['|','-','+',' ','^']);
      t := world.traps;
      found := false;
      while (t <> nil) and (not found) do
	if (t^.loc.x = worker.x) and (t^.loc.y = worker.y) Then
	  found := true
	Else
	  t := t^.next;
      If not found Then
	Echo('There''s no trap over there')
      else
	begin
	  Echo_Init;
	  write(f,'That trap is a');
	  case t^.kind of
	    t_arrow: Write(f,'n arrow trap');
	    t_bear: Write(f,' beartrap');
	    t_door: Write(f,' trapdoor');
	    t_dart: Write(f,' dart trap');
	    t_teleport: Write(f,' teleport trap');
	    others: writeln(tty,'Error - Non existant trap type in Trap_Identify!');
	  End; (* case t^.kind *)
	  Echo(s)
	End
    End
End; (* Trap_Identify *)

Function Find_Mon(Q : Mon_Ptr; X,Y : Integer):Mon_Ptr;
Var
  L : Mon_Ptr;
Begin (* Find_Mon *)
  Find_mon := NIL;
  L := Q;
  While L <> Nil Do
    If ((L^.Loc.X = X) And (L^.Loc.Y = Y)) Then
      Begin
	Find_mon := L;
	L := NIL
      End
    Else
      L := L^.Next
End; (* Find_Mon *)

Procedure Del_Mon (Var M : Mon_Ptr);
Var
  P,Q : Mon_Ptr;
Begin (* Del_Mon *)

  (* Rid us of the character for the monster *)
  world.num_mons := world.num_mons - 1;
  World.Mon[M^.Loc.X,M^.Loc.Y] := Chr(0);
  (* If we have been eaten Then assume we could only kill that damn worm. *)
  If (Player.Eaten_Count > 0) Then
    Begin
      World.Mon[M^.Loc.X,M^.Loc.Y] := '@';
      Player_Appears;
      Monster[m_purple].AC := 6;
      Player.Eaten_Count := 0;
    End;
  World.Lines[M^.Loc.Y] := True;

  (* Now de-link the stupid monster *)
  Q := Nil;
  P := World.Monsters;
  While ((P <> Nil) And (P <> M)) Do
    Begin
      Q := P;
      P := P^.Next;
    End;
  If (P = Nil) Then
    Begin
      Write(tty,' Arghhh! Delete: Monster not found!');
      Dispose(M) (* #5 ought to Get rid of it anyway *)
    End
  Else If (Q <> Nil) Then
    Begin
      Q^.Next := P^.Next;
      Dispose(P) (* #5 Get rid of the one we know *)
    End
  Else
    Begin
      World.Monsters := P^.Next;
      Dispose(P) (* #5 as above *)
    End;
  M := NIL (* #6 *)
End; (* Del_Mon *)

Function Attack; (* (X,Y : Integer; Enforcer:Obj_ptr):Boolean; *)

Var
  M : Mon_Ptr;
  T,I,Hit_adj,Pl_Max : Integer;
  Fini:boolean;
  Hand : Hand_Type;

(* This procedure is used If you polymorph the purple worm that ate you. *)
  Procedure Break_Stomach (Var M : Mon_Ptr);
  Var
    New_M : Integer;
  Begin
    Repeat
      New_M := Die(Max_Monster)
    Until ((Not (New_M In [M_juiblex,M_Lep,M_nymph,M_gith,M_Mimic]))
	   and  (Monster[New_M].Min_Level < Maxint));
    m^.hp := (M^.hp * Monster[New_M].Hit_Dice) div Monster[M^.Index].Hit_Dice;
    Player.Hp := Player.Hp - M^.hp div 4;
    If (Player.Hp <= 0) Then
      Begin
	Echo('You are smashed by the shrinking monster...Which kills you!!');
	Dead := True;
	Fini := True;
	Killer := Monster[New_M].Name;
	Want_Scores := True
      End
    Else
      Begin
	Echo('You are hurt bad by the shrinking stomach of the monster');
	Echo('But it is killed by your great bulk!!');
	Player.Xp := Player.Xp + Monster[New_m].XPVal;
	Del_Mon(M);
	Change_stats := Change_stats![s_bottom];
	Check_Player_Level
      End
  End;

  Function Wand_Attack (Enforcer : Obj_Ptr; M : Mon_Ptr) : Integer;
  Var
    Foo : Boolean;
    T : Integer;
  Begin
    T := 0;
    if (die(20) = 1) Then
      Begin
	T := -1;
	Echo_Init;
	Write(f,'The ');
	If Wand[Enforcer^.Index].Is_Wand Then
	  Write(f,'wand ')
	Else
	  Write(f,'staff ');
	If Switches.terse_swi Then
	  Write(F,'sputters')
	Else
	  Write(f,'glows faintly and sputters');
	Echo(s)
      End
    Else (* #46 *)
      case enforcer^.index of
	W_drain: T := M^.Hp*2; (* #63 *)
	W_fire,
	W_cold,
	W_lightning,
	W_striking,
	W_missile : For I := 1 To Wand[Enforcer^.Index].Num Do
	  T := T+Die(Wand[Enforcer^.Index].Dam);
	w_poly :
	With M^ Do
	  Begin
	    t := -1;
	    If ((Index = m_purple) and (Player.Eaten_Count > 0)) Then
	      Break_Stomach(M)
	    Else
	      Begin
		If (Index In [m_Fungi,m_mimic]) Then
		  Player.Stuck := False;
		Repeat
		  I := Die(Max_monster)
		Until ((Not (I In [M_juiblex,M_mimic,M_Nymph,M_gith,M_Lep]))
		       and (Monster[I].Min_Level < Maxint));
		Hp := (hp * Monster[I].Hit_Dice) div Monster[Index].Hit_Dice;
		World.Lines[Loc.Y] := True;
		Index := I;
		World.Mon[Loc.X,Loc.Y] := Monster[Index].Name
	      End
	  End;
	W_tele_away:
	Begin
	  t := -1;
	  With M^.Loc do
	    begin
	      World.Mon[X,Y] := Chr(0);
	      World.Seeable[X,Y] := False;
	      World.Lines[Y] := True;
	      Player_Appears;
	      Pick_a_place(X,Y);
	      World.Mon[X,Y] := Monster[M^.Index].name;
	      If Player.SeeMon_Count > 0 Then
		World.Seeable[X,Y] := True;
	      World.Lines[Y] := True;
	      If (M^.Index In [m_fungi,m_mimic]) Then
		Player.Stuck := False;
	      If (Player.Eaten_Count > 0) Then (* this too *)
		Begin
		  Player.Prev := Player.Loc;
		  Player.Loc := M^.Loc;
		  Player_Disappears;
		  World.Seeable[Player.Loc.X,Player.Loc.Y] := True;
		End;
	      Update_screen
	    end;
	end;
	w_slow:
	begin
	  t := -1;
	  if m^.speed < 3 then
	    begin
	      m^.speed := 1;
	      if m^.speed_count = 0 Then
		m^.speed_count := -1
	      else
		m^.speed_count := -(m^.speed_count);
	    end
	  else m^.speed_count := 1;
	end;
	w_haste:
	begin
	  t := -1;
	  if m^.speed > 1 then
	    begin
	      m^.speed := 3;
	      if m^.speed_count = 0 Then
		m^.speed_count := -1
	      else
		m^.speed_count := -(m^.speed_count);
	    end
	  else m^.speed_count := 1;
	end;
	w_paralyze:
	begin
	  if (M^.Index = m_zombie) Then
	    T := -2 (* missed *)
	  Else
	    Begin
	      m^.paralyzed_Count := m^.paralyzed_count + die(10)+5;
	      T := -1
	    End
	end;
	others : Echo('Error in parameter to Wand_Attack -- illegal wand');
      end;
      Wand_Attack := T;
  End;

  Procedure Dead_Mon_Treasure (M : Mon_Ptr);
  Var
    Nw : Obj_ptr;
    Other : Loc_type;
  Begin
    Place_next_to(M^.Loc,Other,True);
    Case M^.Index Of
      M_lep: Begin
	       New(Nw);
	       Nw^.Obj_typ := Gold_t;
	       Nw^.Loc := Other;
	       Nw^.Quan := Die(250)+50;
	       If (Die(5) = 1) Then
		 Nw^.Quan := Nw^.Quan+Die(300);
	       Nw^.Index := 0;
	       Place_obj(Nw)
	     End;
      M_int,
      M_nymph,
      M_troll:
      If ((M^.Index = M_nymph) Or (Die(2) = 1)) Then
	Repeat
	  Fini := False;
	  Gen_obj(World.Level,Nw);
	  If Nw^.Obj_typ In [Gold_t,Food_t] Then
	    Dispose(Nw)
	  Else
	    Begin
	      Fini := True;
	      Nw^.Loc := Other;
	      Place_obj(Nw)
	    End
	Until Fini;
	M_death : Begin
		    New(Nw);
		    Nw^.Obj_typ := Weapon_t;
		    Nw^.Loc := Other;
		    Nw^.Plus_hit := Die(3)+2;
		    Nw^.Plus_dam := Die(3)+2; (* 2 Handed Sword *)
		    Nw^.Cursed := False;
		    Nw^.Know_magic := False;
		    Nw^.Index := Wp_two_sword;
		    Nw^.Quan := 1;
		    Place_obj(Nw)
		  End;
	M_gith : Begin
		   New(Nw);
		   Nw^.Obj_typ := Weapon_t;
		   Nw^.Loc := Other;
		   Nw^.Plus_hit := Die(3)+1;
		   Nw^.Plus_dam := Die(3)+1; (* Silver Sword *)
		   Nw^.Cursed := False;
		   Nw^.Know_magic := False;
		   Nw^.Index := Wp_sil_sword;
		   Nw^.Quan := 1;
		   Place_obj(Nw);
		   Monster[M_gith].Min_level := Maxint (* No more Githyankis *)
		 End
    End (* Case M^.Index *)
  End;

  (* procedure to handle monster special defenses *)
  procedure Defenses(Enforcer:obj_ptr; M:Mon_ptr; Var T:Integer);
  begin (* Defenses *)
    With Enforcer^ do
      case M^.index of
	m_quasit:
	If (obj_typ = wand_t) and (Index In [w_fire,w_lightning,w_cold]) Then
	  T := 0
	Else
	  If (Obj_Typ = Weapon_t) Then
	    If (index In [wp_rocks,wp_sil_sword,wp_sil_arrows]) Then
	      If (Plus_Hit+Plus_Dam <= 0) Then
		T := 0;
	m_snake:
	If (Obj_Typ = wand_t) and (index = w_cold) Then
	  t := 0;
	m_troll:
	If (Obj_Typ = Wand_t) and (index = w_fire) Then
	  T := t + t div 2;
	m_vampire:
	If (Obj_typ = Weapon_t) Then
	  If (Plus_Hit+Plus_Dam <= 0) Then
	    T := 0; (* must be magical weapon *)
	m_wraith:
	If (Obj_Typ = Weapon_t) Then
	  If (Plus_Hit+Plus_Dam <= 0) Then (* Not magic *)
	    If (Index In [wp_sil_sword,wp_sil_arrows]) Then
	      T := t div 2
	    Else T := 0; (* is Not silver *)
	m_xorn:
	If Obj_Typ = Wand_T Then
	  Case Index Of
	    w_fire,w_cold : T := 0;
	    w_lightning : If Die(10) < 3 Then
	      T := 0
	    Else T := T div 2;
	  End;
	m_yeti:
	If (Obj_Typ = wand_t) Then
	  Case Index Of
	    w_fire : T := T + T div 2;
	    w_cold : T := 0;
	  End;
	m_zombie:
	If ((Obj_Typ = wand_t) and (Index = w_cold)) Then
	  T := 0;
	m_death:
	If ((Obj_Typ = Wand_T) or ((Obj_Typ = Weapon_t)
				  and (Plus_Hit+Plus_Dam > 0))) Then
	  T := T div (5 - Die(4));
	m_int :
	If ((obj_typ = weapon_t) and (plus_hit+plus_dam < 2)) Then
	  t := 0;
	m_juiblex:
	If ((obj_typ = Weapon_t) and
	    (Index in [wp_sil_sword,wp_sil_arrows])) Then
	  t := 0; (* Everybody knows silver doesn''t hurt demons! *)
	m_phantom:
	If (obj_typ = wand_t) Then
	  Case index Of
	    w_fire :
	    begin
	      t := 0;
	      M^.Hp := M^.Hp+1
	    End;
	    w_cold : T := t + 2
	  End;
	m_sand:
	If (((Obj_typ = weapon_t) (* throw or missile weapons *)
	     and ((Player.Cur_Wep = NIL) or
		  (Index In [wp_rocks,wp_bolts,wp_arrows,wp_sil_arrows])))
	    or ((Obj_Typ = Wand_t) and (Index = w_striking))) Then
	  t := 0;
	m_umpleby:
	If (Obj_typ = wand_t) and (Index = w_lightning) Then
	  T := 0;
	m_werewolf:
	if ((obj_typ = weapon_t) and
	    (Not (index in [wp_sil_sword,wp_sil_arrows]))) Then
	  T := 0;
	m_zallige:
	If ((obj_Typ = wand_t) and (Index = w_drain)) Then
	  t := 0 (* hahahaha!  Cannot Drain Life!!! *)
      end
  End; (* Defenses *)

  Function Player_Max_Hit (Weap : Obj_Ptr; M : Mon_Ptr) : Integer;
  Var
    Pl_Max : Integer;
    Hand : Hand_Type;
  Begin (* Player_Max_Hit *)
    Pl_Max := 0;
    If (Weap^.Obj_Typ = Wand_T) Then
      Begin
	Pl_Max := Wand[Weap^.Index].Num * Wand[Weap^.Index].Dam;
	If Weap^.Index = W_drain Then
	  Pl_Max := M^.Hp
      End
    Else
      Begin
	If Monster[M^.Index].Large Then
	  Pl_Max := Max(weapon[Weap^.index].L_num,1) * Weapon[Weap^.Index].L_Dam
	Else
	  Pl_Max := Max(weapon[Weap^.index].S_num,1) * Weapon[Weap^.Index].S_Dam;
	If (Weap^.index in [wp_rocks,wp_bolts,wp_arrows,wp_sil_arrows]) Then
	  Pl_Max := Pl_Max + Player.Cur_Wep^.Plus_Dam
	Else If Player.St > 14 Then
	  Pl_Max := Pl_Max+(Player.St - 14)
	else
	  if Player.St < 7 Then
	    Pl_Max := Pl_Max+(Player.St - 7);
	Pl_Max := Max(Pl_Max,1);
      End;
    For Hand := Left_H To Right_H Do
      If Player.Cur_ring[Hand] <> NIL Then
	If (Player.Cur_ring[Hand]^.Index = R_incr_dam) Then
	  Pl_Max := Max(1,Pl_Max + Player.Cur_ring[Hand]^.Plus_hit);
    Player_Max_Hit := Pl_Max
  End; (* Player_Max_Hit *)

  Procedure M_Ouch_MSG (Var F : File; M : Mon_Ptr;
			T : Integer; Weap : Obj_Ptr);
  Var
    It : Packed Array[1..34] Of Char; (* Gag me. *)
    Ln, New_Hp, Ratio, M_Half,M_Qtr, M_Max : Integer;
    Thrown : Boolean;
  Begin (* M_Ouch_MSG *)
    Ratio := Trunc(T / Player_Max_Hit(Weap,M) * 10);
    New_Hp := M^.Hp - T;
    If (Weap <> Player.Cur_Wep) Then
      Thrown := True
    Else Thrown := False;
    If Switches.Terse_Swi Then
      Begin
	It := 'it                                ';
	Ln := 2
      End
    Else
      Begin
	It := 'the                               ';
	For Ln := 5 To 4+Monster[M^.Index].Len do
	  It[Ln] := Monster[M^.Index].Long_Name[Ln-4];
	Ln := Monster[M^.Index].Len+4
      End;
    If New_Hp <= 0 Then
      Begin (* It dies *)
	If (Player.Blind_Count > 0) Then (* #54 *)
	  Case Die(14) Of (* #54 *)
	    1,2,3 : Write(f,'You kill it!!');
	    4,5,6 : Write(f,'It is vanquished!!');
	    7,8,9 : Write(f,'It is defeated!!');
	    10 : Write(f,'The bugger dies!!');
	    11,12 : Write(f,'It bites the dust!!');
	    13,14 : Write(f,'It croaks!!')
	  End
	Else
	  Case Die(18) Of (* #54 *)
	    1 : Write(f,'You have vanquished ',It:Ln,'!!');
	    2 : Write(f,It:Ln,' has gone to meet its maker!!');
	    3 : Write(f,It:Ln,' will draw breath no more!!');
	    4 : Write(f,'You deal ',It:Ln,' a death blow!!');
	    5 : Write(f,'You splatter ',It:Ln,'!!!');
	    6 : Write(f,It:Ln,' screams in agony and is no more!!');
	    7 : Write(f,'You have killed ',It:Ln,'!!');
	    8 : Write(f,'Ok, you killed ',It:Ln,'.  Wow.');
	    9 : Write(f,It:Ln,' is dead!!');
	    10: If Switches.Terse_Swi Then
		  Write(f,'Another one bites the dust!!')
		Else
		  Write(f,'Another ',
			Monster[M^.Index].Long_Name:Monster[M^.Index].Len,
			' bites the dust!!');
	    11: Write(f,It:Ln,' is launched into eternity...');
	    12: Write(f,It:Ln,' cashes in its chips!');
	    13: Write(f,'You have slain ',It:Ln,'!!');
	    14: Write(f,It:Ln,' collapses in a pool of its own gore!');
	    15: Write(f,'And you thought ',It:Ln,' smelled bad on the outside!!');
	    16: Write(f,It:Ln,' curses you and expires!');
	    17: Write(f,'Splat!  Now you smell as bad as ',It:Ln,' did!');
	    18: Write(f,It:Ln,' disappears in a cloud of greasy black smoke!!')
	  End
      End (* It dies *)
    Else
      Begin (* You hurt it *)
	If (Player.Blind_Count > 0) Then
	  Write(f,'You hit it')
	Else If (Weap^.Obj_Typ = Wand_T) Then
	  Case Ratio Of
	    0,1,2  : Write(f,'The blast strikes ',It:Ln,' glancingly');
	    3,4,5,6: Write(f,'You zap ',It:Ln,' good');
	    Others : Write(f,'The blast maims ',It:Ln,' terribly')
	  End
	Else
	  Case Ratio Of
	    0,
	    1 : Write(F,'You scratched ',It:Ln);
	    2 : Write(F,'You nicked ',It:Ln);
	    3 : Write(f,'You struck ',It:Ln,' a glancing blow');
	    4,5,6 : Write(f,'You strike ',It:Ln,' a telling blow');
	    8 : Write(f,'You really hit ',It:Ln,' good');
	    7 : If Thrown Then
	      Write(f,'You catch ',It:Ln,' upside the head')
	    Else Write(f,'You slap ',It:Ln,' upside the head');
	    9 : Write(F,'You score an excellent hit on ',It:Ln);
	    10 : Write(f,'You whang on ',It:Ln);
	    Others :
	    If Thrown Then
	      Write(f,'Your ',
		    Weapon[Weap^.Index].Name:Weapon[Weap^.Index].N_Leng,
		    ' imbeds itself deep within ',It:Ln)
	    Else Write(f,'You smash ',It:Ln);
	  End; (* Case Ratio *)
	  M_Max := Monster[m^.Index].Hit_Dice * 8;
	  M_Half := M_Max Div 2;
	  M_Qtr := M_Max div 4;
	  If Not Switches.Terse_Swi Then
	    If (M^.Hp > M_Half) Then
	      Begin
		If (New_Hp <= M_Qtr) Then
		  Case Die(2) Of
		    1 : Write(f,'; it wails in anguish!');
		    2 : Write(f,'; it looks pained')
		  End
		Else If (New_Hp <= M_Half) Then
		  Case Die(3) Of
		    1 : Write(F,' which slows it');
		    2 : Write(f,'; it''s not happy');
		    3 : If Not Thrown Then
		      Write(f,'; it fights harder')
		    Else
		      Write(f,'; it hesitates briefly')
		  End
		Else
		  If Die(5) = 1 Then
		    Case Die(3) Of
		      1 : Write(f,'; it laughs!');
		      2 : Write(f,'; it snarls...');
		      3 : Write(f,' which only annoys it')
		    End
	      End
	    Else
	      If (M^.Hp > M_Qtr) Then
		If (New_Hp <= M_Qtr) Then
		  Case Die(3) Of
		    1 : Write(f,'; it''s hurting bad');
		    2 : Write(f,'; it looks desperate');
		    3 : Write(f,'; what a mess!')
		  End;
      End; (* You hurt it *)
  End; (* M_Ouch_MSG *)

  Procedure Check_Vampiric (Enforcer : Obj_Ptr; T : Integer);
  Var
    How_Many : Integer;
    Hand : Hand_Type;
  Begin (* Check_Vampiric *)
    How_Many := T;
    If ((Enforcer^.Obj_typ = Weapon_t) and (T > 0)) Then
      With Player Do
	Begin
	  For Hand := Left_H To Right_H Do
	    If (Cur_ring[Hand] <> NIL) Then
	      If (Cur_Ring[Hand]^.Index = R_Vampiric) Then
		If (Hp < Max_Hp) Then
		  Begin
		    Change_stats := Change_stats![S_bottom];
		    Hp := Min(Hp + (T + Ord(Odd(T))) Div 2, Max_Hp)
		  End
	End
  End; (* Check_Vampiric *)

Begin (* Attack *)
  Fini := False;
  T := 0;
  M := Find_Mon(World.Monsters,X,Y);
  If (Enforcer = Nil) Then
    Begin
      If Switches.Terse_swi then
	Echo('You have no weapon')
      Else
	Echo('You''re not wielding any weapon!');
      Fini := True
    End;
  If (M = Nil) and Not Fini Then
    Begin
      If Switches.Terse_swi Then
	Echo('It was an illusion!')
      Else
	Echo('As you attack, the illusion shimmers, then fades away');
      World.Lines[Y] := True;
      World.Mon[X,Y] := Chr(0);
      Fini := True
    End;
  If Not Fini Then
    Begin
      If (Enforcer^.Obj_typ = Wand_t) Then
	T := Wand_attack(Enforcer,M)
      Else
	If (Enforcer^.Index In [Wp_sling,Wp_crossbow,Wp_bow]) Then
	  If Enforcer = Player.Cur_wep Then
	    Begin
	      T := -1; (* -1 means missed+no message *)
	      Echo_Init;
	      With Weapon[Enforcer^.Index] do
		Write(F,'Your ',Name:N_Leng);
	      Write(F,' does not make an effective hand-held weapon');
	      Echo(S);
	    End
	  Else (* we threw a bow-like weapon *)
	    T := -3; (* Make attack False, but miss *)
    End; (* If Not Fini *)
  If (T = 0) and Not Fini Then (* If We did not wand hit it *)
    Begin (* #49 *)
      If ((Enforcer^.Index In [Wp_rocks,Wp_bolts,Wp_arrows,Wp_sil_arrows]) and
	  (Enforcer = Player.Cur_wep)) Then
	Begin
	  T := -1;
	  Echo_Init;
	  With Weapon[Enforcer^.Index] do
	    Write(F,'Your ',Name:N_Leng);
	  If (Enforcer^.Quan > 1) Then
	    Write(F,'s do')
	  Else
	    Write(F,' does');
	  Write(F,' not make an effective hand-held weapon');
	  Echo(S)
	End
    End;
  If ((T >= -1) and Not Fini) Then
    If ((Not M^.Awake) and (M^.Index = M_mimic)) Then
      If (World.Mon[X,Y] in ['!',')','[','&','$','*','?','/','=']) Then
	Begin
	  Echo_Init;
	  Write(f,'Oops!  That''s no ');
	  Case World.Mon[X,Y] Of
	    '!' : Write(f,'potion');
	    ')' : Write(f,'weapon');
	    '[' : Write(f,'armor');
	    '&' : Write(f,'food');
	    '$' : Write(f,'AMULET of YENDOR');
	    '*' : Write(f,'gold');
	    '?' : Write(f,'scroll');
	    '/' : Case die(2) Of
		    1 : Write(f,'staff');
		    2 : Write(f,'wand');
		  End;
	    '=' : Write(f,'ring');
	  End;
	  Write(f,'!! That''s a mimic!!!');
	  Echo(s);
	  World.Mon[X,Y] := 'M';
	  World.Lines[Y] := True;
	  M^.awake := True;
	  T := -3;
	  Fini := True
	End; (* If We woke up a sleeping mimic *)
  If (T = 0) and Not Fini Then (* We did Not hit With thrown weapon *)
    Begin
      If (Player.Blind_count > 0) Then
	Hit_adj := -2
      Else Hit_adj := 0;
      If Not M^.Awake Then
	Hit_adj := Hit_adj+2;
      If (Enforcer^.Index in [Wp_rocks,Wp_bolts,
			      Wp_arrows,Wp_sil_arrows]) Then
	Begin (* Missile Weapon Dex Adjustment *)
	  Hit_adj := Hit_adj+Player.Cur_wep^.Plus_hit;
	  If Player.Dx > 15 then
	    Hit_adj := Hit_adj + Player.Dx - 15
	  Else If Player.Dx < 6 then
	    Hit_adj := Hit_adj + Player.Dx - 6;
	End;
      If (Die(20) >= (20 - Monster[M^.Index].Ac - Enforcer^.Plus_Hit
		      - Hit_adj - ((Player.level-1) Div 2))) Then
	Begin (* Ok, now we hit it... *)
	  if Monster[M^.Index].Large then
	    for i := 1 to max(weapon[enforcer^.index].L_num,1) do
	      t := t+Die(Weapon[Enforcer^.Index].L_Dam)
	  else
	    for i := 1 to max(weapon[enforcer^.index].S_num,1) do
	      t := t+Die(Weapon[Enforcer^.Index].S_Dam);
	  T := T+Enforcer^.Plus_Dam;
	  if (Enforcer^.index in [wp_rocks,wp_bolts,
				  wp_arrows,wp_sil_arrows]) Then
	    T := T+Player.Cur_Wep^.Plus_Dam
	  Else if Player.St > 14 then
	    t := t+(Player.St - 14)
	  Else if Player.St < 7 then
	    t := T+(Player.St - 7);
	  If (Player.Eaten_Count > 0) Then
	    T := T - (7 - Player.Eaten_Count);
	  T := Max (T,1)
	End (* Ok, now we hit it... *)
    End; (* We had Not hit it before *)
  If Not Fini Then
    Begin
      If (T > 0) Then
	Defenses(Enforcer,M,T);
      Echo_Init;
      If (T > 0) Then   (* We HIT IT!!! *)
	Begin
	  (* Rings of increase damage handled here *)
	  For Hand := Left_H To Right_H Do
	    If (Player.Cur_ring[Hand] <> NIL) Then
	      If (Player.Cur_ring[Hand]^.Index = R_incr_dam) Then
		T := Max(1,T+Player.Cur_ring[Hand]^.Plus_hit);
	  M_Ouch_MSG(F,M,T,Enforcer);
	  M^.Awake := True;
	  If S[1] In ['a'..'z'] Then
	    S[1] := Chr(Ord(S[1]) - 40B);
	  Echo(s);
	  M^.Hp := M^.Hp - T;
	  Check_Vampiric(Enforcer,T);
	  Attack := True;
	  If (M^.Hp <= 0) Then
	    Begin (* we killed it! *)
	      Player.Xp := Player.Xp + Monster[M^.Index].XPVal;
	      If (M^.Index in [m_fungi,m_troll,m_nymph,m_juiblex,
			       m_death,m_gith,m_lep,m_mimic,m_int]) Then
		if (m^.index In [m_fungi,m_mimic]) Then
		  player.stuck := false
	        Else Dead_Mon_Treasure(M);
	      Del_Mon(M);
	      Change_stats := Change_stats![s_bottom];
	    end
	  else
	    begin (* ok, we did Not kill it *)
	      if Player.Will_confuse then
		begin
		  M^.confused_count := M^.Confused_count+10+Die(5);
		  player.will_confuse := false;
		  Echo_Init;
		  If Switches.terse_swi or (player.blind_count>0) Then
		    write(f,'It''s confused')
		  else
		    write(f,'The ',Monster[M^.Index].Long_name:Monster[m^.Index].len,' appears confused');
		  echo(s)
		End
	    End
	End
      Else
	Begin
	  M^.Awake := True;
	  If t = -1 Then (* hit, but no message, please *)
	    attack := true
	  else
	    begin
	      if t = -2 Then
		attack := true
	      else Attack := False;
	      with Monster[M^.Index] do
		If Player.Cur_Wep = Enforcer Then
		  Begin (* Not thrown *)
		    If Switches.Terse_Swi Then
		      Write(f,'You miss ')
		    Else
		      Case Die(3) Of
			1: Write(f,'You miss ');
			2: Write(f,'You swing and miss ');
			3: Write(f,'You barely miss ');
		      End;
		      If ((Player.Blind_Count <> 0) or (Switches.Terse_swi)) Then
			Write(f,'it')
		      Else Write(f,'the ',Long_Name:Len)
		  End
		Else
		  Begin (* Did Throw! *)
		    If Switches.Terse_Swi Then
		      Write(f,'You miss ')
		    Else
		      Case Die(3) Of
			1: Write(f,'You miss ');
			2: Write(f,'You wildly miss ');
			3: Write(f,'You barely miss ');
		      End;
		    If ((Player.Blind_Count <> 0) or (Switches.Terse_Swi)) Then
		      Write(f,'it')
		    Else Write(f,'the ',Long_Name:Len)
		  End; (* Did Throw! *)
		echo(s)
	    End
	End;
      Check_Player_Level
    End; (* If Not Fini *)
  if switches.flush_swi Then
    Flush_Input
End; (* Attack *)

Function Can_move_to (X,Y : Integer) : Boolean;
Begin
  Can_move_to := ((World.S_world[X,Y] in ['.','%','+','#','^']) and
		  (World.Mon[X,Y] = Chr(0)))
End;


Function Down_Stairs : boolean;
Begin (* Down_Stairs *)
  If Player.stuck Then
    Give_stuck_message
  Else If (World.S_World[Player.Loc.X,Player.Loc.Y] = '%') then
    Begin
      if (World.level = Amulet_level) and (Player.Has_amulet) Then
	Begin
	  Cls;
	  down_stairs := true;
	  Dead := true;
	  want_scores := true;
	  player.gold := player.gold+5000;
	  killer := '$';
	  writeln(tty);
	  writeln(tty,'As you decend the stairs, a white mist envelops you.  You feel very');
	  writeln(tty,'strange for a moment, and when the mist clears, you find yourself');
	  writeln(tty,'standing in the middle of the ruins at the entrance to the Dungeons');
	  writeln(tty,'of Doom.  Congratulations!  You Made It!');
	end
      else
	begin
	  down_a_level;
	  down_stairs := true;
	End;
    End
  Else
    Begin
      Echo('I see no way down');
      Down_Stairs := False;
    End;
End; (* Down_Stairs *)

Function Stop (Foo : Boolean) : Boolean;
Var
  Ch : Char;
Begin (* Stop *)
  Empty_echo := true;
  Echo('Really quit (Y or N) ?');
  Move_To_Echo;
  Repeat
    Ch := Comand
  Until (Ch in ['y','n','Y','N']);
  If (Ch in ['Y','y']) then
    Begin
      Stop := true;
      Quit_game := True;
      Killer := ' ';
      Want_scores := Foo
    End
  Else
    Begin
      Stop := False;
      Clear_echo;
      Redisplay
    End
End; (* Stop *)

Procedure Save_game;
Var
  S_File : Long_String;
  I,J,Arm_num,Wep_num,L_r_num,R_r_num,Disk_address,Fudge : Integer;
  P : Obj_ptr;
  Q : Mon_ptr;
  R : Trap_ptr;
  Uname : Name_string;
  Ch : Char;
  G : Text;
Begin (* Save_game *)
  For I := 1 to Name_Len Do
    S_File[I] := Save_File[I];
  S_File[Name_Len + 1] := Chr(0);
  Fix_String(S_File);
  Echo_Init;
  Write(F,'Saving as: ',Save_File);
  Empty_Echo := True;
  Echo(S);
  rewrite(g,S_file,0,0,[2,14],60000b); (* buffered by bytes *)
  getfdb(S_File,disk_address);
  writeln(g,disk_address:0);
  writeln(g,seed:0);
  fudge := (disk_address Mod 100B) + (seed Mod 40B);
  Writeln(g,fudge - 1:0);
  with world do
    for i := x_orig to s_max_x do
      for j := y_orig to s_max_y do
	begin
	  write(g,s_world[i,j],this_screen[j,i],screen[j,i]);
	  if mon[i,j] = Chr(0)
	    then write(g,' ')
	    else write(g,mon[i,j]);
	  if obj[i,j] = Chr(0)
	    then writeln(g,' ')
	    else writeln(g,obj[i,j]);
	  writeln(g,room_array[i,j]:0);
	  Writeln(g,Ord(seeable[i,j]):0);
	  Writeln(g,Ord(seen[i,j]):0);
	  Writeln(g,'1'); (* Ord(Show[i,j]):0); *)
	end;
  for j := y_orig to s_max_y Do
    Writeln(g,Ord(world.lines[j]):0);
  writeln(g,world.level:0,' ',world.num_mons:0,' ',world.max_mons:0,' ',seed:0);
  for i := 1 to max_room do
    with world.rooms[i] do
      begin
	writeln(g,max_x:0,' ',max_y:0,' ',abs_x:0,' ',abs_y:0);
	Writeln(g,Ord(light):0);
	Writeln(g,Ord(existant):0);
	Writeln(g,Ord(seen):0);
	for j := 1 to max_doors do
	  writeln(g,doors[j].abs_loc.x:0,' ',doors[j].abs_loc.y:0,' ',doors[j].secret:0);
	writeln(g,orig_x[i]:0,' ',orig_y[i]:0);
	Writeln(g,Ord(m_used_list[i]):0);
	Writeln(g,Ord(o_used_list[i]):0);
      end;
  for i := 1 to max_monster do
    writeln(g,monster[i].min_level:0);
  for i := 1 to max_potion Do
    With potion[i] do
      begin
	writeln(g,desc:Name_Len,d_leng:0);
      Writeln(g,Ord(called):0);
      Writeln(g,Ord(id):0);
      End;
  for i := 1 to max_scroll Do
    With scroll[I] do
      begin
	writeln(g,desc:Name_Len,d_leng:0);
	Writeln(g,Ord(called):0);
	Writeln(g,Ord(id):0);
      end;
  for i := 1 to max_wand Do
    With wand[i] do
      begin
	writeln(g,desc:Name_Len,d_leng:0);
	Writeln(g,Ord(called):0);
	Writeln(g,Ord(id):0);
	Writeln(g,Ord(is_wand):0);
      end;
  for i := 1 to max_ring Do
    With ring[i] do
      begin
	writeln(g,desc:Name_Len,d_leng:0);
	Writeln(g,Ord(called):0);
	Writeln(g,Ord(id):0);
      end;

  arm_num := 0;
  wep_num := 0;
  l_r_num := 0;
  r_r_num := 0;
  i := 1;
  p := world.objs;
  while p <> nil do
    begin
      writeln(g,i:0,' ',ord(p^.obj_typ):0,' ',p^.loc.x:0,' ',p^.loc.y:0);
      writeln(g,p^.quan:0,' ',p^.index:0,' ',p^.plus_hit:0,' ',p^.plus_dam:0);
      Writeln(g,Ord(p^.know_magic):0);
      Writeln(g,Ord(P^.cursed):0);
      p := p^.next;
    end;
  p := player.obj_list;
  i := 2;
  j := 0;
  while p <> nil do
    begin
      j := j+1;
      if p = player.cur_arm Then
	arm_num := j
      Else If p = player.cur_wep Then
	wep_num := j
      Else If p = player.Cur_ring[Left_H] Then
	l_r_num := j
      Else If p = player.Cur_ring[Right_H] Then
	r_r_num := j;
      writeln(g,i:0,' ',ord(p^.obj_typ):0,' ',p^.loc.x:0,' ',p^.loc.y:0);
      writeln(g,p^.quan:0,' ',p^.index:0,' ',p^.plus_hit:0,' ',p^.plus_dam:0);
      Writeln(g,Ord(p^.know_magic):0);
      Writeln(g,Ord(p^.cursed):0);
      p := p^.next;
    end;
  i := 3;
  q := world.monsters;
  while q <> nil do
    begin
      writeln(g,i:0,' ',q^.index:0,' ',q^.hp:0,' ',q^.loc.x:0,' ',q^.loc.y:0,' ',q^.paralyzed_count:0);
      writeln(g,q^.speed:0,' ',q^.speed_count:0,' ',q^.who_first:0,' ',q^.confused_count:0);
      Writeln(g,Ord(q^.awake):0);
      q := q^.next;
    end;
  i := 4;
  r := world.traps;
  while r <> nil do
    begin
      writeln(g,i:0,' ',r^.loc.x:0,' ',r^.loc.y:0,' ',r^.chance:0,' ',r^.kind:0);
      r := r^.next;
    end;
  writeln(g,i+1:0); (* end of lists *)
  writeln(g,arm_num:0,' ',wep_num:0,' ',l_r_num:0,' ',r_r_num:0);
  with player do
    begin
      writeln(g,gold*fudge:0,' ',xp:0,' ',level:0,' ',hp:0,' ',name);
      Writeln(g,max_hp:0,' ',st:0,' ',max_st:0,' ',dx:0,' ',max_dx:0,' ',iq:0,' ',max_iq:0);
      writeln(g,ac-fudge:0,' ',Died_Count:0,' ',faint_count:0,' ',invis_count:0,' ',speed:0,' ',speed_count:0);
      writeln(g,confused_count:0,' ',blind_count:0,' ',last_meal:0,' ',heal_count:0,' ',loc.x:0,' ',loc.y:0);
      writeln(g,paralyzed_count:0,' ',sleep_count:0,' ',trapped_count:0,' ',fixed_count:0);
      Writeln(g,Ord(will_confuse):0);
      Writeln(g,Ord(stuck):0);
      Writeln(g,Ord(has_amulet):0);
    end;
  writeln(g,player.level+player.gold+player.ST+Player.DX+disk_address:0);
  writeln(g,fruit_name);
  Writeln(g,Save_File);
  writeln(g,amulet_level+fudge:0);
  writeln(g,blank_message:0);
  writeln(g,scare_count:0);
  Writeln(g,Player.eaten_Count:0,' ',Player.Prev.X:0,' ',Player.Prev.Y:0);
  close(g);
  fiddle_fdb(S_File);
  saved := true;
  quit_game := true;
End; (* Save_game *)

Procedure Save_The_Game;
Var
  Ch : Char;
Begin (* Save_The_Game *)
  Empty_echo := true;
  Echo('Really save the game (Y or N) ?');
  Move_To_echo;
  Repeat
    Ch := Comand
  Until (Ch in ['y','n','Y','N']);
  If (Ch in ['Y','y']) Then
    Save_Game
  Else
    Begin
      Clear_Echo;
      Redisplay
    End
End; (* Save_The_Game *)

Function Restore_game : Boolean;
Var
  R_File : Long_String;
  i,j,arm_num,wep_num,l_r_num,r_r_num,disk_address,fudge,checknum:integer;
  ok_restore : Boolean;
  p:obj_ptr;
  q:mon_ptr;
  r:trap_ptr;
  g:text;
  uname:name_string;
  temp:char;
begin (* Restore_game *)
  For I := 1 to Name_Len Do
    R_File[I] := R_File_Name[I];
  R_File[Name_Len + 1] := Chr(0);
  Fix_String(R_File);
  ok_restore := True;
  fiddle_fdb(R_File);
  getfdb(R_File,disk_address);
  reset(g,r_file,0,0,[2],60000b);
  readln(g,i);
  Readln(g,seed);
  Readln(g,fudge);
  fudge := fudge + 1;
  If (i <> disk_address) or (fudge <> ((disk_address Mod 100B) + (seed Mod 40B)))
    Then
      begin
	close(g);
	edelete(R_File);
	ok_restore := False;
      End
    Else
  Begin
  CLS;
  Writeln(tty,'Restoring from: ',R_file_name);
  with world do
    for i := x_orig to s_max_x do
      for j := y_orig to s_max_y do
	begin
	  read(g,s_world[i,j],this_screen[j,i],screen[j,i]);
	  read(g,temp);
	  if temp = ' '
	    then mon[i,j] := Chr(0)
	    Else Mon[i,j] := Temp;
	  readln(g,temp);
	  if temp = ' '
	    then obj[i,j] := Chr(0)
	    Else obj[i,j] := Temp;
	  readln(g,room_array[i,j]);
	  readln(g,temp);
	  seeable[i,j] := (temp = '1');
	  readln(g,temp);
	  seen[i,j] := (temp = '1');
	  readln(g,temp);
(*	  show[i,j] := (temp = '1'); *)
	End;
  for j := y_orig to s_max_y do
    begin
      readln(g,temp);
      world.lines[j] := (temp = '1');
    end;
  readln(g,world.level,world.num_mons,world.max_mons,seed);
  for i := 1 to max_room do
    with world.rooms[i] do
      begin
	readln(g,max_x,max_y,abs_x,abs_y);
	readln(g,temp);
	light := (temp = '1');
	readln(g,temp);
	existant := (temp = '1');
	readln(g,temp);
	seen := (temp = '1');
	for j := 1 to max_doors do
	  readln(g,doors[j].abs_loc.x,doors[j].abs_loc.y,doors[j].secret);
	readln(g,orig_x[i],orig_y[i]);
	readln(g,temp);
	m_used_list[i] := (temp = '1');
	readln(g,temp);
	o_used_list[i] := (temp = '1');
      end;
  for i := 1 to max_monster do
    readln(g,monster[i].min_level);
  for i := 1 to max_potion do
    begin
      readln(g,potion[i].desc,potion[i].d_leng);
      readln(g,temp);
      potion[i].called := (temp = '1');
      readln(g,temp);
      potion[i].id := (temp = '1');
    end;
  for i := 1 to max_scroll do
    begin
      readln(g,scroll[i].desc,scroll[i].d_leng);
      readln(g,temp);
      scroll[i].called := (temp = '1');
      readln(g,temp);
      scroll[i].id := (temp = '1');
    end;
  for i := 1 to max_wand do
    begin
      readln(g,wand[i].desc,wand[i].d_leng);
      readln(g,temp);
      wand[i].called := (temp = '1');
      readln(g,temp);
      wand[i].id := (temp = '1');
      readln(g,temp);
      wand[i].is_wand := (temp = '1');
    end;
  for i := 1 to max_ring do
    begin
      readln(g,ring[i].desc,ring[i].d_leng);
      readln(g,temp);
      ring[i].called := (temp = '1');
      readln(g,temp);
      ring[i].id := (temp = '1');
    end;

  arm_num := 0;
  wep_num := 0;
  l_r_num := 0;
  r_r_num := 0;
  world.objs := nil;
  new(p);
  read(g,i);
  while i = 1 do
    begin
      if world.objs = nil
	then world.objs := p;
      read(g,j);
      case j of
	0: p^.obj_typ := amulet_t;
	1: p^.obj_typ := food_t;
	2: p^.obj_typ := ring_t;
	3: p^.obj_typ := wand_t;
	4: p^.obj_typ := scroll_t;
	5: p^.obj_typ := potion_t;
	6: p^.obj_typ := armor_t;
	7: p^.obj_typ := weapon_t;
	8: p^.obj_typ := gold_t;
	others: Begin
		  writeln(tty,'Error - Bad world object in restore_game');
		  ok_restore := False;
		End;
      end;
      readln(g,p^.loc.x,p^.loc.y);
      readln(g,p^.quan,p^.index,p^.plus_hit,p^.plus_dam);
      readln(g,temp);
      p^.know_magic := (temp = '1');
      readln(g,temp);
      p^.cursed := (temp = '1');
      read(g,i);
      if i = 1
	then
	  begin
	    new(p^.next);
	    p := p^.next;
	  end
	else p^.next := nil;
    End; (* while i = 1 *)
  new(p);
  player.obj_list := nil;
  while i = 2 do
    begin
      if player.obj_list = nil
	then player.obj_list := p;
      read(g,j);
      case j of
	0: p^.obj_typ := amulet_t;
	1: p^.obj_typ := food_t;
	2: p^.obj_typ := ring_t;
	3: p^.obj_typ := wand_t;
	4: p^.obj_typ := scroll_t;
	5: p^.obj_typ := potion_t;
	6: p^.obj_typ := armor_t;
	7: p^.obj_typ := weapon_t;
	8: p^.obj_typ := gold_t;
	others: Begin
		  writeln(tty,'Error - Bad player possession in restore_game');
		  ok_restore := False;
		End;
      end;
      readln(g,p^.loc.x,p^.loc.y);
      readln(g,p^.quan,p^.index,p^.plus_hit,p^.plus_dam);
      readln(g,temp);
      p^.know_magic := (temp = '1');
      readln(g,temp);
      p^.cursed := (temp = '1');
      read(g,i);
      if i = 2
	then
	  begin
	    new(p^.next);
	    p := p^.next;
	  end
	else p^.next := nil;
    end;
  world.monsters := nil;
  new(q);
  while i = 3 do
    begin
      if world.monsters = nil
	then world.monsters := q;
      readln(g,q^.index,q^.hp,q^.loc.x,q^.loc.y,q^.paralyzed_count);
      readln(g,q^.speed,q^.speed_count,q^.who_first,q^.confused_count);
      readln(g,temp);
      q^.awake := (temp = '1');
      read(g,i);
      if i = 3
	then
	  begin
	    new(q^.next);
	    q := q^.next;
	  end
	else q^.next := nil;
    end;
  world.traps := nil;
  new(r);
  while i = 4 do
    begin
      if world.traps = nil
	then world.traps := r;
      readln(g,r^.loc.x,r^.loc.y,r^.chance,r^.kind);
      read(g,i);
      if i = 4
	then
	  begin
	    new(r^.next);
	    r := r^.next;
	  end
	else r^.next := nil;
    end;
  if (i <> 5)
    Then ok_restore := False;
  readln(g,arm_num,wep_num,l_r_num,r_r_num);
  with player do
    begin
      readln(g,gold,xp,level,hp,temp,name);
      gold := gold div fudge;
      Readln(g,max_hp,st,max_st,dx,max_dx,iq,max_iq);
      readln(g,ac,Died_Count,faint_count,invis_count,speed,speed_count);
      ac := ac + fudge;
      readln(g,confused_count,blind_count,last_meal,heal_count,loc.x,loc.y);
      readln(g,paralyzed_count,sleep_count,trapped_count,fixed_count);
      readln(g,temp);
      will_confuse := (temp = '1');
      readln(g,temp);
      stuck := (temp = '1');
      readln(g,temp);
      has_amulet := (temp = '1');
      cur_arm := nil;
      cur_wep := nil;
      Cur_ring[Left_H] := nil;
      Cur_ring[Right_H] := nil;
    end;
  readln(g,checknum);
  if (checknum <> player.gold+player.level+disk_address+player.ST+player.DX)
    Then ok_restore := False;
  j := 0;
  p := player.obj_list;
  while p <> nil do
    begin
      j := j+1;
      if j = arm_num Then
	player.cur_arm := p
      Else If j = wep_num Then
	player.cur_wep := p
      Else If j = l_r_num Then
	player.Cur_ring[Left_H] := p
      Else If j = r_r_num Then
	player.Cur_ring[Right_H] := p;
      p := p^.next;
    End; (* while p <> nil *)
  readln(g,fruit_name);
  readln(g,save_file);
  readln(g,amulet_level);
  amulet_Level := Amulet_level - fudge;
  readln(g,blank_message);
  readln(g,scare_count);
  Readln(g,Player.eaten_Count,Player.Prev.X,Player.Prev.Y);
  If (Player.Eaten_Count > 0) Then
    Begin
      Monster[m_purple].AC := 9;
      Player.Eaten_Loss := Player.HP div (Player.Eaten_Count - 1)
    End;
  Player.Blind := (Player.Blind_Count > 0);
  close(g);
  Edelete(R_File);

  F_temp := False; (* #55 Set up For restart *)
  Fast := False;
  Virgin := false;
  Dead := false;
  Quit_game := false;
  Empty_echo := True;
  For I := X_orig To S_max_x Do
    For J := Y_orig To S_max_y Do
      False_array[I,J] := False;
  For I := 1 To 80 Do Nulls[I] := Chr(0);
  End;
  If Not Ok_Restore Then
    Writeln(tty,'The save file has been tampered with and has been deleted.')
  Else
    Restore_screen;
  Restore_Game := Ok_restore
End; (* Restore_game *)

(* Routine to find out who is using a particular player name.
   Appropriate messages for non-existant users and unknown names. *)

Procedure Whois;
Var
  Who,Uwho,Name:Name_string;
  Real_user:Long_string;
  Found,Is_user,More:Boolean;
  Usernum,Exists,Who_length,Name_length,Match:Integer;

Begin (* Whois *)
  If Switches.Terse_swi Then
    Echo('Whois:')
  Else
    Echo('Enter player name to identify:');
  Move_To_Echo;
  If Get_Line(Who,Who_length) Then (* #54 *)
    Begin
      Empty_echo := true;
      Clear_echo;
      Redisplay;
      Null_end_name(Who,UWho);
      Is_user := Valid(UWho,Usernum);
      Upcase(UWho,Uwho);
      Reset(Nm,Files.Names^,'/D/F/O',0,0,[29]);
      Found := False;
      More := True;
      While More Do
	If EOF(Nm) Then
	  More := False
	Else If Is_user Then
	  Begin
	    If (Nm^.Num = Usernum) Then
	      Begin
		Found := True;
		More := False;
		Echo_init;
		JSYS(41B,1;Real_user,Nm^.Num); (* DIRST *)
		Fix_String(Real_User);
		Name_Length := 80;
		While (Real_user[Name_length] = ' ') Do
		  Name_length := Name_length - 1;
		Write(F,Real_User:Name_Length,': ',Nm^.Nam);
		Echo(S)
	      End
	    Else
	      Get(Nm)
	  End
	Else
	  Begin
	    JSYS(41B,1,Exists;Real_user,Nm^.Num); (* DIRST *)
	    If (Exists = 2) Then
	      Begin
		Null_end_name(Nm^.Nam,Name);
		JSYS(565B;0,-1:UWho,-1:Name;Match); (* WILD% *)
		If (Match = 0) Then
		  Begin
		    Fix_String(Name);
		    Name_Length := Name_Len;
		    While (Name[Name_length] = ' ') Do
		      Name_length := Name_length - 1;
		    Echo_Init;
		    Write(F,Name:Name_length,': ');
		    Fix_String(Real_User); (* #60 *)
		    Write(F,Real_user);
		    If Found Then
		      More := Wait_For_Space(False);
		    Found := True;
		    Empty_Echo := True;
		    If More Then
		      Echo(S)
		    Else
		      Begin
			Clear_Echo;
			Redisplay
		      End
		  End
	      End;
	    Get(Nm)
	  End;
      If Not Found Then
	Echo('That name is not currently in use');
      Close(Nm)
    End
  Else
    Begin
      Empty_Echo := True;
      Clear_echo
    End
End; (* Whois *)

Procedure Version_Text;
Begin (* Version_Text *)
  Type_version;
  Writeln(tty);
  Writeln(tty,'Old features:  Bugs.');
  Writeln(tty,'    Compiled:  7 January 1988.');
  Writeln(tty);
  Writeln(tty,'  Written by:  Gary Craig, Oscar Erickson, John Relph, and Jay Skeer');
  Writeln(tty,'          at:  USC-ECL May-December, 1982');
  Writeln(tty,'    Modified:  Quite a bit.');
  Writeln(tty);
End; (* Version_Text *)

Procedure Disp_Version;
Var
  Ch : Char;
Begin (* Disp_Version *)
  Cls;
  Version_Text;
  Write(tty,'Report bugs to: ');
  JSYS(76B;-1:Bug_Add);	(* PSOUT *)
  Writeln(tty,' via mail.');
  DCA(1,24);
  Write(tty,'[Type anything to continue]');
  Ch := Comand;
  Restore_screen
End; (* Disp_Version *)

PROCEDURE Help;
VAR
  Ch : CHAR;
  Bogus : Boolean;
BEGIN (* Help *)
  Cls; (* Get them a new screen *)
  WRITELN(TTY,' -- ECL ROGUE command summary --');
  WRITELN(TTY);
  WRITELN(TTY,'			 -- Movement --');
  WRITELN(TTY,' b,1 - Down and Left	   j,2 - Down');
  WRITELN(TTY,' n,3 - Down and Right	   h,4 - Left');
  WRITELN(TTY,' f,5 - Fast prefix	   l,6 - Right');
  WRITELN(TTY,' y,7 - Up and Left	   k,8 - Up');
  WRITELN(TTY,' u,9 - Up and Right	   5 <Direction> or f <Direction> or');
  WRITELN(TTY,'				    <Capital direction> moves "Fast"');
  WRITELN(TTY);
  WRITELN(TTY,' Fast Movement will move until you see something of interest.');
  WRITELN(TTY,' If it is a monster you will not automatically attack it.');
  WRITELN(TTY);
  WRITELN(TTY,' To attack a monster (the single letters) move onto them.');
  WRITELN(TTY,' To pick up a treasure (everything else) move onto it.');
  WRITELN(TTY);
  WRITELN(TTY,' Type <escape> to abort any command in progress.');
  WRITELN(TTY);
  WRITE(TTY,'[Type anything to go on]');
  Ch := Comand;

  If Ch <> Chr(177B) Then (* #55 *)
Begin
  Cls;
  WRITELN(TTY,' -- ECL ROGUE command summary -- Other commands --');
  WRITELN(TTY,' e - To EAT food or fruit "&"       q - To QUAFF a potion "!"');
  WRITELN(TTY,' w - To WIELD another weapon ")"    t - To THROW a weapon "("');
  WRITELN(TTY,' T - To TAKE off armor "["          W - To WEAR armor "["');
  WRITELN(TTY,' P - To PUT-ON a ring "="           R - To REMOVE a ring "="');
  WRITELN(TTY,' r - To READ a scroll "?"           z - To ZAP a wand or staff "/"');
  WRITELN(TTY,' S - To SAVE a game                 Q - To QUIT a game');
  WRITELN(TTY,' / - To identify a screen symbol    ^ - To identify a TRAP');
  WRITELN(TTY,' o - To set your OPTIONS (Name, Fruit name, switches, etc.)');
  WRITELN(TTY,' C - To CALL an object by another name');
  WRITELN(TTY,' s - To SEARCH around you for traps and secret doors');
  WRITELN(TTY,' i - To see an INVENTORY of possessions');
  WRITELN(TTY,' I - To INVENTORY a single possession or type of possession');
  WRITELN(TTY,' > - To go down the Stairs "%" to the next level');
  WRITELN(TTY,' v - To see the ECL Rogue VERSION information');
  WRITELN(TTY,' Space - To rest and regain Hit-Points; To answer the "--More--" prompt');
  WRITELN(TTY,' Control-I - To re-INITIALIZE your terminal');
  WRITELN(TTY,' Control-R - To see the last message');
  WRITELN(TTY,' Control-L - To redraw the screen');
  WRITELN(TTY,' Control-T - To see system statistics');
  WRITELN(TTY,' Control-W - To find out WHO uses a certain ROGUE name');
  WRITELN(TTY,' Type the file ROGUE-INIT.INSTRUCTIONS to learn how to');
  WRITE(TTY,'   set up an initialization file.');
  Bogus := Wait_For_Space(True)
End; (* #55 *)
  Cls;
  Restore_Screen;
END; (* Help *)

Procedure What_symbol;
Var
  Ch : Char;
Begin (* What_symbol *)
  If Switches.Terse_swi Then
    Echo('Which symbol?')
  Else
    Echo('Which screen symbol do you want identified?');
  Move_To_Echo;
  Ch := Comand;
  If (Ch <> Chr(33B)) Then
    Begin
      Empty_echo := true;
      Echo_Init;
      Write(F,'''',Ch:1,''': ');
      If Ch In ['A'..'Z','a'..'z'] Then
	Begin
	  If Ch >= 'a' Then
	    Ch := Chr(Ord(Ch)-6B);
	  With Monster[Ord(Ch)-100B] do
	    Write(F,Long_name:Len)
	End
      Else
	Case Ch Of
	  '.':	write(f,'Floor');
	  '-',
	  '|':	write(f,'Wall');
	  '#':	write(f,'Corridor');
	  '+':	write(f,'Door');
	  '%':	write(f,'Stairway');
	  '@':	write(f,Player.Name);
	  '!':	write(f,'Potion');
	  '?':	write(f,'Scroll');
	  '/':	write(f,'Staff or Wand');
	  '^':	write(f,'Trap');
	  '$':	write(f,'The Amulet of Yendor');
	  '=':	write(f,'Ring');
	  '[':	write(f,'Armor');
	  ')':	write(f,'Weapon');
	  '*':	write(f,'Gold');
	  '&':	write(f,'Food');
	  ' ':	Write(f,'Rock');
	  Others: Write(F,'No such symbol')
	End;
      Echo(S)
    End
End; (* What_symbol *)

Procedure Toggle_Fast;
Begin
  if F_Temp Then
    Begin
      Fast := Not Fast;
      if Fast Then
	Echo('Fast mode is SET')
      Else
	Echo('Fast mode is RESET');
      F_Temp := False;
    End
  else
    F_Temp := True;
  Valid_Command := False;
  Do_Done := False;
End;

Procedure Bl_Old_World;
Var
  I : Integer;
Begin
  For I := 0 To 2 do
    Old_World[i] := '&'; (* empty *)
End;

Function Get_Map(Y,X : Integer) : Char;	(* They ARE backwards *)
Var
  Ch : Char;
Begin (* Get_Map *)
  Ch := World.S_World[X,Y];
  If World.Obj[X,Y] <> Chr(0) Then
    Ch := '!'; (* signal object *)
  If ((World.Mon[X,Y] <> Chr(0)) and (World.Mon[X,Y] <> '@')) Then
    Ch := 'M'; (* signal monster *)
  Get_Map := Ch
End; (* Get_Map *)

Procedure Set_World (Var World : View_Array; X,Y : Integer; Ch : Char);
Var
  Dir : Integer;
Begin
  Dir := (Ord(Ch) - 60B); (* '0' *)
  Valid_Command := True;
  World[1] := Get_Map (Y,X);
  If (((Dir in [1,3,7,9]) and (Player_Move in ['2','8','3','1'])) or
      (Dir in [2,8])) Then
    Begin
      World[0] := Get_Map (Y,X - 1);
      World[2] := Get_Map (Y,X + 1)
    End
  Else
    Begin
      World[0] := Get_Map (Y - 1,X);
      World[2] := Get_Map (Y + 1,X)
    End
End;

Function Poss_Dirs (Ch : Char) : Char;
Var
  Orig_Ch,Temp_Ch,
  x_init,y_init,
  i,j,Count : Integer;
Begin (* Poss_Dirs *)
  Count := 0;
  Orig_Ch := Ord(Ch);
  Case (Orig_ch - 60B) Of
    1 : Begin
	  x_init := 1;
	  y_init := -1
	End ;
    7 : Begin
	  x_init := 1;
	  y_init := 1
	End;
    9 : Begin
	  x_init := -1;
	  y_init := 1
	End;
    Others : Begin
	       x_init := -1;
	       y_init := -1
	     End
  End;
  With Player.Loc Do
    Begin
      i := 2 * y_init;
      Repeat
	i := i - y_init;
	if (((Y + i) >= Y_Orig) and ((Y + i) <= S_Max_Y)) Then
	  Begin
	    J := 2 * x_init;
	    Repeat
	      j := j - x_init;
	      if (((X + j) >= X_Orig) And ((X + j) <= S_Max_X)) Then
		if (Not (Get_map (Y + i,X + j) In [' ','-','|','^'])) Then
		  Begin
		    temp_ch := abs(i) + abs(j);
		    If ((temp_ch <> 0) and (temp_ch <> 2) or
			(Not (Get_Map (Y + i,X + j) In ['#','+']))) Then
		      Begin
			Temp_Ch := (5 + (i * (-3)) + j) + 60B;
			if (((Temp_Ch - 60B) + (Orig_Ch - 60B)) <> 10) Then
			  Ch := Chr(Temp_Ch);
			Count := Count + 1;
		      End
		  End;
	    Until (j = - x_init);
	  End;
      Until (i = - y_init);
    End;
  if (Count = 2) Then
    Begin
      Set_World(Old_World,Player.Loc.X,Player.Loc.Y,Ch);
      Valid_Command := True;
      Poss_Dirs := Ch
    End
  else
    Poss_Dirs := '0';
End; (* Poss_Dirs *)

Procedure Same_View (Y,X : Integer;Ch : Char);
Var
  i,dir : Integer;
  New_World : View_Array;
Begin (* Same_View *)
  Set_World(New_World,X,Y,Ch);
  I := 0;
  While (I < 3) do
    Begin
      if ((Old_World[i] <> New_World[i]) and
	  (Not (New_World[i] In [' ','-','|'])) and
	  (Old_World[i] <> '&')) Then (* empty *)
	Begin
	  Bl_Old_World;
	  Valid_Command := False;
	  if (New_World[i] = '!') Then (* Objects... *)
	    Dont_Turn := True;
	  I := 3
	End
      else
	Old_World[i] := New_World[i];
      I := I + 1
    End;
End; (* Same_View *)

Function In_Bounds (Y,X : Integer) : Boolean;
Begin
  In_Bounds := ((Y >= Y_Orig) and (Y <= S_Max_Y) and
		(X >= X_Orig) and (X <= S_Max_X))
End;

Procedure Movement (Ch : Char);
Var
  T,U,
  I,J : Integer;
  Dummy : Boolean;
  M : Mon_Ptr;
Begin (* Movement *)
  i := Ord(Ch) - 60B; (* '0' *)
  if (i > 6) Then
    Begin
      j := i - 8;
      i := -1;
    End
  Else if (i < 4) Then
    Begin
      j := i - 2;
      i := 1;
    End
  else
    Begin
      j := i - 5;
      i := 0;
    End;
  With Player.Loc Do
    Begin
      T := Y + I; (* and all the rest Of the T's and U's *)
      U := X + J;
      if In_Bounds(T,U) Then
	Begin
	  if (Not (Get_Map (T,U) In ['-','|',' ','M'])) Then
	    Begin
	      If Player.Stuck Then
		Give_Stuck_Message
	      Else If ((Not F_Temp) or (World.S_World[U,T] <> '^')) Then
		Begin
		  World.Mon[X,Y] := Chr(0);
		  Player.Prev := Player.Loc;
		  Y := T;
		  X := U;
		  Moved := True; (* HACK *)
		  World.Mon[X,Y] := '@';
		  Player_Takes_Step;
		  if F_Temp Then
		    Same_View(Y,X,Ch)
		  Else
		    Begin
		      Bl_Old_World;
		      Valid_Command := False
		    End
		End
	      Else
		Valid_Command := False;
	      If World.Obj[X,Y] In ['?','*','!','/','[',')','&','=','$'] Then
		Get_Treasure(X,Y);
	      If Trap_at(X,Y) Then (* #62 *)
		Begin
		  Step_on_trap(X,Y);
		  Valid_Command := False
		End
	    End
	  Else
	    Begin
	      Bl_Old_World;
	      Valid_Command := False;
	      If (Get_Map(T,U) = '^') Then
		Begin
		  Do_Done := False;
		  Valid_Command := False;
		  F_Temp := False;
		End;
	      If (Get_Map(T,U) = 'M') Then
		Begin
		  Do_Done := True;
		  M := Find_Mon(World.Monsters,U,T);
		  If (Not F_Temp) Then
		    Begin
		      Moved := True;
		      Dummy := Attack(U,T,Player.Cur_Wep)
		    End
		  Else If M <> NIL Then
		    If M^.Index = m_mimic Then
		      Begin
			Moved := True;
			Dummy := Attack(U,T,Player.Cur_Wep)
		      End
		    Else
		      Do_Done := False
		  Else
		    Do_Done := False;
		  F_Temp := False;
		  Fast := False
		End
	    End
	End
      Else (* If not In_Bounds *)
	Begin
	  Do_Done := False;
	  Valid_Command := False;
	End
    End (* With Player.Loc *)
End; (* Movement *)

Procedure Move_Player (Ch : Char);
Begin
  if Fast Then
    F_Temp := True;
  Movement(Ch);
  if Do_Done Then
    Begin
      If Valid_Command Then
	Player_Move := Ch;
      If ((Not Valid_Command) and F_Temp) Then
	Begin
	  Ch := Poss_Dirs(Ch);
	  If (Dont_Turn or (Ch = '0')) Then
	    Begin
	      F_Temp := False;
	      Dont_Turn := False;
	    End
	  Else If (Ch <> '0') Then
	    Begin
	      Has_Turned := Not Has_Turned;
	      Player_Move := Ch;
	      Do_Done := ((Not Has_Turned) or (* optimal turning *)
			  (World.S_World[Player.Prev.X,Player.Prev.Y] = '+'))
	    End
	End
    End
  Else If F_Temp Then
    F_Temp := False; (* must be False If invalid *)
End;

Function Move_Char(Ch : Char) : Char;
Var
  Maybe_Fast : Boolean;
  Ch_Num : Integer;
Begin (* Move_Char *)
  Maybe_Fast := False;
  Ch_Num := Ord(Ch);
  If (Ch_Num >= 101B) and (Ch_Num <= 132B) Then
    Begin
      Maybe_Fast := True;
      Ch := Chr(Ch_Num + 40B)
    End;
  Case Ch Of
    'k' : Ch := '8'; (* N *)
    'j' : Ch := '2'; (* S *)
    'l' : Ch := '6'; (* E *)
    'h' : Ch := '4'; (* W *)
    'u' : Ch := '9'; (* NE *)
    'y' : Ch := '7'; (* NW *)
    'n' : Ch := '3'; (* SE *)
    'b' : Ch := '1'; (* SW *)
    Others: Begin
              Maybe_Fast := False; (* nothing *)
              Ch := Chr(Ch_Num)
            End
  End;
  F_Temp := F_Temp or Maybe_Fast;
  Move_Char := Ch
End; (* Move_Char *)

Procedure Do_Player;
Var
  Ch : Char;
  Bogus : Boolean;
  Hand : Hand_Type;
Begin (* Do_Player *)
  Dont_Turn := Not Switches.Turn_Swi;
  Moved := False; (* HACK...COUGH *)
  Has_Turned := False;
  Repeat
    Do_Done := True;
    If Valid_Command Then
      Ch := Player_Move
    Else
      Ch := Comand;
    Ch := Move_Char(Ch);
    If Not (Empty_Echo or Valid_Command) Then
      Begin
	Clear_echo;
	Empty_Echo := True;
      End;
    If player.confused_count > 0 Then
      if (ch In ['1'..'4','6'..'9']) Then
	repeat
	  ch := chr(die(9)+60b)
	until ch <> '5';
    Case Ch Of
      '1','2',
      '3','4',
      '6','7',
      '8','9' : Begin
		  If (Player.Eaten_Count > 0) Then
		    Begin (* next line *)
		      Valid_Command := False;
		      Bogus := Attack(Player.Loc.X,Player.Loc.Y,Player.Cur_Wep)
		    End (* PURPLE GERM stuff *)
		  Else
		    Begin
		      Move_Player(Ch);
		      Do_Done := Moved and Do_Done (* Thrice dying hack *)
		    End
		End;
      'f','F',
      '5'     : Toggle_Fast;
      '.',' ' : ;
      'd','D' : Do_Done := Drop;
      'e','E' : Do_Done := Eat_Food;
      'q'     : Do_Done := Quaff_potion;
      'r'     : Do_Done := Read_scroll;
      'T'     : Do_Done := Take_off_armor;
      't'     : Do_Done := Throw;
      'W'     : Do_Done := Wear_armor;
      'w'     : Do_Done := Wield_weapon;
      'P'     : Do_Done := Put_on_ring;
      'R'     : Do_Done := Remove_Ring;
      'z','Z' : Do_Done := Zap_wand;
      'i'     : Begin
		  (* Bogus *)
		  Ch := Inventory(Player.obj_list,All_t,False); (* #1 *)
		  Do_Done := False
		End;
      'I'     : Begin
		  Slow_inventory(Player.Obj_list);
		  Do_Done := False
		End;
      '>'     : Do_Done := Down_Stairs;
      '^'     : Do_Done := Trap_Identify;
      'C'     : Do_Done := Call_obj;
      'Q'     : Do_Done := Stop(true);
      'S'     : Save_The_Game;
      'o','O' : Begin
		  Set_options;
		  Do_Done := False
		End;
      's'     : Search(Player.Loc.X,Player.Loc.Y);
      'v'     : Begin
		  Disp_Version;	(* #50 *)
		  Do_Done := False
		End;
      '?'     : Begin
		  Help;
		  Do_Done := False
		End;
      '/'     : Begin
		  What_symbol;
		  Do_Done := False
		End;
      Others  : Begin
		  Do_Done := False;
		  Case Ord(ch) Of
		    12B : Do_Done := False;
		    14B : Restore_Screen; (* ^L *)
		    27B : Whois; (* ^W *)
		    24B : Begin (* ^T *)
			    DCA(1,1);
			    S := Spaces;
			    Empty_Echo := True;
			    Ctrl_t(S); (* #60 *)
			    Echo(S);
			    Empty_echo := False
			  End;
		    22B : Echo(Spaces); (* ^R *)
		    11B : Begin (* ^I *)
			    Settty;
			    Restore_screen
			  End;
		    3B  : Do_Done := Stop(false); (* ^C *)
		    Others : Begin
			       Flush_input;
			       Scr_Text(1,'Invalid Command');
			       Redisplay;
			       Empty_Echo := True;
			       Clear_Echo
			     End
		  End (* Case Ord(ch) *)
		End
    End; (* Case Ch *)

     (* If in fast mode and jumpswitch is on then display as soon as
      movement is invalid. *)
    If ((Not Valid_command) and	(Ch In ['1'..'4','6'..'9']) and
	(Switches.Jump_Swi)) Then
      Update_screen
  Until Do_Done;
  For Hand := Left_H To Right_H Do
    If (Player.Cur_ring[Hand] <> NIL) Then
      If (Player.Cur_ring[Hand]^.Index = R_teleport) Then
	Begin
	  If Die(50) = 1 Then
	    Teleportation
	End
      Else If Player.Cur_ring[Hand]^.Index = R_search Then
	Search(Player.Loc.X,Player.Loc.Y)
End; (* Do_Player *)

(* The higher the Adj the greater the chance of saving *)
Function Save_vs_poison (Adj : Integer) : Boolean;
Begin (* Save_vs_poison *)
  If (Die(20) = 1) Then
    Save_vs_poison := False
  Else
    Save_vs_poison := ((Die(20) + Adj) >= (14 - Player.Level))
End; (* Save_vs_poison *)

Procedure Move_monsters;
Var
  M_changed_speed,P_changed_speed,Go_again : Boolean;
  M_Max : Integer;
  NextM : Mon_Ptr; (* #6 *)

  Procedure Giant_Ant_Special;
  Begin (* Giant_Ant_Special *)
    If (Not Save_Vs_Poison(0)) Then
      If (Player.Dx <= 1) Then
	Begin
	  Dead := True; (* They lose! *)
	  Killer := 'A';
	  Want_scores := true;
	  If Player.Blind Then
	    Echo('You have been totally paralyzed')
	  Else If Switches.Terse_Swi Then
	    Echo('The ant has paralyzed you')
	  Else
	    Echo('The ant paralyzes you, and drags you away to be fed to the Queen')
	End
      Else
	Begin
	  Player.Dx := Player.Dx - 1;
	  Change_stats := Change_stats![s_top];
	  If Player.Blind Then
	    If Switches.Terse_Swi Then
	      Echo('You have been stung')
	    Else
	      Echo('You are stung and your joints become stiff')
	  Else If Switches.Terse_Swi Then
	    Echo('The ant has stung you')
	  Else
	    Echo('The ant''s stinger penetrates your skin and your joints become stiff')
	End
  End; (* Giant_Ant_Special *)

  Procedure Wraith_Special;
  Begin (* Wraith_Special *)
    If (Not Save_Vs_Poison(-2)) and (not has_on_ring(r_sustain)) Then
      If (Player.St <= 1) Then
	Begin
	  Dead := True; (* They lose! *)
	  Killer := 'W';
	  Want_scores := true;
	  If Not (Switches.Terse_Swi or Player.Blind) Then
	    Echo('You feel the wraith drain the last of your bodies'' warmth away');
	  Echo('You have become a wraith');
	  If (Not Switches.Terse_Swi) Then
	    Echo('And, thus, have lost all desire to find the Amulet of Yendor');
	End
      Else
	Begin
	  If Not (Switches.Terse_Swi or Player.Blind) Then
	    echo('As the wraith touches you, you feel your body grow cold')
	  Else
	    echo('You feel cold');
	  Player.St := Player.St - 1;
	  Change_stats := Change_stats![s_top];
	End;
  End; (* Wraith_Special *)

  Procedure Vampire_Special;
  Var
    t:integer;
  Begin (* Vampire_Special *)
    If (Not Save_Vs_Poison(+2)) Then (* Give them a chance... *)
      If (Player.level = 1) Then
	Begin
	  Dead := True; (* They lose! *)
	  Killer := 'V';
	  Want_scores := true;
	  If Not (Switches.Terse_Swi or Player.Blind) Then
	    Echo('You scream in anguish as the vampire drains your remaining energy');
	  Echo('You have become a vampire');
	  If (Not Switches.Terse_Swi) Then
	    Echo('And, thus, have lost all desire to find the Amulet of Yendor');
	End
      Else
	Begin
	  If Player.Blind Then
	    Echo('You feel fangs sink into your shoulder')
	  Else If (Switches.Terse_Swi) Then
	    echo('The vampire sucks your blood')
	  Else
	    echo('You feel the vampire''s fangs sink into your shoulder');
	  With Player do
	    begin
	      level := level - 1;
	      XP := (Two_to_the(level-1)*10)-1;
	      T := min(die(10),die(10));
	      HP := HP-T;
	      Max_HP := Max_HP - T;
	    end;
	  Change_stats := Change_stats![s_bottom]
	end;
  End; (* Vampire_Special *)

  Procedure Intellect_Devourer_Special;
  Begin (* Intellect_Devourer_Special *)
    If (Not Save_Vs_Poison(Player.IQ - 14)) Then
      Begin
	If (Switches.Terse_Swi or Player.Blind) Then
	  echo('You feel tormented')
	Else
	  Echo('You feel tormented as the intellect devourer''s ego-whip strikes');
	If Die(10) = 1 Then
	  Player.IQ := Player.IQ - 2
	Else Player.IQ := Player.IQ - 1;
	Change_stats := Change_stats![s_top];
	If (Player.IQ < 1) Then
	  Begin
	    Dead := True; (* They lose! *)
	    Killer := 'i';
	    Want_scores := true;
	    If Not (Switches.Terse_Swi or Player.Blind) Then
	      Echo('The intellect devourer has ego-whipped your mind into froth!');
	    Echo('You become a raving idiot!');
	    If (Not Switches.Terse_Swi) Then
	      Echo('And, thus, have lost all desire to find the Amulet of Yendor');
	  End
      End
  End; (* Intellect_Devourer_Special *)

  Procedure Umber_Hulk_Special;
  Begin (* Umber_Hulk_Special *)
    If Not (Save_Vs_Poison(0) or Player.Blind) Then
      Begin
	If (Switches.Terse_Swi) Then
	  echo('You are confused')
	Else
	  echo('The gaze of the umber hulk has confused you');
	If Player.IQ < 7 Then
	  Player.Confused_count := 30
	Else Player.Confused_count := 15
      End
  End; (* Umber_Hulk_Special *)

  Procedure Rust_monster_special;
  Begin
    If (Player.Cur_arm <> NIL) Then
      If Not Save_vs_poison(Player.Cur_Arm^.Plus_hit + 1) Then
	Begin
	  If (Player.Cur_arm^.Index = A_leather) Then
	    Begin
	      If Not (Switches.Terse_swi or Player.Blind) Then
		Begin
		  Echo('The rust monster does not affect your leather armor');
		  Empty_echo := True
		  End
	    End
	  Else
	    If (Player.Ac < 10) and (Not Has_on_ring(R_protect)) Then
	      Begin
		If Switches.Terse_swi Then
		  Echo('Your armor weakens')
		Else Echo('Your armor appears to have weakened!  Oh my!');
		Player.Cur_arm^.Plus_hit := Player.Cur_arm^.Plus_hit - 1;
		Figure_Ac
	      End
	End
  End; (* Rust_monster_special *)

  Procedure Leprechaun_special (Var M : Mon_ptr); (* #6 *)
  Begin (* Leprechaun_Special *)
    If Not Save_vs_poison(Player.Dx-15) then
      Begin
	Echo('Your purse feels lighter');
	Player.Gold := Max(Player.Gold-Die(300),0);
	If Die(10) <= 2 Then
	  Player.Gold := Max(Player.Gold-Die(300),0);
	Change_stats := Change_stats![S_bottom];
	Del_mon(M)
      End
  End; (* Leprechaun_Special *)

  Procedure Nymph_special (Var M : Mon_ptr); (* #6 *)
  Var
    Stolen : Obj_ptr;
    I : Integer;
    Ch : Char;
    Hand : Hand_type;
    TempM : Mon_Ptr; (* #6 *)
  Begin
    Echo_Init;
    If (Not Save_vs_poison(0)) Then
      Begin
	Stolen := Pick_Random_Object(Ch);
	If Stolen <> NIL Then
	  Begin
	    Stolen := Take_from_pack(Ch,Player.Obj_list,All_t,True,False);
	    With Player Do
	      If Stolen = Cur_arm Then
		Begin
		  Cur_arm := NIL;
		  Figure_ac
		End
	      Else if (stolen = cur_wep) Then
		cur_wep := nil
	      Else
		For Hand := Left_H To Right_H Do
		  If (Stolen = Cur_Ring[Hand]) Then
		    Begin
		      Cur_Ring[Hand] := NIL;
		      take_it_off(stolen)
		    End;
	    Write(F,'She stole ');
	    Write_obj_name(F,Stolen,Not_Another);
	    If Stolen^.Obj_typ = Amulet_t Then
	      Player.Has_amulet := false;
	    Del_mon(M)
	  End
	End
  End;

  Procedure Purple_worm_special (M : Mon_Ptr);
  Begin (* Man, is this mean! *)
    if not save_vs_poison(0) Then
      begin
	if switches.terse_swi or Player.Blind Then
	  Echo('It swallows you...Gulp!')
	Else
	  Echo('Everything goes dark as the purple worm swallows you whole');
	Player.Eaten_Count := 7;
	Player.Eaten_Loss := Player.HP div 6; (* six turns til death *)
	World.Mon[Player.Loc.X,Player.Loc.Y] := Chr(0);
	Player.Prev := Player.Loc;
	Player.Loc := M^.Loc;
	World.Lines[M^.Loc.Y] := True;
	World.Lines[Player.Loc.Y] := True;
	Player_Disappears;
	World.Seeable[M^.Loc.X,M^.Loc.Y] := True;
	Monster[M_purple].AC := 9
      end
  end;

  Procedure Floating_eye_special;
  begin (* Floating_eye_special *)
    If (Player.Fixed_count = 0) and (Not Player.Blind) Then
      Begin
	If (Not Save_vs_poison(2)) Then (* a break for low-level people *)
	  Begin
	    If Switches.Terse_swi Then
	      Echo('You are transfixed')
	    Else
	      echo('You are transfixed by the gaze of the floating eye');
	    player.fixed_count := die(5)+5;
	  end
      end;
  end; (* Floating_eye_special *)

  Procedure Mimic_Special;
  Begin (* Mimic_Special *)
    player.stuck := True
  End; (* Mimic_Special *)

  procedure Violet_fungi_special;
  begin (* Violet_fungi_special *)
    player.stuck := true;
  end; (* Violet_fungi_special *)

  Procedure Blindheim_Special;
  Var
    I,J : Integer;
  Begin (* Blindheim_special *)
    If Not (Save_vs_poison(0) Or Player.Blind) Then
      Begin
	Player.Blind_count := die(10) + 10;
	Player.Blind := True;
	For J := Redisp_Y_Orig to Redisp_Max_Y Do
	  World.Lines[J] := True;
	If Switches.Terse_swi Then
	  Echo('You are blinded')
	Else Echo('You are blinded by the gaze of the blindheim');
      End;
  End; (* Blindheim_special *)

  Procedure Crypt_Thing_Special;
  Begin (* Crypt thing special *)
    If not Save_vs_Poison(-1) then
      Begin
	Teleportation;
	If Not Player.Blind Then
	  Begin
	    If switches.terse_swi Then
	      echo('You are teleported')
	    Else echo('The crypt thing teleports you away');
	  End;
      End;
  end; (* Crypt thing special *)

  Procedure Homonculous_Special;
  Begin (* Homonculous_Special *)
    if (not (save_vs_poison(4) or Player.Blind)) Then (* a break for low-level people *)
      If Player.Sleep_Count = 0 then
	Begin
	  Player.sleep_count := Player.Sleep_Count + die(10);
	  If Switches.Terse_Swi Then
	    echo('You sleep')
	  Else
	    echo('The homonculous puts you to sleep');
	End
  End;

  Procedure Phantom_Stalker_Special (M : Mon_Ptr);
  Var
    I : Integer;
  Begin (* Phantom_Stalker_Special *)
    If die (5) > 4 then (* what the hell *)
      Begin
	Repeat
	  m^.index := die(max_monster)
	Until ((Not (M^.Index In [M_juiblex,M_Lep,M_nymph,M_gith,M_Mimic]))
		 and  (Monster[M^.Index].Min_Level < Maxint));
	M^.Hp := (M^.Hp * Monster[M^.Index].Hit_dice) div Monster[M_phantom].Hit_dice;
	World.Lines[M^.Loc.Y] := True;
	M^.Paralyzed_count := 1;
	World.Mon[M^.Loc.X,M^.Loc.Y] := Monster[M^.Index].Name
      End
  End; (* Phantom_Stalker_Special *)

  Procedure Revenant_Special;
  Begin
    If (Player.Paralyzed_Count = 0) and (Not Player.Blind) then
      If not save_vs_Poison(-1) then
	Begin
	  Player.Paralyzed_Count := die (8);
	  If Switches.Terse_Swi Then
	    Echo('You are scared stiff')
	  Else Echo ('The revenant has paralyzed you with terror');
	End;
  End; (* Revenant_Special *)

  Procedure Sandman_Special (Var M : Mon_Ptr); (* #6 *)
  Begin
    If Not save_vs_Poison(-4) then
      If Player.Sleep_Count = 0 then
	Begin
	  If Die (10) < 4 then
	    Begin
	      If Die (10) < 5 Then
		Del_mon(M);
	      Player.Sleep_Count := die (8);
	      If (Player.Blind or Switches.terse_swi) then
		Echo('You fall asleep')
	      Else
		Echo('The sandman puts you to sleep');
	    End;
	End;
  End; (* Sandman_Special *)

  Procedure Umpleby_Special;
  Var
    T : Integer;
  Begin (* Umpleby_Special *)
    T := Die(40);
    If T <= 10 then
      Begin
	Echo_Init;
	Player.HP := Player.HP - T;
	If (Switches.Terse_Swi or Player.Blind) Then
	  Write(f,'You are zapped')
	Else Write(f,'The umpleby zaps you with electricity');
	If Kill_Player Then
	  Killer := 'u'
	Else
	  Change_stats := Change_stats![s_bottom];
	Echo(s);
      End
  end; (* Umpleby_Special *)

  Procedure Hurt_Player (Var M : Mon_Ptr); (* #6 *)
  Var
    I, T, Adj : Integer;
  Begin (* Hurt_Player *)
    If Switches.Flush_Swi Then (* Flush TYPE ahead IF needed *)
      Flush_Input;
    Valid_Command := False;
    F_Temp := False;
    Fast := False;
    Adj := 0;
    with player do (* figure adjustments to armor class *)
      Begin
	If Dx >= 15 Then
	  Adj := -(Dx-14)
	Else If Dx <= 6 Then
	  Adj := (7-Dx);
	If Has_on_ring(R_invis) Then
	  Adj := Adj - 1; (* Was 2 *)
	If M^.Index = M_gith Then (* Githyanki''s silver sword *)
	  Adj := Adj + 3
	Else if m^.index = m_death Then
	  adj := adj + 4
      End;
      (* normal attacks *)
    If (Monster[M^.Index].Special <> 2) Then (* Monster has a Normal *)
      If (Die(20) >= (Monster[M^.Index].Th0 - (Player.Ac+Adj))) Then
	Begin
	  T := 0;
	  For i := 1 to Monster[M^.Index].Num Do
	    T := T + Die(Monster[M^.Index].Dam);
	  If (T > 0) and (Player.HP > 0) Then
	    Begin
	      Echo_Init;
	      With Monster[M^.Index] Do
		If player.blind Then
		  Write(f,'It')
	      Else Write(f,'The ',Long_Name:Len);
	      M_Max := Trunc(T / Player.Max_Hp * (Player.Level+6));
	      Case Die(2) of
		1 : Case M_Max of
		      0 : Write(f,' grazes you');
		      1 : Write(f,' scratches you');
		      2 : Write(f,' beats on your face');
		      3 : Write(f,' really puts it to you');
		      4 : Write(f,' maims you horribly');
		      Others : Write(f,' rapes you severely')
		    End;
		2 : Case M_Max of
		      0 : Write(F,' slimes you');
		      1 : Write(F,' nicks you');
		      2 : Write(F,' strikes a decent blow');
		      3 : Write(F,' hurts you bad');
		      4 : Write(F,' horms you');
		      Others : Write(F,' wounds you grievously')
		    End
	      End;
	      Player.Hp := Player.Hp - T;
	      If Kill_Player Then
		Killer := Monster[M^.Index].Name
	      Else
		Change_stats := Change_stats![s_bottom];
	      Echo(s)
	    End
	End
      Else If (Player.Hp > 0) Then
	Begin (* The monster misses its normal attack *)
	  Echo_Init;
	  With Monster[M^.Index] do
	    If player.blind Then
	      write(f,'It missed')
	    Else
	      Write(f,'The ',Long_name:len,' missed');
	  Echo(S);
	  T := 0
	End;
      (* Handle special attacks *)

      If Player.Hp > 0 Then (* don''t do specials if he is dead *)
	If ((Monster[M^.Index].Special = 2)
	    or ((Monster[M^.Index].Special = 3) and (T > 0))) Then
	  Case M^.Index of (* Monster gets his special *)
	    M_ant     : Giant_Ant_Special;
	    M_eye     : Floating_eye_special;
	    M_fungi   : Violet_fungi_special;
	    M_lep     : Leprechaun_special(M);
	    M_int     : Intellect_Devourer_Special;
	    M_mimic   : Mimic_Special;
	    M_nymph   : Nymph_special(M);
	    M_purple  : Purple_worm_special(M);
	    M_rust    : Rust_monster_special;
	    M_umber   : Umber_Hulk_Special;
	    M_vampire : Vampire_Special;
	    M_wraith  : Wraith_Special;
	    M_blind   : Blindheim_Special;
	    M_crypt   : Crypt_Thing_Special;
	    M_homon   : Homonculous_Special;
	    M_phantom : Phantom_Stalker_Special(M);
	    M_revenant: Revenant_Special;
	    M_sand    : Sandman_Special(M);
	    M_umpleby : Umpleby_Special;
	    Others    : ;
	  End
  End; (* Hurt_Player *)

  Procedure Mon_Move (Nx, Ny : Integer); (* #6 New fn *)
  Begin (* Move away from old loc *)
    World.Mon[M^.Loc.X,M^.Loc.Y] := Chr(0);
    (* But only tell the display routines if we need to *)
    If (World.Seeable[M^.Loc.X,M^.Loc.Y]) Then
      World.Lines[M^.Loc.Y] := True;
    If Not World.Seen[M^.Loc.X,M^.Loc.Y] Then
      World.Seeable[M^.Loc.X,M^.Loc.Y] := False
    Else If World.S_World[M^.Loc.X,M^.Loc.Y] = '#' Then
      If (Player.Seemon_count > 0) Then
	World.Seeable[M^.Loc.X,M^.Loc.Y] := False;
    M^.Loc.X := Nx; (* And towards new location *)
    M^.Loc.Y := Ny;
    If (Player.SeeMon_Count > 0) Then
      World.Seeable[Nx,Ny] := True;
    If (World.Seeable[Nx,Ny]) Then
      World.Lines[Ny] := True;
    World.Mon[Nx,Ny] := Monster[M^.Index].Name
  End; (* #6 End of New fn *)

  Function Distance (Nx,Ny,Ox,Oy : Integer) : Integer; (* #6 *)
  Begin
    Distance := Sqr(Nx - Ox) + Sqr(Ny - Oy)
  End;

  Procedure Towards_Player (M : Mon_Ptr; Towards : Boolean); (* #64 *)
  Var
    Tx,Ty,Dx,Dy,I,Dist,Ndist,Room : Integer; (* #6 *)
    Move_at_all,Found_Door : Boolean;

    Procedure Move_One_Towards (Px,Py : Integer); (* #6 add this fn *)
    Var
      I,J,Dx,Dy : Integer;
    Begin
      Move_at_all := False;
      Tx := M^.Loc.X;
      Ty := M^.Loc.Y;
      Dist := Distance(Tx,Ty,Px,Py);
      For I := -1 to 1 Do
	For J := -1 to 1 Do
	  Begin
	    Dx := M^.Loc.X + I;
	    Dy := M^.Loc.Y + J;
	    If Can_move_to(Dx,Dy) Then
	      Begin
		Ndist := Distance(Dx,Dy,Px,Py);
		If ((Ndist <= Dist) = Towards) Then
		  Begin
		    Tx := Dx;
		    Ty := Dy;
		    Dist := Ndist;
		    Move_at_all := True
		  End
	      End
	  End
    End;

    Procedure Move_One_Away (Px,Py : Integer); (* #6 add this fn *)
    Var
      I,J,Dx,Dy : Integer;
    Begin
      Move_at_all := False;
      Tx := M^.Loc.X;
      Ty := M^.Loc.Y;
      Dist := Distance(Tx,Ty,Px,Py);
      For I := -1 to 1 Do
	For J := -1 to 1 Do
	  Begin
	    Dx := M^.Loc.X + I;
	    Dy := M^.Loc.Y + J;
	    If Can_move_to(Dx,Dy) Then
	      Begin
		Ndist := Distance(Dx,Dy,Px,Py);
		If ((Ndist >= Dist) = Towards) Then
		  Begin
		    Tx := Dx;
		    Ty := Dy;
		    Dist := Ndist;
		    Move_at_all := True
		  End
	      End
	  End
    End;

  Begin (* Towards_Player *)
    Move_At_All := False;
    If ((M^.Loc.X <> Player.Loc.X) or (M^.Loc.Y <> Player.Loc.Y)) Then
      Begin
	Room := World.Room_array[M^.Loc.X,M^.Loc.Y];
	If (World.Room_array[Player.Loc.X,Player.Loc.Y] = Room) and
	   (Room <> 0) Then
	  Begin (* in same room *)
	    Move_One_Towards(Player.Loc.X,Player.Loc.Y); (* #6 *)
	    If Move_at_all Then
	      Begin
		Mon_Move(Tx,Ty); (* #6 add this stuff *)
		M^.Last_Dir := '5'
	      End
	  End (* in same room *)
	Else If Room = 0 Then
	  Begin	(* in hallway *)
	    Echo_Init;
(*	    Write(f,'Hall: '); *)
	    If M^.Last_dir in Okdirs Then
	      Begin
		Translate_Direction(M^.Last_Dir,Dx,Dy);
		Write(f,'Moving ',Monster[M^.Index].Name,' Dir ',M^.Last_Dir,
		      ' = (',Dx:0,',',Dy:0,')');
		Move_One_Away(M^.Loc.X - Dx*2,M^.Loc.Y - Dy*2); (* was +,+ *)
(*		If Not Move_at_All Then
		  Begin
		    Towards := Not Towards;
		    Move_Mon_One(M^.Loc.X - Dx,M^.Loc.X - Dy);
		    Towards := Not Towards
		  End; *)
		If Move_At_All Then
		  Begin
		    If World.Room_array[Tx,Ty] = 0 Then
		      M^.Last_Dir := Delta_Dir[Tx - M^.Loc.X,Ty - M^.Loc.Y];
		    Write(F,' actual ',M^.Last_Dir,' (',Tx-M^.Loc.X:0,',',
			  Ty-M^.Loc.Y:0,')');
		    Mon_Move(Tx,Ty)
		  End
		Else
		  M^.Last_Dir := '5';
(*		Echo(S) *)
	      End
	    Else
	      Begin (* haven''t picked a direction yet *)
		Move_One_Towards(Player.Loc.X,Player.Loc.Y); (* #6 *)
		If Move_at_all Then
		  Begin
		    M^.Last_Dir := Delta_Dir[Tx - M^.Loc.X,Ty - M^.Loc.Y];
		    Mon_Move(Tx,Ty) (* #6 add this stuff *)
		  End
		Else
		  Begin
		    Move_One_Away(Player.Loc.X,Player.Loc.Y);
		    If Move_at_All Then
		      Begin
			M^.Last_Dir := Delta_Dir[Tx - M^.Loc.X,Ty - M^.Loc.Y];
			With M^ Do
			  Write(f,'Moving ',Monster[Index].Name,' from (',
				Loc.X:0,',',Loc.Y:0,') to (',Tx:0,',',Ty:0,
				') delta ',Last_Dir,'(',
				Tx-Loc.X:0,',',Ty-Loc.Y:0,')');
			Mon_Move(Tx,Ty)
		      End
		  End
	      End;
(*	    Echo(s) *)
	  End (* in hallway *)
	Else
	  Begin	(* in a different room *)
	    Room := World.Room_array[M^.Loc.X,M^.Loc.Y]; (* #6 *)
	    Dist := Maxint;
	    I := 1;
	    Found_Door := False;
	    While I <= Max_Doors Do
	      Begin
		Move_At_All := False;
		With World.Rooms[Room] Do
		  If World.S_world[Doors[I].abs_loc.x,doors[I].abs_loc.y] = '+' Then
		    Begin
		      Dx := Doors[I].abs_loc.x;
		      Dy := Doors[I].abs_loc.y;
		      If (Dx = M^.Loc.X) and (Dy = M^.Loc.Y) Then
			Begin
			  If M^.Last_dir in Okdirs Then
			    Begin
			      Translate_Direction(M^.Last_Dir,Dx,Dy);
			      Move_One_Towards(M^.Loc.X + Dx*2,M^.Loc.Y + Dy*2)
			    End;
			  If Move_at_All Then
			    I := Max_Doors + 1 (* Exit Loop *)
			  Else
			    Begin
			      Move_One_Towards(Player.Loc.X,Player.Loc.Y);
			      If Move_At_All Then
				Begin
				  Tx := Player.Loc.X;
				  Ty := Player.Loc.Y;
				  I := Max_Doors + 1 (* Exit Loop *)
				End
			    End
			End
		      Else
			Begin
			  NDist := Distance(Dx,Dy,Player.Loc.X,Player.Loc.Y);
			  If ((NDist <= Dist) = Towards) Then
			    Begin
			      Tx := Dx;
			      Ty := Dy;
			      Dist := NDist;
			      Move_At_All := True
			    End
			End
		    End;
		I := I + 1;
		If Move_At_All Then
		  Found_Door := True
	      End;
	    If Found_Door Then
	      Move_One_Towards(Tx,Ty);
	    If Move_At_All Then
	      Begin
		M^.Last_Dir := Delta_Dir[Tx - M^.Loc.X,Ty - M^.Loc.Y];
		Mon_Move(Tx,Ty)
	      End
	  End (* #6 in a different room *) (* #6 End of add *)
      End
  End; (* Towards_Player *)

  Procedure Random_Move (M : Mon_Ptr);
  Var
    I, J, Tx, Ty : Integer;
    X_Disp, Y_Disp : Array[0..2] Of Integer;
    Found : Boolean;
  Begin (* Random_Move *)
    If ((M^.Loc.X <> Player.Loc.X) or (m^.loc.Y <> Player.Loc.y)) Then
      Begin
	X_Disp[0] := Die(3)-2;
	Repeat
	  X_Disp[1] := Die(3)-2
	Until (X_Disp[0] <> X_Disp[1]);
	X_Disp[2] := -(X_Disp[0] + X_Disp[1]);
	Y_Disp[0] := Die(3)-2;
	Repeat
	  Y_Disp[1] := Die(3)-2
	Until (Y_Disp[0] <> Y_Disp[1]);
	Y_Disp[2] := -(Y_Disp[0] + Y_Disp[1]);
	I := 0;
	Found := False;
	Repeat
	  Tx := M^.Loc.X + X_Disp[I];
	  J := 0;
	  Repeat
	    Ty := M^.Loc.Y + Y_Disp[J];
	    If ((Ty <> M^.Loc.X) or (Ty <> M^.Loc.Y)) Then
	      Found := Can_Move_To(Tx,Ty);
	    J := J + 1
	  Until ((J = 2) or Found);	(* I know this is weird. *)
	  I := I + 1
	Until ((I = 2) or Found); (* this too. *)
	If Found Then
	  Mon_Move(Tx,Ty) (* #6 *)
      End
  End; (* Random_Move *)

  Function Can_Attack(L : Loc_Type):Boolean;
  Begin (* Can_Attack *)
    Can_Attack := ((Abs(L.X - Player.Loc.X) <= 1) And
		   (Abs(L.Y - Player.Loc.Y) <= 1) and
		   (Player.Eaten_Count = 0));
  End; (* Can_Attack *)

Begin (* Move_Monsters *)
  P_changed_speed := False;
  With Player Do
    If Speed_count <> 0 Then
      Begin
	If Speed_count < 0 Then
	  Begin
	    Speed_count := (-Speed_count)+6+Die(4);
	    P_changed_speed := True;
	  End
	Else
	  Begin
	    Speed_count := Speed_count-1;
	    If Speed_count = 0 Then
	      Begin
		Speed := 2;
		Echo('You feel normal again');
		P_changed_speed := True;
	      End;
	  End;
      End;
  While (M <> NIL) Do
    With M^ Do
      Begin
	NextM := Next; (* #6 *)
	M_changed_speed := False;
	If Speed_count <> 0 Then
	  If Speed_count < 0 Then
	    Begin
	      Speed_count := (-Speed_count)+6+Die(4);
	      M_changed_speed := True;
	    End
	  Else
	    Begin
	      Speed_count := Speed_count-1;
	      If Speed_count = 0 Then
		Begin
		  Speed := 2;
		  M_changed_speed := True;
		End;
	    End;
	If P_changed_speed Or M_changed_speed Then
	  If Player.Speed = Speed Then
	    Who_first := 0
	  Else If Player.Speed < Speed Then
	    Who_first := -2
	  Else Who_first := 2;
	If Who_first = 2 Then
	  Who_first := 1
	Else
	  Repeat
	    If Who_first <> 0 Then
	      If Who_first = 1 Then
		Who_first := 2
	      Else If Who_first = -2 Then
		Who_first := -1
	      Else Who_first := -2;
	    Go_again := (Who_first = -1);
	    If Awake Then
	      Begin
		If (Paralyzed_count > 0) Then
		  Paralyzed_count := Paralyzed_count - 1
		Else If (Index In [M_crypt,M_fungi,M_mimic]) Then
		  Begin
		    If (Confused_count > 0) Then
		      Begin
			Confused_count := Confused_count - 1;
			If (Die(8)=1) And Can_attack(Loc) Then
			  Hurt_player(M)
		      End
		    Else
		      Begin
			If Can_attack(Loc) Then
			  Hurt_player(M)
		      End
		  End
		Else If Confused_count > 0 Then
		  Begin
		    Random_move(M);
		    Confused_count := Confused_count - 1
		  End
		Else If Scare_count > 0 Then
		  Begin
		    Scare_count := Scare_count-1;
		    Towards_Player(M,False)
		  End
		Else If (Has_On_Ring(r_invis) and (Die(10) > 7)) Then
		  Random_Move(M)
		Else If Can_Attack(Loc) Then
		  Begin
		    If ((Index = m_blind) and
			(Player.Blind) and (die(5)=1)) Then
		      Random_Move(M)
		    Else If ((Index In [m_bat,m_invis,m_phantom])
			     and (die(5) = 1)) Then
		      Random_Move(M)
		    Else
		      Hurt_Player(M)
		  End
		Else
		  Towards_Player(M,True);
	      End; (* #6 If Awake *)
	    If (M = NIL) or Dead Then (* #6 *)
	      Go_Again := False	(* #60 *)
	  Until Not Go_again;
	M := NextM (* #6 *)
      End
End; (* Move_Monsters *)

Procedure Create_file (Name : Long_string; Prot : String8);
Var
  Filename : Long_string;
  Overwrite : Boolean;
  I,J : Integer;
Begin (* Create_file *)
  Filename := Name;
  I := 80;
  While (Ord(Name[I]) = 0) Do I := I - 1;
  Overwrite := True;
  Write(tty,'Creating ');
  JSYS(76B;-1:Filename); (* PSOUT *)
  Writeln(tty);
  Reset(F,Filename,'/D/F/O/I',[14]); (* no jobwide logical names *)
  If Erstat(F) = 0 Then
    Begin
      Writeln(tty,'File already exists; retaining old version.');
      Overwrite := False
    End;
  Close(F);
  For J := 1 to 8 Do
    Filename[I+J] := Prot[J];
  If Overwrite Then
    Begin
      Rewrite(F,Filename,'/D/F/O',[14]); (* no jobwide logical names *)
      If Erstat(F) <> 0 Then (* any errors? *)
	Writeln(tty,'I/O error when creating file, file not created.');
      Close(F)
    End
End; (* Create_file *)

Procedure Perhaps_Save;
Var
  I, J : Integer;
  Ch : Char;
Begin (* Perhaps_Save *)
  For J := Real_Y_Orig to Real_Max_Y Do
    Begin
      World.Lines[J] := True;
      For I := Real_X_Orig to Real_Max_X Do
	World.Screen[j,i] := ' '
    End;
  Change_Stats := [];
  Scr_Text(3,'A large cloud of green smoke appears in front of you.  It clears away');
  Scr_Text(4,'to reveal a tall wizard, clothed in grey.  He fixes you with a steely');
  Scr_Text(5,'glare and declares, "The average of load is too high."  With that he');
  Scr_Text(6,'makes a single pass over you with his hands, and everything around you');
  Scr_Text(7,'fades away into a grey nothingness.');
  Redisplay;
  Empty_Echo := False;
  Echo('Would you like to save your game so far?');
  Move_To_Echo;
  Repeat
    Ch := Comand;
    If (Ch in ['n','N']) Then (* #59 *)
      Begin
	Empty_Echo := True;
	Echo('Are you sure?');
	Move_To_Echo;
	Repeat
	  Ch := Comand
	Until (Ch In ['y','Y','n','N']);
	If (Ch in ['y','Y']) Then
	  Ch := 'N'
	Else
	  Begin
	    Ch := ' ';
	    Empty_Echo := True;
	    Echo('Would you like to save your game so far?');
	    Move_To_Echo
	  End
      End
  Until (Ch In ['y','Y','n','N']);
  If (Ch In ['y','Y']) Then
    Save_Game
  Else
    Begin
      Quit_game := True;
      Killer := ' ';
      Want_scores := False
    End
End; (* Perhaps_Save *)

Procedure Bury_Player; (* #2 *)
Var
  Pname,Monstr1,Monstr2,Goldstr : Name_String;
  Killstr : Long_String;
  An : Packed Array[1..2] of Char;
  I,J : Integer;
  More : Boolean;

  Procedure Center (Var Str : Name_String);
  Var
    I,J,Len : Integer;
  Begin (* Center *)
    Len := 25;
    While (Str[Len] = Space) Do
      Len := Len - 1;
    I := (25 - Len ) div 2;
    For J := Len downto 1 Do
      Str[J+I] := Str[J];
    For J := 1 to I Do
      Str[J] := Space
  End; (* Center *)

Begin (* Bury_Player *)
  Pname := Player.Name;
  Center(Pname);
  Monstr1 := '                              ';
  Monstr2 := '                              ';
  Goldstr := '                              ';
  If (Player.Gold > 0) Then
    Begin
      StrWrite(F,Goldstr);
      Write(F,'Score: ',Player.Gold:0,' g.p.');
      Center(Goldstr);
    End;
  Killstr := Spaces;
  StrWrite(F,Killstr);
  Write_Killer(F,Killer);
  I := 80;
  While (Killstr[I] = Space) Do
    I := I - 1;
  If (I > 25) Then
    Begin
      An[1] := Killstr[12]; (* #3 evil stuff, I know, but it works *)
      An[2] := Killstr[13]; (* isn''t that what they always says? *)
      If (An = 'an') Then
	J := 14
      Else If (An = 'a ') Then
	J := 13
      Else
	J := 11;
      For I := 2 to J-1 Do (* #3 *)
	Monstr1[I-1] := Killstr[I];
      For I := 1 to 25 Do (* #3 *)
	Monstr2[I] := Killstr[I+J];
      Center(Monstr2);
    End
  Else
    Begin
      For I := 2 to 25 Do (* #3 *)
	Monstr1[I-1] := Killstr[I]
    End;
  Center(Monstr1);
  Writeln(tty,'            -----------------------');
  Writeln(tty,'           /         REST          \\');
  Writeln(tty,'          /           IN            \\');
  Writeln(tty,'         /           PEACE           \\');
  Writeln(tty,'         |             *             |"');
  Writeln(tty,'         | ',Pname:25,' |"');
  Writeln(tty,'         |             *             |"');
  Writeln(tty,'         | ',Monstr1:25,' |"');
  Writeln(tty,'         | ',Monstr2:25,' |"');
  Writeln(tty,'         | ',Goldstr:25,' |"');
  Writeln(tty,'________)\\_//)/)\|//|(_\\|)(/_)//\\|()//_________');
  Writeln(tty);
  Write(tty,'[Press space to continue, delete to stop]');
  Player_move := Comand;
  If (Player_Move = Chr(177B)) Then
    Writeln(tty)
  Else
    CLS
End; (* Bury_Player *)

Function Play_The_Game : Q_Reason; (* #55 *)
Var
  P : Mon_Ptr;
  Can_Move : Boolean;
  Last_Food, Y : Integer;
  Hand : Hand_Type;
  New_Mon : Mon_Ptr; (* #55 *)

  Function Ring_Usage (P : Obj_Ptr) : Integer;
  Begin (* Ring_Usage *)
    If P = NIL Then
      Ring_Usage := 0
    Else
      Case P^.Index Of
	r_invis,
	r_regen : Ring_Usage := 1;
	r_digest : Ring_Usage := -1;
	r_vampiric,
	r_search : If Die(5) = 5 Then
	  Ring_Usage := 1
	Else Ring_Usage := 0;
	Others : Ring_Usage := 0
      End
  End; (* Ring_Usage *)

Begin (* Play_The_Game *)
  Repeat
    (* See if he awakes from a hunger faint *)
    Can_Move := True;
    If Player.faint_count > 0 Then
      Begin
	Player.faint_count := Player.faint_count - 1;
	If (Player.faint_Count = 0) and (Player.Sleep_Count = 0) Then
	  Echo('You wake up')
	Else Can_Move := False
      End;
    (* See if he is no longer paralyzed *)
    If player.paralyzed_count > 0 Then
      begin
	player.paralyzed_count := player.paralyzed_count - 1;
	if player.paralyzed_count = 0 Then
	  Echo('You can move again')
	Else Can_Move := False
      End;
    (* See if he wakes up from a sleep *)
    if player.sleep_count > 0 Then
      begin
	player.sleep_count := player.sleep_count - 1;
	if (player.sleep_count = 0) and (Player.Faint_Count = 0) Then
	  Echo('You wake up')
	Else Can_Move := False
      End;
    (* See if he is un-transfixed *)
    if player.fixed_count > 0 Then
      begin
	player.fixed_count := player.fixed_count-1;
	if player.fixed_count = 0 Then
	  Echo('You can move again')
	Else Can_Move := False
      End;
    (* See if he gets out of a beartrap *)
    if player.trapped_count > 0 Then
      If Can_Move Then
	Begin
	  Player.Trapped_count := Player.Trapped_count - 1;
	  If Player.Trapped_count = 0 Then
	    If Switches.Terse_swi Then
	      Echo('You free yourself')
	    Else Echo('You pry yourself from the jaws of the beartrap')
	  Else Can_Move := False
	End;
    If Can_Move Then Do_Player;
    (* Handle Detect_Monsters *)
    If Player.SeeMon_Count > 0 Then
      Begin
	Player.SeeMon_Count := Player.SeeMon_Count - 1;
	If Player.SeeMon_Count = 0 Then
	  Begin
	    p := world.monsters;
	    while p <> nil do
	      Begin
		World.Seeable[p^.loc.x,p^.loc.y] := False;
		World.Lines[P^.Loc.Y] := True;
		p := p^.next
	      End;
	    Player_Appears
	  End
      End;
    (* Handle confusion *)
    If player.confused_count > 0 Then
      begin
	player.confused_count := player.confused_count-1;
	if player.confused_count = 0 Then
	  echo('You feel less confused now');
      end;
    (* Handle blindness *)
    If player.blind_count > 0 Then
      begin
	player.blind_count := player.blind_count - 1;
	If player.blind_count = 0 Then
	  no_more_blindness;
      end;
    (* Handle see invisibility *)
    If player.invis_count > 0 Then
      player.invis_count := player.invis_count - 1;
    (* Generate new monsters *)
    With World Do
      If (Num_mons < Max_mons) Then
	If Die(100) = 1 Then
	  Begin
	    Gen_monster(Level,Room_array[Player.Loc.X,Player.Loc.Y],New_mon,True);
	    Place_monster(New_mon)
	  End;
    Last_Food := Player.Last_Meal;
    Player.Last_Meal := Player.Last_Meal + Player.Speed +
			Ring_Usage(Player.Cur_ring[Left_H]) +
			Ring_Usage(Player.Cur_ring[Right_H]);
    If (Player.Last_Meal >= Hungry_Meal) and (Last_Food < Hungry_Meal) Then
      Begin
	Change_stats := Change_stats![s_bottom];
	Echo('You are getting hungry')
      End
    Else If (Player.Last_Meal >= Weak_Meal) and (Last_Food < Weak_Meal) Then
      Begin
	Change_stats := Change_stats![s_bottom];
	Echo('You are beginning to feel light-headed')
      End
    Else If ((Player.Last_Meal >= Fainting_Meal) and
	     (Player.faint_count = 0)) Then
      If die(7) = 1 Then
	Begin
	  Valid_Command := false;
	  F_Temp := False;
	  Player.faint_count := die(4)+5;
	  Change_stats := Change_stats![s_bottom];
	  If Not Switches.Terse_swi Then
	    Echo('You have passed out from hunger!')
	  Else
	    Echo('You faint')
	End;
    With Player Do (* Does the player get healed? *)
      If (Trapped_Count = 0) Then (* #57 optimize slightly *)
	If (Paralyzed_Count = 0) Then
	  If (Fixed_Count = 0) Then
	    Begin
	      Player.Heal_Count := Player.Heal_Count + 1;
	      If (Player.Level < 13) Then (* #4 *)
		Begin
		  For Hand := Left_H To Right_H Do
		    If (Player.Cur_Ring[Hand] <> NIL) Then
		      If (Player.Cur_Ring[Hand]^.Index = R_Regen) Then
			Player.Heal_Count := Player.Heal_Count + (13 - Player.Level);
		  While (Player.Heal_Count >= (13 - Player.Level)) Do
		    Begin
		      Player.Heal_Count := Player.Heal_Count - (13 - Player.Level);
		      If (Player.Hp < Player.Max_Hp) Then
			Begin
			  Player.Hp := Player.Hp + 1;
			  Change_stats := Change_stats![s_bottom]
			End
		    End
		End
	    End;
    If (Player.Eaten_Count > 0) Then
      Begin
	Player.HP := Player.HP - Player.Eaten_Loss;
	Player.Eaten_Count := Player.Eaten_Count - 1;
	If (Player.Eaten_Count = 0) or (Player.HP <= 0) Then
	  Begin
	    Dead := True; (* They lose! *)
	    Killer := 'P';
	    Want_scores := true;
	    If (Not (Switches.Terse_Swi or (Player.Blind_Count > 0))) Then
	      Echo('The Purple Worm has digested you')
	    Else Echo('You are digested');
	    If (Not Switches.Terse_Swi) Then
	      Echo('And, thus, you have lost all desire to find the Amulet of Yendor');
	  End
	Else
	  Change_Stats := Change_Stats![s_bottom]
      End;
    If (Change_stats <> []) and (not Valid_Command) Then
      Begin
	If Game_Check Then
	  If Not_Staffer Then
	    Perhaps_Save
      End;
    If Not (Dead or Quit_game) Then
      Begin
	Update_Screen; (* Show what the player did *)
	Move_Monsters(World.Monsters); (* Move the icky-bobs *)
	If Not Dead Then
	  Update_Screen (* Show what THEY did *)
      End
  Until Dead or Quit_game;
  If Dead Then
    Begin
      For Y := Redisp_y_orig to Redisp_max_y Do
	World.Lines[Y] := False;
      Echo('[Press space to continue, delete to stop]'); (* #2 *)
      Move_To_Echo;
      Repeat
	Player_Move := Comand;
      Until (Player_Move in [' ','0',Chr(177B)])
    End;
  If Quit_Game Then
    If Saved Then
      Play_The_Game := Saved_R
    Else
      Play_The_Game := Quit_R
  Else If (killer = '$') Then (* #2 *)
    Play_the_game := Winner_R
  Else If (Killer <> ' ') Then
    Begin
      Player.Gold := Player.Gold-(Player.Gold div 20);
      Play_The_Game := Died_R
    End
End; (* Play_The_Game *)

Procedure Do_setup; (* #62 Many changes to this procedure *)
Var
  More : Boolean;
Begin (* Do_Setup *)
  Init_staffy('ROGUE',Bug_Add,Files); (* #62 *)
  Create_file(Files.Score^,';P776060');
  Reset(F,Files.Score^,'/d/f/o/i');
  Close(F); (* to make reference date non-zero *)
  Create_file(Files.Names^,';P776060');
  Create_file(Files.Log^,';P776464');
  Create_File(Files.Message^,';P774040'); (* #57 *)
  With Files Do
    Begin
      Fix_String(Log^);
      Fix_String(Message^);
      Fix_String(Names^);
      Fix_String(Score^)
    End;
  Writeln(tty,'Saving as ROGUE.EXE');
  Setup := False;
  Save_self(Rogue_version,Rogue_Update,Rogue_edit) (* #50 *)
End; (* Do_Setup *)

Procedure First_Screen;	(* #57 changed a lot *)
Var
  Ch : Char;
  Line : Long_String;
  Len,I,J : Integer;
  Displayed : Boolean;
Begin (* First_Screen *)
  Displayed := Not_Staffer;
  If Displayed Then
    Begin
      Type_Version;
      Writeln(tty);
      Writeln(tty,'WARNING!  ECL ROGUE is an extremely time-consuming game to run.');
      Writeln(tty,'          If you are low on funds, you should not play.');
      Writeln(tty,'          Please have consideration for those trying to do work.');
      Writeln(tty)
    End;
  Reset(F,Files.Message^,'/D/F/O',[14]);
  If (Erstat(F) = 0B) Then
    If Not EOF(F) Then
      Begin
	If Not Displayed Then
	  Begin
	    Type_Version;
	    Writeln(tty)
	  End;
	While Not EOF(F) Do
	  Begin
	    Readln(F,Line:Len);
	    Writeln(tty,Line:Len)
	  End;
	Displayed := True
      End;
  Reset(F,'Rogue.Scores','/D/F/O/I',[14]);
  If (Erstat(F) <> 0) Then
    Begin
      If Not Displayed Then
	Type_Version;
      Displayed := True
    End;
  If Displayed Then
    Writeln(tty);
  If Displayed Then
    Begin
      Write(tty,'Report ECL ROGUE bugs via mail to ');
      JSYS(76B;-1:Bug_Add); (* PSOUT *)
      Writeln(tty,'.');
      Writeln(tty,'Be specific about the errors, and save the game if possible.');
      DCA(1,24);
      Write(tty,'[Type anything to continue]');
      Ch := Comand;
      Cls
    End;
  Empty_Echo := True;
  Echo_Init;
  Write(f,'Just a moment while I dig the dungeon, ',Player.Name);
  Echo(s);
  Second_Init; (* #63 *)
  New_Place_Player;
  Player_Appears;
  Update_Screen
End; (* First_Screen *)

Begin  (* The MAIN Begin *)
  If Setup Then
    Do_Setup
  Else If Not Virgin Then
    Writeln(tty,'?ROGUE: May not be restarted')
  Else If NoPlay Then (* #47 can he play? *)
    Begin
      Writeln(tty,'?ROGUE: The ROGUE-Master has denied you access.');
      Writeln(tty,'        Contact the ROGUE-Master for further obfuscation.')
    End
  Else If (Game_Check and Not Staffy) Then (* #57 *)
    Begin
      Writeln(tty,'I''m terribly sorry, but the Dungeon of Doom is closed.');
      Writeln(tty,'Only wizards are permitted within the dungeon right now.');
      Writeln(tty,'Try again when there are fewer lusers on the system.')
    End
  Else
    Begin (* begin to play *)
      First_Init; (* #63 *)
      Rdinit(Player.Name,Fruit_name,Save_file,Switches);
      Fix_String(Player.Name);
      Fix_String(Save_File);
      Fix_String(Fruit_Name);
      If Name_check Then
	Begin (* This is the game portion *)
	  LogIni;
	  Cls;
	  Not_Staffer := Not Staffy;
	  If Rescan(R_file_name) Then (* #63 *)
	    If Restore_Game Then
	      Reason := Saved_R
	    Else
	      Reason := Quit_R
	  Else
	    Reason := Died_R;
	  If (Reason <> Quit_R) Then
	    Begin
	      If (Reason = Died_R) Then
		First_Screen; (* #63 *)
	      Reason := Play_The_Game; (* #55 *)
	      Cls;
	      Logplayer(Files.Log^,Reason); (* #49,#55 *)
	      If ((Player_Move <> Chr(177B)) and (Switches.Tomb_swi) and
		  (Reason = Died_r)) Then
		Bury_Player (* #2 *)
	    End;
	  If (Not Saved) and Want_scores Then
	    Show_scores(Player.Gold,World.Level,Killer,Player_Move<>Chr(177B))
	  Else
	    DeInterrupts
	End (* This is the game portion *)
      Else
	Begin
	  Deinterrupts; (* #63 *)
	  Writeln(tty,'Your name is already in use.  Please choose another.')
	End;
      Restty (* #49 Put in right place *)
    End (* begin to play *)
End. (* of the greatest achievement of Western Civilization *)
