with STM32.Board;           use STM32.Board;
with HAL.Bitmap;            use HAL.Bitmap;

package object is
   type Wall is tagged record
      Life : Natural;
      Entity : Natural;
   end record;
   procedure Print (Self : Wall; Pos : Point);
   procedure Lose (Self : in out Wall);
   procedure Destroy (Self : Wall);
   procedure Action (Self : in out Wall);
   procedure Initialize (Self : in out Wall; Life : Natural; Entity : Natural);

   type Bombe is new Wall with null record;
   overriding
   procedure Print (Self : Bombe; Pos : Point);
   procedure Action (Self : in out Bombe);
end object;