// Lance Pettay
// Exercise 1.31
// Introduction to Classical and Quantum Computing
// By Thomas G. Wong

// Let's make an 8 bit adder shall we?

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

module eightbitadd(S, Cout, A, B);
    input [7:0] A, B;
    wire [6:0] C;
    output [7:0]S; 
    output Cout;

    // I know.. I should learn to use the generate function in verilog but I doubt I'll be using this much!
    halfadd ha1(S[0], C[0], A[0], B[0]);
    fulladd fa2(S[1], C[1], A[1], B[1], C[0]);
    fulladd fa3(S[2], C[2], A[2], B[2], C[1]);
    fulladd fa4(S[3], C[3], A[3], B[3], C[2]);
    fulladd fa5(S[4], C[4], A[4], B[4], C[3]);
    fulladd fa6(S[5], C[5], A[5], B[5], C[4]);
    fulladd fa7(S[6], C[6], A[6], B[6], C[5]);
    fulladd fa8(S[7], Cout, A[7], B[7], C[6]);

endmodule

module main;
    reg [7:0] A, B;
    reg [6:0] Cin;
    wire [7:0] S; 
    wire Cout;
    eightbitadd add8(S, Cout, A, B);

  initial 
    begin
        A = 8'b11011001;
        B = 8'b01101101;
        #5; // Wait 5
        $display("A: %b, B: %b", A, B);
        $display("S: %b, Cout: %b", S, Cout);
        
    end
endmodule