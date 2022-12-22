module _7_mytestbenchmodule2();
reg CLK;
initial CLK  <= 0;
always #50  CLK <= ~CLK;
		
reg RST;
int char_r;

int fp;

initial 
begin
	RST <= 0;
	RST <= #100 1;
	RST <= #500 0;
end	  	

reg        push_stb;
reg [31:0] push_dat;	

wire [31:0] pop_dat;
reg         pop_stb;

initial 
begin
	
	
	fp = $fopen("input.txt","w");
	$fwrite(fp,"1+5*5);
	
	
	#1000;
	
	
 
	
	$fclose(fp);  
end	  
   
pln_fsm p1 
(
.CLK(CLK),      
.RST(RST),      
.DATA_IN(DATA_IN),  
.DATA_OUT(DATA_OUT)  
);              
 
endmodule
