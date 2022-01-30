package body movement is
   
   type Ball_Orientation_Mode is
     (Up,
      Down,
      Left,
      Right);
   
   Max_h : constant Natural := 320;
   Max_w : constant Natural := 240;
   Offset : constant Natural := 30;
   Box_Size : constant Natural := 20;
   Ball_Pos : Point := (40, 40);
   Ball_Orientation : Ball_Orientation_Mode := Up;

   procedure Create_keys is
      
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
            when Up => Ball_Pos.Y := Ball_Pos.Y + Box_Size;
               if Ball_Pos.Y > Max_h - Offset then
                  Ball_Pos.Y := Ball_Pos.Y - Box_Size * 2;
                  Ball_Orientation := Down;
               end if;
            when Down => Ball_Pos.Y := Ball_Pos.Y - Box_Size;
               if Ball_Pos.Y < Offset then
                  Ball_Pos.Y := Ball_Pos.Y + Box_Size * 2;
                  Ball_Orientation := Up;
               end if;
            when Left => Ball_Pos.X := Ball_Pos.X + Box_Size;
               if Ball_Pos.X > Max_w - Offset then
                  Ball_Pos.X := Ball_Pos.X - Box_Size * 2;
                  Ball_Orientation := Right;
               end if;
            when Right => Ball_Pos.X := Ball_Pos.X - Box_Size;
               if Ball_Pos.X < Offset then
                  Ball_Pos.X := Ball_Pos.X + Box_Size * 2;
                  Ball_Orientation := Left;
               end if;
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
               if State (State'First).Y > Max_h - Offset then
                  Ball_Orientation := Up;
               elsif State (State'First).Y < Offset then
                  Ball_Orientation := Down;
               elsif State (State'First).X > Max_w - Offset then
                  Ball_Orientation := Left;
               elsif State (State'First).X < Offset then
                  Ball_Orientation := Right;
               end if;
            when others => null;
         end case;
   end;

end movement;
