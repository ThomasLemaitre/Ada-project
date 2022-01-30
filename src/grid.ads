with HAL.Bitmap;            use HAL.Bitmap;
with STM32.Board;           use STM32.Board;
with object;

package grid is

   type Matrix is array ( 0..9, 0..13) of object.Wall;
   procedure Create_Grid;

end grid;
