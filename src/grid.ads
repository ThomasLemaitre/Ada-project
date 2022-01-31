with HAL.Bitmap;            use HAL.Bitmap;
with STM32.Board;           use STM32.Board;
with object;

package grid is

   type Matrix is array ( 0..8, 0..12) of object.Block_Class;
   procedure Create_Grid;
   procedure Init_Game;
   procedure Print_Game;
   procedure Action_Game;
   procedure Boom;
   function Is_Empty (Pos : Point) return Boolean with pre=> pos.x < 9 and pos.y < 13;
   function Is_Player return Boolean;
   function Is_Win return Boolean;
   function Is_Finished return Boolean;
   procedure Move_Player (Src : Point; Dst : Point) with pre=> Dst.x < 9 and Dst.y < 13 and src.x <9 and src.y < 13;
end grid;
