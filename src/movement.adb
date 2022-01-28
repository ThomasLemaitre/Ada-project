with STM32.Board;           use STM32.Board;
with HAL.Touch_Panel;       use HAL.Touch_Panel;
with Ada.Real_Time;         use Ada.Real_Time;

package body movement is
   
   type Ball_Orientation_Mode is
     (Up,
      Down,
      Left,
      Right);
   
   Max_h : constant Natural := 320;
   Max_w : constant Natural := 240;
   Offset : constant Natural := 30;
   Ball_Pos : Point := (40, 40);
   Ball_Orientation : Ball_Orientation_Mode := Up;

   procedure Create_key is
      
      begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Red);
      Display.Hidden_Buffer (1).Draw_Line((Offset,Offset), (Offset,Max_h - Offset));
      Display.Hidden_Buffer (1).Draw_Line((Max_w - Offset,Offset), (Max_w - Offset,Max_h - Offset));
      Display.Hidden_Buffer (1).Draw_Line((0,Offset), (Max_w,Offset));
      Display.Hidden_Buffer (1).Draw_Line((0,Max_h - Offset), (Max_w,Max_h - Offset));
   end;
   
   task body Ball_move is
      use type Ada.Real_Time.Time;
      use type Ada.Real_Time.Time_Span;
      Period    : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds (500);
      Poll_Time :          Ada.Real_Time.Time := Ada.Real_Time.Clock + 4 * Period; -- time to start polling
      
   begin
      loop
         delay until Poll_Time;
           case Ball_Orientation is
               when Up => Ball_Pos.Y := Ball_Pos.Y + 20;
               when Down => Ball_Pos.Y := Ball_Pos.Y - 20;
               when Left => Ball_Pos.X := Ball_Pos.X + 20;
               when Right => Ball_Pos.X := Ball_Pos.X - 20;
           end case;
           Poll_Time := Poll_Time + Period;
      end loop;
   end Ball_move;
   
   function Get_Ball_pos return Point is
      (Ball_Pos);
   
   procedure Ball_Direction is
         State : constant TP_State := Touch_Panel.Get_All_Touch_Points;
      begin
         case State'Length is
            when 1 =>
               if State (State'First).Y > 290 then
                  Ball_Orientation := Up;
               elsif State (State'First).Y < 30 then
                  Ball_Orientation := Down;
               elsif State (State'First).X > 210 then
                  Ball_Orientation := Left;
               elsif State (State'First).X < 30 then
                  Ball_Orientation := Right;
               end if;
            when others => null;
         end case;
   end;

end movement;
