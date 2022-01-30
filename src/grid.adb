
package body grid is

   Max_h : constant Natural := 320;
   Max_w : constant Natural := 240;
   Offset : constant Natural := 30;
   Box_Size : constant Natural := 20;
   Actual_grid : Matrix; 
   Entity_number : Natural := 1;
   My_Player : object.Block_Class;
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
      
      --Actual_grid(0,0) := My_Player;
      for i in Actual_grid'Range(1) loop
         for j in 0..12 loop
            Actual_grid(i,j) := new object.Wall;
            Actual_grid(i,j).Initialize( 1, 0);
         end loop;   
         for j in 2..12 loop
            Entity_number := Entity_number + 1;
            Actual_grid(i,j).Initialize( 1, Entity_number);
         end loop;         
      end loop;
      
      Actual_grid(0,0) := New object.Player;
      My_Player := Actual_grid(0,0);
      My_Player.Initialize( 1, Entity_number);
       
   end;
   
   procedure Print_game is
   begin
      for i in Actual_grid'Range(1) loop
         for j in Actual_grid'Range(2) loop
            if Actual_grid(i,j).Entity /= 0 then
               Actual_grid(i, j).Print((Offset + i * Box_Size, Offset + j * Box_Size));
            end if;
         end loop;
      end loop;
      
   end;
   
   
   

end grid;
