with STM32.Board;           use STM32.Board;
with HAL.Bitmap;            use HAL.Bitmap;

package object is

   type Block is tagged record
      Life : Natural := 0;
      Entity : Natural := 0;
   end record;
   procedure Print (Self : Block; Pos : Point)
     with Pre => Pos.X < 210 and Pos.Y < 290;
   procedure Lose (Self : in out Block)
   with Post => Self.life = 0 or Self.life = Self.life'old - 1;

   procedure Destroy (Self : in out Block)
     with Pre => Self.Life = 0 and Self.Entity > 0,
     Post => Self.Entity = 0;
   procedure Action (Self : in out Block; Pos : Point);
   procedure Initialize (Self : in out Block; Life : Natural; Entity : Natural)
     with Pre => Self.Life = 0 and Self.Entity = 0,
   Post => Self.life = life and Self.Entity = Entity;

   type Block_Class is access Block'Class;
   type Bombe is new Block with  record
      Offset : Natural := 10;
   end record;
   overriding
   procedure Print (Self : Bombe; Pos : Point)
   with Pre =>Self.Entity = 3 and Pos.X < 210 and Pos.Y < 290;
   procedure Action (Self : in out Bombe; Pos : Point)
     with Pre => Self.Life > 0 and self.Entity = 3,
     Post => Self.life = 0 or Self.life = Self.life'old - 1;
   procedure Destroy (Self : in out Bombe)
     with Pre => Self.Life = 0 and Self.Entity = 3,
   Post => Self.Entity = 0;
   procedure Lose (Self : in out Bombe)
     with Pre => Self.Entity = 3,
   Post => Self.life = 0 or Self.life = Self.life'old - 1;

   type Player is new Block with  record
      Offset : Natural := 10;
      Pos : Point := (0,0);
      end record;
   overriding
   procedure Print (Self : Player; Pos : Point)
   with Pre => Self.Entity = 1 and Pos.X < 210 and Pos.Y < 290;
   procedure Action (Self : in out Player ; Pos : Point)
     with Pre => Self.Life > 0 and self.Entity = 1,
     Post => self.pos /= self.pos'old or self.entity = 0;
end object;
