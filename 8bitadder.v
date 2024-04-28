/* 
 * Do not change Module name 
*/

// Let's make a 4 bit adder shall we?

module halfadd(S, C, A, B);
    input A, B;
    output S, C;
    
    xor xor1(S,A,B);
    and and1(C,A,B);

endmodule

module fulladd(S, Cout, A, B, Cin);
    input Cin, A, B;
    wire S0, S1, C0;
    output Cout, S;
    
    halfadd ha1(S0, C0, A, B);
    halfadd ha2(S, C1, Cin, S0);
    or or1(Cout, C1, C0);
endmodule

//module 4bitadd();
//endmodule

module main;
    reg A,B,Cin;
    wire S,Cout;
    fulladd fa1(S,Cout,A,B,Cin);

  initial 
    begin
        A = 1;
        B = 1;
        Cin = 1;
        #5; // Wait 5
        $display("A: %b, B: %b, Cin: %b", A, B, Cin);
        $display("S: %b, Cout: %b", S, Cout);
        
    end
endmodule