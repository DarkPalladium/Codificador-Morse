//Roniel Nunes Baborsa			    3464	
//Pablo Miranda Batista			    3482
//Lucas Antonio de Souza Lima		3481
//Cleidimar Lacerda dos Passos	3473


`include "codificador.v"

module simulador ();
    reg A, B, C, D, reset, ready;
    wire X1, X2, X3, X4, X5;

    codificador converte (.A(A), .B(B), .C(C), .D(D), .reset(reset), .ready(ready), .X1(X1), .X2(X2), .X3(X3), .X4(X4), .X5(X5));
    initial begin
      $dumpfile ("codificador.vcd");
      $dumpvars (0, simulador);
      $display ("\nCodificador de Binario para codigo morse\n\nENTRADA   SAIDA");
      $monitor ("%b%b%b%b    = %b%b%b%b%b", A, B, C, D, X1, X2, X3, X4, X5);
    end

    initial begin
          reset = 1;
      #1; reset = 0;
      #10; ready = 0; A = 0; B = 0; C = 0; D = 0; ready = 1;
      #10; ready = 0; A = 0; B = 0; C = 0; D = 1; ready = 1;
      #10; ready = 0; A = 0; B = 0; C = 1; D = 0; ready = 1;
      #10; ready = 0; A = 0; B = 0; C = 1; D = 1; ready = 1;
      #10; ready = 0; A = 0; B = 1; C = 0; D = 0; ready = 1;
      #10; ready = 0; A = 0; B = 1; C = 0; D = 1; ready = 1;
      #10; ready = 0; A = 0; B = 1; C = 1; D = 0; ready = 1;
      #10; ready = 0; A = 0; B = 1; C = 1; D = 1; ready = 1;
      #10; ready = 0; A = 1; B = 0; C = 0; D = 0; ready = 1;
      #10; ready = 0; A = 1; B = 0; C = 0; D = 1; ready = 1;
      #10; ready = 0; A = 1; B = 0; C = 0; D = 1; ready = 1;
      $finish;
    end
endmodule