with HAL.Bitmap; use HAL.Bitmap;
package movement is

   procedure Create_key;
   procedure Ball_Direction;
   
   task Ball_move is
   end Ball_move ;
   
   function Get_Ball_pos return Point;
   

end movement;
