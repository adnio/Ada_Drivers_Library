--  Automatically generated from CMSIS-SVD description file by SVD2Ada
--  see https://github.com/AdaCore/svd2ada

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype MEMRM_MEM_MODE_Field is STM32_SVD.UInt2;

   --  memory remap register
   type MEMRM_Register is record
      --  MEM_MODE
      MEM_MODE      : MEMRM_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MEMRM_Register use record
      MEM_MODE      at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype PMC_MII_RMII_SEL_Field is STM32_SVD.Bit;

   --  peripheral mode configuration register
   type PMC_Register is record
      --  unspecified
      Reserved_0_22  : STM32_SVD.UInt23 := 16#0#;
      --  Ethernet PHY interface selection
      MII_RMII_SEL   : PMC_MII_RMII_SEL_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PMC_Register use record
      Reserved_0_22  at 0 range 0 .. 22;
      MII_RMII_SEL   at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype EXTICR1_EXTI0_Field is STM32_SVD.UInt4;

   type EXTI_Field_Array is array (0 .. 3) of EXTICR1_EXTI0_Field
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTI
   type EXTI_Union (As_Array : Boolean := False) is record
      case As_Array is
         when False =>
            --  Value vision of EXTI0
            Val : STM32_SVD.Short;
         when True =>
            --  Array vision of EXTI0
            Arr : EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTI_Union use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 1
   type EXTICR_Register is record
      --  EXTI x configuration (x = 0 to 3)
      EXTI           : EXTI_Union := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CMPCR_CMP_PD_Field is STM32_SVD.Bit;

   subtype CMPCR_READY_Field is STM32_SVD.Bit;

   --  Compensation cell control register
   type CMPCR_Register is record
      --  Compensation cell power-down
      CMP_PD        : CMPCR_CMP_PD_Field := 16#0#;
      --  unspecified
      Reserved_1_7  : STM32_SVD.UInt7 := 16#0#;
      --  READY
      READY         : CMPCR_READY_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMPCR_Register use record
      CMP_PD        at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      READY         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System configuration controller
   type SYSCFG_Peripheral is record
      --  memory remap register
      MEMRM   : MEMRM_Register;
      --  peripheral mode configuration register
      PMC     : PMC_Register;
      --  external interrupt configuration register 1
      EXTICR1 : EXTICR_Register;
      --  external interrupt configuration register 2
      EXTICR2 : EXTICR_Register;
      --  external interrupt configuration register 3
      EXTICR3 : EXTICR_Register;
      --  external interrupt configuration register 4
      EXTICR4 : EXTICR_Register;
      --  Compensation cell control register
      CMPCR   : CMPCR_Register;
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      MEMRM   at 0 range 0 .. 31;
      PMC     at 4 range 0 .. 31;
      EXTICR1 at 8 range 0 .. 31;
      EXTICR2 at 12 range 0 .. 31;
      EXTICR3 at 16 range 0 .. 31;
      EXTICR4 at 20 range 0 .. 31;
      CMPCR   at 32 range 0 .. 31;
   end record;

   --  System configuration controller
   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => System'To_Address(16#40013800#);

end STM32_SVD.SYSCFG;
