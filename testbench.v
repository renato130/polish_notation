module _7_mytestbenchmodule2();
reg CLK;
initial CLK  <= 0;
always #50  CLK <= ~CLK;
		
reg RST;
reg [8-1 :0] DATA_IN;
wire	[8-1 :0] DATA_OUT;

int fp,fout;



reg        push_stb;
reg [31:0] push_dat;	

wire [31:0] pop_dat;
reg         pop_stb;

initial 
begin 
 	RST <= 0;
	#100 ; 
	RST <=  1;	 
		#100 ;
	RST <=  0;
	#10
	
	
	fp = $fopen("input.txt","r");  
	fout = $fopen("out_pln.txt","w");

		while(!$feof(fp))
		begin
			DATA_IN = $fgetc(fp);
			@ ( posedge(CLK));	
			
		end	
	
	
	#100;
	
	
	
end	 


initial
forever
begin
	@( posedge(CLK) && DATA_OUT )
	
	$fwrite(fout,DATA_OUT);
	

end		



   
pln_fsm p1 
(
.CLK(CLK),      
.RST(RST),      
.DATA_IN(DATA_IN),  
.DATA_OUT(DATA_OUT)  
);              
 
endmodule

