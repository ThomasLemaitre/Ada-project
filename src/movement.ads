with HAL.Bitmap;      use HAL.Bitmap;
with STM32.Board;     use STM32.Board;
with HAL.Touch_Panel; use HAL.Touch_Panel;
with Ada.Real_Time;   use Ada.Real_Time;

package movement is

   procedure Create_Keys;
   procedure Ball_Direction;
   procedure Collision;

   task Ball_Move is
   end Ball_Move;

   function Get_Ball_Index return Point with
      Post => Get_Ball_index'Result.X < 210 and Get_Ball_index'Result.Y < 290;

end movement;
