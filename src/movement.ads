with HAL.Bitmap;            use HAL.Bitmap;
with STM32.Board;           use STM32.Board;
with HAL.Touch_Panel;       use HAL.Touch_Panel;
with Ada.Real_Time;         use Ada.Real_Time;

package movement is

   procedure Create_keys;
   procedure Ball_Direction;
   
   task Ball_move is
   end Ball_move ;
   
   function Get_Ball_pos return Point;
   

end movement;
