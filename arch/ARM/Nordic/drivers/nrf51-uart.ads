with HAL;  use HAL;
with HAL.UART;  use HAL.UART;
with nRF51.GPIO;  use nRF51.GPIO;
with NRF51_SVD.UART;
package nRF51.UART is
   
   type UART_Speed is (UART_1200_Baud,
                       UART_2400_Baud,
                       UART_4800_Baud,
                       UART_9600_Baud,
                       UART_14400_Baud,
                       UART_19200_Baud,
                       UART_28800_Baud,
                       UART_38400_Baud,
                       UART_57600_Baud,
                       UART_76800_Baud,
                       UART_115200_Baud,
                       UART_230400_Baud,
                       UART_250000_Baud,
                       UART_460800_Baud,
                       UART_921600_Baud,
                       UART_1M_Baud);
   
   type UART (Periph : not null access NRF51_SVD.UART.UART_Peripheral) is
     new UART_Port with private;
   
   procedure Enable (This : in out UART);

   procedure Disable (This : in out UART);

   function Enabled (This : UART) return Boolean;

   procedure Configure (This   : in out UART;
                        RX_Pin : GPIO_Pin_Index;
                        TX_Pin : GPIO_Pin_Index;
                        Speed  : UART_Speed);

   procedure Disconnect (This : in out UART);
   --  Disconect the peripheral from the GPIO points
   
   overriding
   function Data_Size (Port : UART) return UART_Data_Size;

   overriding
   procedure Transmit
     (This    : in out UART;
      Data    : UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
     with
       Pre => Data_Size (This) = Data_Size_8b;

   overriding
   procedure Receive
     (This    : in out UART;
      Data    : out UART_Data_8b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
     with
       Pre => Data_Size (This) = Data_Size_8b;

   -- Not available in nrf51
   overriding
   procedure Transmit
     (This    : in out UART;
      Data    : UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
     with
       Pre => Data_Size (This) = Data_Size_9b;
   
   -- Not available in nrf51
   overriding
   procedure Receive
     (This    : in out UART;
      Data    : out UART_Data_9b;
      Status  : out UART_Status;
      Timeout : Natural := 1000)
     with
       Pre => Data_Size (This) = Data_Size_9b;
   
private

   type UART (Periph : not null access NRF51_SVD.UART.UART_Peripheral) is
     new UART_Port with null record;
   
end nRF51.UART;
