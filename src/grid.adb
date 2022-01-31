with movement;
package body grid is

   Max_h : constant Natural := 320;
   Max_w : constant Natural := 240;
   Offset : constant Natural := 30;
   Box_Size : constant Natural := 20;
   Actual_grid : Matrix; 
   Entity_number : Natural := 1;
   My_Player : object.Block_Class;
   My_Bomb : object.Block_Class;
   Is_Bombe : Boolean := False;
   Player_Pos : Point := (0,0); 
   Bombe_Pos : Point := (0,0);
   Count : Natural := 0;
   Win : Boolean := False;
   
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
         for j in 0..12 loop
            Actual_grid(i,j) := new object.Wall;
            Actual_grid(i,j).Initialize( 1, 0);
         end loop;   
         for j in 3..12 loop
            Entity_number := Entity_number + 1;
            Actual_grid(i,j).Initialize( 1, 2);
         end loop;         
      end loop;
      
      Actual_grid(0,0) := New object.Player;
      My_Player := Actual_grid(0,0);
      My_Player.Initialize( 1, 1);
       
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
   
   procedure Action_game is
      New_Pos : Point;
      Old_pos : Point;
   begin
      New_Pos := movement.getBallIndex;
      Old_pos := Player_Pos;
      if New_Pos /= Player_Pos then
         My_Player.Action(New_Pos);
         if Is_Bombe then
            My_Bomb.Action(Bombe_Pos);
         end if;
         if Count = 5 then
            Count := 0;
            Actual_grid(Old_Pos.X, Old_Pos.Y) := New object.Bombe;
            My_Bomb := Actual_grid(Old_Pos.X, Old_Pos.Y);
            My_Bomb.Initialize( 4, 3);
            Bombe_Pos := Old_Pos;
            Is_Bombe := True;
         else
            Count := Count + 1;
         end if;
      end if;
      
   end;
   
   function Is_empty (Pos : Point) return Boolean is
   begin
      if Actual_grid(Pos.X, Pos.Y).Entity /= 0 then 
         return False;
      end if;
      return True;
   end;
   function Is_Player return Boolean is
   begin
      return (if My_Player.Entity = 0 then False else True);
   end;
   
   function Is_Win return Boolean is
   begin
      return Win;
   end;
   
   procedure Boom is
      minX : Natural;
      maxX : Natural;
      minY : Natural;
      maxY : Natural;
      
      boundX : constant Natural := 9;
      boundY : constant Natural := 13;
      effect : constant Natural := 3;
   begin
      if Bombe_Pos.X < effect then 
         minX := 0;
      else
         minX := Bombe_Pos.X - effect;
      end if;
      
      if Bombe_Pos.Y < effect then 
         minY := 0;
      else
         minY := Bombe_Pos.Y - effect;
      end if;
      
      if Bombe_Pos.X + effect >= boundX then 
         maxX := boundX - 1;
      else
         maxX := Bombe_Pos.X + effect;
      end if;
      
      if Bombe_Pos.Y  + effect >= boundY then 
         maxY := boundY - 1;
      else
         maxY := Bombe_Pos.Y + effect;
      end if;
      
      for i in minX .. maxX loop
         Actual_grid(i, Bombe_Pos.Y).Lose;
      end loop;
      for j in minY .. maxY loop
         Actual_grid(Bombe_Pos.X, j).Lose;
      end loop;
      Win := Is_finished;
   end;
   
   function Is_finished return Boolean is
   begin
      for i in Actual_grid'Range(1) loop
         for j in Actual_grid'Range(2) loop
            if Actual_grid(i,j).Entity = 2 then
               return False;
            end if;
         end loop;
      end loop;
      Return True;
   end;
     
   
   procedure Move_Player (Src : Point; Dst : Point) is
      Tmp : object.Block_Class;
   begin
      Tmp := Actual_grid(Dst.X, Dst.Y);
      Actual_grid(Dst.X, Dst.Y) := Actual_grid(Src.X, Src.Y);
      Actual_grid(Src.X, Src.Y) := Tmp;
      --Actual_grid(Src.X,Src.Y).Entity := 0;
      Player_Pos := Dst;
      My_Player := Actual_grid(Dst.X, Dst.Y);
   end;
     
   
end grid;
