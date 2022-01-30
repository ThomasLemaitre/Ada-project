with HAL.Bitmap;            use HAL.Bitmap;
with STM32.Board;           use STM32.Board;
with object;

package grid is

   type Matrix is array ( 0..8, 0..12) of object.Block_Class;
   procedure Create_Grid;
   procedure Init_Game;
   procedure Print_game;

end grid;
