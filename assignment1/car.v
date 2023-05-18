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
