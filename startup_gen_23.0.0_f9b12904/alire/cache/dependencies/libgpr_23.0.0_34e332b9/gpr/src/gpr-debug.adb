------------------------------------------------------------------------------
--                                                                          --
--                           GPR PROJECT MANAGER                            --
--                                                                          --
--          Copyright (C) 1992-2020, Free Software Foundation, Inc.         --
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

with Ada.Text_IO;

package body GPR.Debug is

   ---------------------------------------------
   -- Documentation for gprbuild Debug Flags  --
   ---------------------------------------------

   --  dm  Display the maximum number of simultaneous compilations.

   --  dn  Do not delete temporary files created by gprbuild at the end
   --      of execution, such as temporary config pragma files, mapping
   --      files or project path files. This debug switch is equivalent to
   --      the standard switch --keep-temp-files. We retain the debug switch
   --      for back compatibility with past usage.

   --  dt  When a time stamp mismatch has been found for an ALI file,
   --      display the source file name, the time stamp expected and
   --      the time stamp found.

   --  da  Print information about names being registered and accessed in
   --      the package GPR.Names.

   --  ds  In verbose mode, print details about the checks on .cswi files.

   --  du  Disable checks on unit names, thus allowing non-ascii characters.

   --------------------
   -- Set_Debug_Flag --
   --------------------

   procedure Set_Debug_Flag (C : Character; Val : Boolean := True) is
   begin
      if C in Debug_Flags'Range then
         Debug_Flags (C) := Val;
      else
         Ada.Text_IO.Put_Line ("illegal debug switch '" & C & ''');
      end if;
   end Set_Debug_Flag;

end GPR.Debug;
