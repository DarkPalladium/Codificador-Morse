
//Roniel Nunes Baborsa			    3464	
//Pablo Miranda Batista			    3482
//Lucas Antonio de Souza Lima		3481
//Cleidimar Lacerda dos Passos		3473


module codificador (A, B, C, D, reset, ready, X1, X2, X3, X4, X5);

    input wire A, B, C, D, reset, ready;
    output reg X1, X2, X3, X4, X5;

    always @ (*) begin
        if (~reset & ready)begin
            if ((A & ~B & C & ~D) || (A & ~B & C & D) || (A & B & ~C & ~D) || (A & B & ~C & D) || (A & B & C & ~D) || (A & B & C & D)) begin
                X1 = 0;
                X2 = 0;
                X3 = 0;
                X4 = 0;
                X5 = 0;
            end else begin
                X1 <= (B & ~C) || (~B & C) || (~A & ~C & D);
                X2 <= (B & ~C) || (C & ~D) || (~B & C);
                X3 <= (~A & B) || (C & D);
                X4 <= B || (A & ~D);
                X5 <= A || (B & D) || (B & C);
            end
        end else begin
            if (reset) begin
                X1 = 0;
                X2 = 0;
                X3 = 0;
                X4 = 0;
                X5 = 0;
            end
        end
    end
endmodule