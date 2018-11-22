(*$D-,C-,A-,M+*)
 (* Program to give rogue scores without playing.
   Gary Craig/Jay Skeer/John Relph/Oscar Erickson
   Summer, 1982 *)

Program RStat;

Include 'Rogue.Constants';

Type
  Long_string = Packed Array[1..80] of char;
  Name_string = Packed array[1..30] of char;
  P_name_rec = ^Name_rec;
  Name_rec = Record
	       Nam : Name_string;
	       Num : Integer;
	       Next : P_name_rec
	     End; (* #63 *)
  Monsters = Record
	       Long_Name : Name_String;
	       Name : Char;
	       Len : Integer;
	     End;
  Score_rec = Record
		User : Integer;
		Score : Integer;
		Day : Packed Array[1..5] Of Char;
		Killer : Char;
		Level : Integer
	      end;
  Score_array = array[1..10] of score_rec;
  FName_Rec = Record (* #62 *)
		Log : ^Long_String;
		Message : ^Long_String;
		Names : ^Long_String;
		Score : ^Long_String
	      End;

Var
  Bug_Add : Long_String;
  Files : FName_Rec; (* #62 *)
  Done,setup : Boolean;
  Monster : Array [1..Max_Monster] Of Monsters;
  Nm : File of Name_Rec;

initprocedure; (* #2 lowercase all monster names *)
begin
    setup:=true;

    Monster[m_ant].Long_Name := 'giant ant                     ';
    Monster[m_ant].Name := 'A';
    Monster[m_ant].Len := 9;

    Monster[m_bat].Long_Name := 'bat                           ';
    Monster[m_bat].Name := 'B';
    Monster[m_bat].Len := 3;

    Monster[m_centaur].Long_Name := 'centaur                       ';
    Monster[m_centaur].Name := 'C';
    Monster[m_centaur].Len := 7;

    Monster[m_dragon].Long_Name := 'dragon                        ';
    Monster[m_dragon].Name := 'D';
    Monster[m_dragon].Len := 6;

    Monster[m_eye].Long_Name := 'floating eye                  ';
    Monster[m_eye].Name := 'E';
    Monster[m_eye].Len := 12;

    Monster[m_fungi].Long_Name := 'violet fungi                  ';
    Monster[m_fungi].Name := 'F';
    Monster[m_fungi].Len := 12;

    Monster[m_gnoll].Long_Name := 'gnoll                         ';
    Monster[m_gnoll].Name := 'G';
    Monster[m_gnoll].Len := 5;

    Monster[m_hob].Long_Name := 'hobgoblin                     ';
    Monster[m_hob].Name := 'H';
    Monster[m_hob].Len := 9;

    Monster[m_invis].Long_Name := 'invisible stalker             ';
    Monster[m_invis].Name := 'I';
    Monster[m_invis].Len := 17;

    Monster[m_jackal].Long_Name := 'jackal                        ';
    Monster[m_jackal].Name := 'J';
    Monster[m_jackal].Len := 6;

    Monster[m_kobold].Long_Name := 'kobold                        ';
    Monster[m_kobold].Name := 'K';
    Monster[m_kobold].Len := 6;

    Monster[m_lep].Long_Name := 'leprechaun                    ';
    Monster[m_lep].Name := 'L';
    Monster[m_lep].Len := 10;

    Monster[m_mimic].Long_Name := 'mimic                         ';
    Monster[m_mimic].Name := 'M';
    Monster[m_mimic].Len := 5;

    Monster[m_nymph].Long_Name := 'nymph                         ';
    Monster[m_nymph].Name := 'N';
    Monster[m_nymph].Len := 5;

    Monster[m_orc].Long_Name := 'orc                           ';
    Monster[m_orc].Name := 'O';
    Monster[m_orc].Len := 3;

    Monster[m_purple].Long_Name := 'purple worm                   ';
    Monster[m_purple].Name := 'P';
    Monster[m_purple].Len := 11;

    Monster[m_quasit].Long_Name := 'quasit                        ';
    Monster[m_quasit].Name := 'Q';
    Monster[m_quasit].Len := 6;

    Monster[m_rust].Long_Name := 'rust monster                  ';
    Monster[m_rust].Name := 'R';
    Monster[m_rust].Len := 12;

    Monster[m_snake].Long_Name := 'snake                         ';
    Monster[m_snake].Name := 'S';
    Monster[m_snake].Len := 5;

    Monster[m_troll].Long_Name := 'troll                         ';
    Monster[m_troll].Name := 'T';
    Monster[m_troll].Len := 5;

    Monster[m_umber].Long_Name := 'umber hulk                    ';
    Monster[m_umber].Name := 'U';
    Monster[m_umber].Len := 10;

    Monster[m_vampire].Long_Name := 'vampire                       ';
    Monster[m_vampire].Name := 'V';
    Monster[m_vampire].Len := 7;

    Monster[m_wraith].Long_Name := 'wraith                        ';
    Monster[m_wraith].Name := 'W';
    Monster[m_wraith].Len := 6;

    Monster[m_xorn].Long_Name := 'xorn                          ';
    Monster[m_xorn].Name := 'X';
    Monster[m_xorn].Len := 4;

    Monster[m_yeti].Long_Name := 'yeti                          ';
    Monster[m_yeti].Name := 'Y';
    Monster[m_yeti].Len := 4;

    Monster[m_zombie].Long_Name := 'zombie                        ';
    Monster[m_zombie].Name := 'Z';
    Monster[m_zombie].Len := 6;

    Monster[m_almiraj].Long_Name := 'al-mi''raj                     ';
    Monster[m_almiraj].Name := 'a';
    Monster[m_almiraj].Len := 9;

    Monster[m_blind].Long_Name := 'blindheim                     ';
    Monster[m_blind].Name := 'b';
    Monster[m_blind].Len := 9;

    Monster[m_crypt].Long_Name := 'crypt thing                   ';
    Monster[m_crypt].Name := 'c';
    Monster[m_crypt].Len := 11;

    Monster[m_death].Long_Name := 'death knight                  ';
    Monster[m_death].Name := 'd';
    Monster[m_death].Len := 12;

    Monster[m_ettin].Long_Name := 'ettin                         ';
    Monster[m_ettin].Name := 'e';
    Monster[m_ettin].Len := 5;

    Monster[m_flind].Long_Name := 'flind                         ';
    Monster[m_flind].Name := 'f';
    Monster[m_flind].Len := 5;

    Monster[m_gith].Long_Name := 'githyanki                     ';
    Monster[m_gith].Name := 'g';
    Monster[m_gith].Len := 9;

    Monster[m_homon].Long_Name := 'homonculous                   ';
    Monster[m_homon].Name := 'h';
    Monster[m_homon].Len := 11;

    Monster[m_int].Long_Name := 'intellect devourer            ';
    Monster[m_int].Name := 'i';
    Monster[m_int].Len := 18;

    Monster[m_juiblex].Long_Name := 'Juiblex                       ';
    Monster[m_juiblex].Name := 'j';
    Monster[m_juiblex].Len := 7;

    Monster[m_kill].Long_Name := 'killmoulis                    ';
    Monster[m_kill].Name := 'k';
    Monster[m_kill].Len := 10;

    Monster[m_larva].Long_Name := 'larva                         ';
    Monster[m_larva].Name := 'l';
    Monster[m_larva].Len := 5;

    Monster[m_minotaur].Long_Name := 'minotaur                      ';
    Monster[m_minotaur].Name := 'm';
    Monster[m_minotaur].Len := 8;

    Monster[m_norker].Long_Name := 'norker                        ';
    Monster[m_norker].Name := 'n';
    Monster[m_norker].Len := 6;

    Monster[m_owlbear].Long_Name := 'owlbear                       ';
    Monster[m_owlbear].Name := 'o';
    Monster[m_owlbear].Len := 7;

    Monster[m_phantom].Long_Name := 'phantom stalker               ';
    Monster[m_phantom].Name := 'p';
    Monster[m_phantom].Len := 15;

    Monster[m_quaggoth].Long_Name := 'quaggoth                      ';
    Monster[m_quaggoth].Name := 'q';
    Monster[m_quaggoth].Len := 8;

    Monster[m_revenant].Long_Name := 'revenant                      ';
    Monster[m_revenant].Name := 'r';
    Monster[m_revenant].Len := 8;

    Monster[m_sand].Long_Name := 'sandman                       ';
    Monster[m_sand].Name := 's';
    Monster[m_sand].Len := 7;

    Monster[m_tira].Long_Name := 'tirapheg                      ';
    Monster[m_tira].Name := 't';
    Monster[m_tira].Len := 8;

    Monster[m_umpleby].Long_Name := 'umpleby                       ';
    Monster[m_umpleby].Name := 'u';
    Monster[m_umpleby].Len := 7;

    Monster[m_vodyanoi].Long_Name := 'vodyanoi                      ';
    Monster[m_vodyanoi].Name := 'v';
    Monster[m_vodyanoi].Len := 8;

    Monster[m_werewolf].Long_Name := 'werewolf                      ';
    Monster[m_werewolf].Name := 'w';
    Monster[m_werewolf].Len := 8;

    Monster[m_xvart].Long_Name := 'xvart                         ';
    Monster[m_xvart].Name := 'x';
    Monster[m_xvart].Len := 5;

    Monster[m_yulgrin].Long_Name := 'yulgrin                       ';
    Monster[m_yulgrin].Name := 'y';
    Monster[m_yulgrin].Len := 7;

    Monster[m_zallige].Long_Name := 'zallige                       ';
    Monster[m_zallige].Name := 'z';
    Monster[m_zallige].Len := 7;
End;

Function Comand : Char; Extern;

Procedure Settty; Extern;

Procedure TrmChk; Extern;

Procedure Restty; Extern;

Procedure Scores (Var List1,List2 : Score_array;
		  Person : Score_rec;
		  Ss : Long_string); Extern;

Procedure Init_Staffy(S : String;
		      Var Bug : Long_String;
		      Files : FName_Rec); Extern; (* #62 *)

Procedure Save_rstat; Extern;

Procedure CLS; Extern;

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

Function Get_Names : P_name_rec; (* #63 *)
Var
  More : Boolean;
  This_un : Name_Rec;
  Names,Entry : P_name_rec;
Begin (* Get_names *)
  Names := NIL;
  Reset(Nm,Files.Names^,'/D/F/O');
  More := True;
  While More Do
    If EOF(Nm) Then
      More := False
    Else
      Begin
	This_Un := Nm^;
	Get(Nm);
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

Procedure Write_name (Names : P_name_rec; Usernum : Integer);
Var (* #63 *)
  More : Boolean;
  Name : Long_string;
  Entry : P_name_rec;
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

Procedure Show_Scores;

Var
  All_time,Weekly : Score_array;
  This_Guy : Score_Rec;
  i:integer;
  ch:char;
  Names : P_name_rec;

Procedure Write_killer(Killer : Char);
Var
  Mon_num : Integer;
Begin (* Write_killer *)
  If killer = ' ' Then
    Write(tty,' Quit')
  Else If killer = '$' Then
    Write(tty,' A Winner!')
  Else If killer = ')' Then
    Write(tty,' Killed by an arrow')
  Else If killer = '=' Then
    Write(tty,' Killed by magic')
  Else If killer = 'j' Then
    Write(tty,' Killed by Juiblex')
  Else
    Begin
      If killer >= 'a' Then
	Mon_num := Ord(killer) - Mon_hi_offset
      Else
	Mon_num := Ord(killer) - Mon_lo_offset;
      With Monster[Mon_num] Do
	If (Long_Name[1] in ['A','E','H','I','O','U']) Then
	  Write(tty,' Killed by an ',Long_name:Len)
	Else
	  Write(tty,' Killed by a ',Long_name:Len)
    End
End; (* Write_killer *)

Begin (* Show_Scores *)
  This_guy.User := 0;
  This_guy.Score := 0;
  This_guy.Level := 0;
  This_guy.Day := '     ';
  This_guy.Killer := '?';
  Scores(All_time,Weekly,This_guy,Files.Score^);
  Cls; (* #63 *)
  Names := Get_names; (* #63 *)
  Writeln(tty,'Weekly high scores:');
  For i:=1 To 41 Do Write(tty,'-'); Writeln(tty);
  For I:=1 To 10 Do
    With Weekly[I] Do
      If Score > 0 Then
	Begin
	  Write(tty,i:2,'. ',score:5,' ');
	  Write_name(Names,User); (* #63 *)
	  Write(tty,' ',day:5);
	  write_killer(killer);
	  Writeln(tty,' (',level:0,')')
	End;
  Write(tty,'[Type anything for all-time high scores, or delete to ignore]');
  If (Comand = Chr(177B)) Then
    Writeln(tty)
  Else
    Begin
      CLS; (* #63 *)
      Writeln(tty,'All-time high scores:');
      For i:=1 To 41 Do Write(tty,'-'); Writeln(tty);
      For i:=1 To 10 Do
	With all_time[i] Do
	  If score > 0 Then
	    Begin
	      Write(tty,i:2,'. ',score:5,' ');
	      Write_Name(Names,User);
	      Write(tty,' ',Day:5);
	      Write_killer(Killer);
	      Writeln(tty,' (',Level:0,')')
	    End
    End
End; (* Show_scores *)

Begin
  If Setup Then
    Begin
      Init_Staffy('R-STAT',Bug_Add,Files);
      Writeln(tty,'Saving as R-STAT.EXE');
      Setup := False;
      Save_rstat
    End
  Else
    Begin
      JSYS(100B;100B); (* CFIBF *)
      Trmchk;
      Settty;
      Show_scores;
      Restty
    End
End.
