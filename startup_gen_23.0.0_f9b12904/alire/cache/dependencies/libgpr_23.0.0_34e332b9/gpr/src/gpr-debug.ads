------------------------------------------------------------------------------
--                                                                          --
--                           GPR PROJECT MANAGER                            --
--                                                                          --
--          Copyright (C) 2015-2020, Free Software Foundation, Inc.         --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------

--  This package contains global flags used to control the inclusion
--  of debugging code in various phases of the compiler. Some of these
--  flags are also used by the binder and gnatmake.

package GPR.Debug is

   -------------------------
   -- Dynamic Debug Flags --
   -------------------------

   --  Flags that can be used to active various specialized debugging output
   --  information. The flags are preset to False, which corresponds to the
   --  given output being suppressed. The individual flags can be turned on
   --  using the undocumented switch dxxx where xxx is a string of letters for
   --  flags to be turned on. Documentation on the current usage of these flags
   --  is contained in the body of Debug rather than the spec, so that we don't
   --  have to recompile the world when a new debug flag is added.

   Debug_Flags : array (Character range 'a' .. 'z') of Boolean :=
                   (others => False);

   Debug_Flag_A : Boolean renames Debug_Flags ('a');
   Debug_Flag_B : Boolean renames Debug_Flags ('b');
   Debug_Flag_C : Boolean renames Debug_Flags ('c');
   Debug_Flag_D : Boolean renames Debug_Flags ('d');
   Debug_Flag_E : Boolean renames Debug_Flags ('e');
   Debug_Flag_F : Boolean renames Debug_Flags ('f');
   Debug_Flag_G : Boolean renames Debug_Flags ('g');
   Debug_Flag_H : Boolean renames Debug_Flags ('h');
   Debug_Flag_I : Boolean renames Debug_Flags ('i');
   Debug_Flag_J : Boolean renames Debug_Flags ('j');
   Debug_Flag_K : Boolean renames Debug_Flags ('k');
   Debug_Flag_L : Boolean renames Debug_Flags ('l');
   Debug_Flag_M : Boolean renames Debug_Flags ('m');
   Debug_Flag_N : Boolean renames Debug_Flags ('n');
   Debug_Flag_O : Boolean renames Debug_Flags ('o');
   Debug_Flag_P : Boolean renames Debug_Flags ('p');
   Debug_Flag_Q : Boolean renames Debug_Flags ('q');
   Debug_Flag_R : Boolean renames Debug_Flags ('r');
   Debug_Flag_S : Boolean renames Debug_Flags ('s');
   Debug_Flag_T : Boolean renames Debug_Flags ('t');
   Debug_Flag_U : Boolean renames Debug_Flags ('u');
   Debug_Flag_V : Boolean renames Debug_Flags ('v');
   Debug_Flag_W : Boolean renames Debug_Flags ('w');
   Debug_Flag_X : Boolean renames Debug_Flags ('x');
   Debug_Flag_Y : Boolean renames Debug_Flags ('y');
   Debug_Flag_Z : Boolean renames Debug_Flags ('z');

   procedure Set_Debug_Flag (C : Character; Val : Boolean := True);
   --  Where C is a-z, sets the corresponding debug flag to
   --  the given value.

end GPR.Debug;
