module car_tb;

reg clk;
reg [1:0]cars;
reg [2:0]password;
wire back_sens,front_sens;

car park (cars,clk,password,back_sens,front_sens);

initial begin
  clk=0;
 repeat(50)
 begin 
  #5 clk = 1;  #5 clk = 0;
 end
end

initial begin 
  #5 cars=2'b00;
  #10 password = 3'b000;
  
  #10 cars=2'b10;
  #10 password = 3'b010;
  #10 cars=2'b01;
  #10 password = 3'b000;

 
end

endmodule

module car(cars,clk,password,back_sens,front_sens);
input clk;
input [1:0]cars;
input [2:0]password;
output reg back_sens,front_sens;
reg [1:0]next_state;
parameter car1=2'b00, car2=2'b01,car3=2'b10,car4=2'b11;

always @(posedge clk)
begin
  case(cars[1:0])
 car1:if(password==3'b000)
       begin 
       back_sens = 1;
       front_sens=0;
       end
       else begin
       next_state = car1;
       back_sens=0;
       front_sens=1;
        end

 car2: if(password==3'b001)
       begin 
        back_sens = 1;
       front_sens=0;
       end
       else begin
       next_state = car2;
        back_sens=0;
       front_sens=1;
        end

 car3: if(password==3'b010)
       begin 
        back_sens = 1;
       front_sens=0;
       end
       else begin
       next_state = car3;
        back_sens=0;
       front_sens=1;
        end

 car4: if(password==3'b011)
       begin
        back_sens = 1;
       front_sens=0;
       end
       else begin
       next_state = car4;
        back_sens=0;
       front_sens=1;
        end

 default:begin next_state = car1;
          back_sens = 0; end

  endcase
end

endmodule
