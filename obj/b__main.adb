pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E023 : Short_Integer; pragma Import (Ada, E023, "ada__real_time_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__tasking__protected_objects_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__tasking__protected_objects__multiprocessors_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "system__tasking__restricted__stages_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "bmp_fonts_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "cortex_m__cache_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "bitmap_color_conversion_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "hal__sdmmc_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "hershey_fonts_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "bitmapped_drawing_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "ili9341_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "ravenscar_time_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "sdmmc_init_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "soft_drawing_bitmap_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "memory_mapped_bitmap_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__adc_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__dac_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "stm32__dma__interrupts_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "stm32__dma2d_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "stm32__dma2d__interrupt_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "stm32__dma2d__polling_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "stm32__dma2d_bitmap_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "stm32__exti_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "stm32__fmc_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__power_control_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "stm32__rtc_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "stm32__spi_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "stm32__spi__dma_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__gpio_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__i2c_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__i2c__dma_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "stm32__i2s_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "stm32__sdmmc_interrupt_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "stm32__sdmmc_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__syscfg_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__usarts_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__device_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "stm32__ltdc_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "stm32__setup_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "stmpe811_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "framebuffer_ltdc_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "framebuffer_ili9341_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "stm32__sdram_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "touch_panel_stmpe811_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "stm32__board_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "last_chance_handler_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "lcd_std_out_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "stm32__user_button_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E023 := E023 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E134 := E134 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E136 := E136 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E084 := E084 + 1;
      E004 := E004 + 1;
      E155 := E155 + 1;
      E196 := E196 + 1;
      E159 := E159 + 1;
      E221 := E221 + 1;
      E219 := E219 + 1;
      E203 := E203 + 1;
      Ravenscar_Time'Elab_Body;
      E207 := E207 + 1;
      E157 := E157 + 1;
      E198 := E198 + 1;
      E194 := E194 + 1;
      STM32.ADC'ELAB_SPEC;
      E100 := E100 + 1;
      E106 := E106 + 1;
      E138 := E138 + 1;
      E179 := E179 + 1;
      STM32.DMA2D.INTERRUPT'ELAB_BODY;
      E182 := E182 + 1;
      E184 := E184 + 1;
      STM32.DMA2D_BITMAP'ELAB_SPEC;
      E192 := E192 + 1;
      E119 := E119 + 1;
      E188 := E188 + 1;
      E147 := E147 + 1;
      E144 := E144 + 1;
      E167 := E167 + 1;
      E169 := E169 + 1;
      E163 := E163 + 1;
      E112 := E112 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E091 := E091 + 1;
      E125 := E125 + 1;
      E130 := E130 + 1;
      E140 := E140 + 1;
      E152 := E152 + 1;
      E117 := E117 + 1;
      E173 := E173 + 1;
      STM32.LTDC'ELAB_BODY;
      E200 := E200 + 1;
      E213 := E213 + 1;
      E215 := E215 + 1;
      Framebuffer_Ili9341'Elab_Spec;
      E177 := E177 + 1;
      Touch_Panel_Stmpe811'Elab_Spec;
      STM32.BOARD'ELAB_SPEC;
      E076 := E076 + 1;
      E089 := E089 + 1;
      E186 := E186 + 1;
      E211 := E211 + 1;
      E021 := E021 + 1;
      Lcd_Std_Out'Elab_Body;
      E217 := E217 + 1;
      STM32.USER_BUTTON'ELAB_BODY;
      E223 := E223 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\bmp_fonts.o
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\hershey_fonts.o
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\bitmapped_drawing.o
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\last_chance_handler.o
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\lcd_std_out.o
   --   C:\Users\tcdle\Documents\ADA\Ada-project\obj\main.o
   --   -LC:\Users\tcdle\Documents\ADA\Ada-project\obj\
   --   -LC:\Users\tcdle\Documents\ADA\Ada-project\obj\
   --   -LC:\Users\tcdle\Documents\ADA\Ada-project\Ada_Drivers_Library\examples\shared\common\
   --   -LC:\Users\tcdle\Documents\ADA\Ada-project\Ada_Drivers_Library\boards\stm32f429_discovery\obj\full_lib_Debug\
   --   -LC:\gnat\2021-arm-elf\arm-eabi\lib\gnat\ravenscar-sfp-stm32f429disco\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
