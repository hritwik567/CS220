module LCD_base_driver(RS_Signal,data_in,counter,LCD_E,LCD_W,LCD_RS,data);
  input RS_Signal;
  input [1:0] counter;
  input [3:0] data_in;
  output wire LCD_RS,LCD_E,LCD_W;
  output wire [3:0] data; 
  reg LCD_RSr,LCD_Er;
  reg [3:0] datar;
  assign LCD_RS=LCD_RSr;
  assign LCD_E=LCD_Er;
  assign LCD_W=1'b0;
  assign data=datar;
  always @(RS_Signal or counter or data_in)
    case(counter)
      2'd0:begin
             LCD_Er=0;
             LCD_RSr=0;
             datar=data_in;
           end
      2'd1:begin
             LCD_Er=0;
             LCD_RSr=RS_Signal;
             datar=data_in;
           end
      2'd2:begin
             LCD_Er=1;
             LCD_RSr=RS_Signal;
             datar=data_in;
           end
      2'd3:begin
             LCD_Er=0;
             LCD_RSr=RS_Signal;
             datar=data_in;
           end
    endcase
endmodule     
