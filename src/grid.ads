with HAL.Bitmap;            use HAL.Bitmap;
with STM32.Board;           use STM32.Board;
with object;

package grid is

   type Matrix is array ( 0..8, 0..12) of object.Block_Class;
   procedure Create_Grid;
   procedure Init_Game;
   procedure Print_game;
   procedure Action_game;
   procedure Boom;
   function Is_empty (Pos : Point) return Boolean;
   function Is_Player return Boolean;
   procedure Move_Player (Src : Point; Dst : Point);
end grid;
