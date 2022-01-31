with grid;
with movement;
package body object is
   
   procedure Print (Self : Wall; Pos : Point) is 
   begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Green);
      Display.Hidden_Buffer (1).Fill_Rect ((Pos,20,20));
   end;
   
   procedure Lose (Self : in out Wall) is 
   begin
      if Self.Life > 0 then
         Self.Life := Self.Life - 1;
         if Self.Life = 0 then
            Self.Destroy;
         end if;
      end if;
   end;
   procedure Destroy (Self : in out Wall) is 
   begin
      Self.Entity := 0;
   end;
   procedure Action (Self : in out Wall; Pos : Point) is 
   begin
      null;
   end;
   procedure Initialize (Self : in out Wall; Life : Natural; Entity : Natural) is
   begin 
      Self.Life := Life;
      Self.Entity := Entity;
   end;
   
   overriding
   procedure Print (Self : Bombe; Pos : Point) is 
   begin
         Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Red);
         Display.Hidden_Buffer (1).Fill_Circle ((Pos.X + Self.Offset, Pos.Y + Self.Offset) , 10);
   end;
   
   overriding
   procedure Action (Self : in out Bombe; Pos : Point) is
   begin
   Lose(Self);
   end;
   procedure Lose (Self : in out Bombe) is 
   begin
      if Self.Life > 0 then
         Self.Life := Self.Life - 1;
         if Self.Life = 0 then
            Self.Destroy;
         end if;
      end if;
   end;
   procedure Destroy (Self : in out Bombe) is 
   begin
      Self.Entity := 0;
      grid.Boom;
   end;
   
   overriding
   procedure Print (Self : Player; Pos : Point) is 
   begin
         Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Blue);
         Display.Hidden_Buffer (1).Fill_Circle ((Pos.X + Self.Offset, Pos.Y + Self.Offset) , 10);
   end;
   
   overriding procedure Action (Self : in out Player ; Pos : Point) is
      tmp : Point;
   begin
      if Pos.X < 9 and then Pos.Y < 13 and then grid.Is_empty(Pos) then
         grid.Move_Player(Self.Pos, Pos);
         Self.Pos := Pos;
      else 
         movement.Collision;
         tmp := movement.getBallIndex;
         if grid.Is_empty(tmp) then
            grid.Move_Player(self.Pos, tmp);
            Self.Pos := tmp;
         else
            Self.Entity := 0;
         end if;
      end if;
      
   end;

   
   
end object;
