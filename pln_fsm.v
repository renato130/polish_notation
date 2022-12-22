`define	mul 42 
`define div 47
`define equ 61

					   

module pln_fsm (
	
	input  wire                    CLK,       	  
	input  wire        			   RST, 
	input  wire [8-1 :0] 	   DATA_IN,
	
	output [8-1:0]			  DATA_OUT 
	
	);
	
	
	localparam [2:0]
	READ_T  = 3'b000,
	READ_S  = 3'b001,
	PUSH_T  = 3'b010,
	POP_S   = 3'b011,
	PUSH_T2 = 3'b100;
	
	
	reg[2:0] state_reg, state_next;
	
	
//}} End of automatically maintained section
reg        push_stb;
reg [31:0] push_dat;	

wire [31:0] pop_dat;
reg         pop_stb;	 


always @(posedge clk, posedge reset)
begin
    if(reset) // go to state zero if rese
        begin
        state_reg <= READ_T;
        end
    else // otherwise update the states
        begin
        state_reg <= state_next;

        end
end

always @(state_reg, DATA_IN)
begin
   
    state_next = state_reg; // 
    
    
    case(state_reg)
        READ_T:
			begin // 
            	if( isOp(DATA_IN) )
					begin// 
                		state_next = READ_S ; 
						pop_stb =  '1';
					end	// .	
				else if(DATA_IN != `equ )
					state_next = PUSH_T
					
			end		
        READ_S:
            begin
                 // .
                if(PREC(pop_dat) >= PREC(DATA_IN)) //  , 
                    state_next = POP_S ; // go to state one,
                else
                    state_next = PUSH_T ; // else go to state zero.
            end
        PUSH_T:
			begin
              DATA_OUT = DATA_IN;
			  
              state_next = READ_T ;
			 end// then go to state zero.  
		POP_S:
			begin
			  DATA_OUT = pop_dat ;
			  state_next = READ_S ;
			 end 
    endcase
end


	   
stack s1 
(
.CLK(CLK),      
.RST(RST),      
.PUSH_STB(push_stb), 
.PUSH_DAT(push_dat), 
.POP_STB(pop_stb),  
.POP_DAT(pop_dat)  
);              
 

// -- Enter your statements here -- //	 


function int PREC(input [8-1:0] a)
	begin	
		if( `mul == 42 || `add == 47)
			return 1;
		else
			return 0;
	
	end
endfunction	   

function int isOp(input [8-1:0] a)
	begin	
		if( `mul == a || `add == a || `div == a || `sub == a)
			return 1;
		else
			return 0;
	
	end
endfunction
endmodule
