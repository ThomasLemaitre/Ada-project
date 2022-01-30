
package body grid is

   Max_h : constant Natural := 320;
   Max_w : constant Natural := 240;
   Offset : constant Natural := 30;
   Box_Size : constant Natural := 20;
   Actual_grid : Matrix; 
   Entity_number : Natural := 0;
   procedure Create_Grid is
      begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Grey);
      for Variable in 0 .. 9 loop
         Display.Hidden_Buffer (1).Draw_Line((Offset + Box_Size * Variable, Offset), ( Offset + Box_Size * Variable, Max_h - Offset));
      end loop;
      for Variable in 0 .. 13 loop
         Display.Hidden_Buffer (1).Draw_Line((Offset , Offset + Box_Size * Variable), ( Max_w - Offset , Offset + Box_Size * Variable));
      end loop;
   end;
   
   procedure Init_Game is
   begin
      for i in Actual_grid'Range(1) loop
         for j in 2..13 loop
            object.Initialize(Actual_grid(i,j), 1, Entity_number);
            Entity_number := Entity_number + 1;
         end loop;         
      end loop;
   end;
   

end grid;
