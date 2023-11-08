------------------------------------------------------------------------------
--                                                                          --
--                           GPR PROJECT MANAGER                            --
--                                                                          --
--             Copyright (C) 2022, Free Software Foundation, Inc.           --
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

with Ada.Exceptions;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

with System.OS_Constants;

with GPR.Util;              use GPR.Util;

package body GPR.Sdefault is

   Default_Target_Parsed : Boolean := False;
   Default_Target_Val    : Unbounded_String;

   ------------------------
   -- Set_Default_Target --
   ------------------------

   procedure Set_Default_Target;
   --  Tries to parse <gprtools directory>/share/gprconfig/default_target
   --  and sets Default_Target_Val.

   procedure Set_Default_Target is
      Tgt_File_Base : constant String := "default_target";
      Tgt_File_Full : constant String :=
        Executable_Prefix_Path
        & "share" & Directory_Separator
        & "gprconfig" & Directory_Separator & Tgt_File_Base;

      F : Ada.Text_IO.File_Type;
   begin
      if Executable_Prefix_Path = "" then
         Debug_Output ("Gprtools installation not found");
         Default_Target_Val :=
           To_Unbounded_String (System.OS_Constants.Target_Name);
      end if;

      if not Is_Regular_File (Tgt_File_Full) then
         Debug_Output (Tgt_File_Full & " not found");
         Default_Target_Val :=
           To_Unbounded_String (System.OS_Constants.Target_Name);
      end if;

      Ada.Text_IO.Open (F, Ada.Text_IO.In_File, Tgt_File_Full);
      Default_Target_Val := To_Unbounded_String (Ada.Text_IO.Get_Line (F));
      Ada.Text_IO.Close (F);

   exception
      when X : others =>
         Debug_Output ("Cannot parse " & Tgt_File_Full);
         Debug_Output (Ada.Exceptions.Exception_Information (X));

         Default_Target_Val :=
           To_Unbounded_String (System.OS_Constants.Target_Name);
   end Set_Default_Target;

   --------------
   -- Hostname --
   --------------

   function Hostname return String is
   begin
      if not Default_Target_Parsed then
         Default_Target_Parsed := True;
         Set_Default_Target;
      end if;

      return To_String (Default_Target_Val);
   end Hostname;

end GPR.Sdefault;
