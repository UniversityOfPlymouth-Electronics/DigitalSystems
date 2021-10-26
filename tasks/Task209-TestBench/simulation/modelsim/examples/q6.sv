/*

| A | B | C | | Y |
| - | - | - | - | - |
| 0 | 0 | 0 | | 0 |
| 0 | 0 | 1 | | 0 |
| 0 | 1 | 0 | | 1 |
| 0 | 1 | 1 | | 0 |
| 1 | 0 | 0 | | 0 |
| 1 | 0 | 1 | | 1 |
| 1 | 1 | 0 | | 0 |
| 1 | 1 | 1 | | 0 |

*/

module q6(output logic Y, input logic A, B, C);

//assign Y = ( ~A & B & ~C ) | (A & ~B & C);

not #5ps u1(invA, A);

not #5ps u2(invB, B);

not #5ps u3(invC, C);

and #5ps u4(mt2, invA, B, invC);
and #5ps u5(mt5, A, invB, C);

or #5ps u6(Y, mt2, mt5);

endmodule