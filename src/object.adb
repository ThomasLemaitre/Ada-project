package body object is
   
   procedure Print (Self : Wall; Pos : Point) is 
   begin
      Display.Hidden_Buffer (1).Set_Source (HAL.Bitmap.Green);
      Display.Hidden_Buffer (1).Fill_Rect ((Pos,20,20));
   end;
   
   procedure Lose (Self : in out Wall) is 
   begin
      Self.Life := Self.Life - 1;
      if Self.Life = 0 then
         Self.Destroy;
      end if;
   end;
   procedure Destroy (Self : Wall) is 
   begin
      null;
   end;
   procedure Action (Self : in out Wall) is 
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
         Display.Hidden_Buffer (1).Fill_Circle (Pos, 10);
   end;
   procedure Action (Self : in out Bombe) is
   begin
   Lose(Self);
   end;
end object;
