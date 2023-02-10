nn(mnist_net,[X],Y,[0,1,2,3,4,5,6,7]) :: digit(X,Y).

number([],Result,Result).
number([H|T],Acc,Result) :- digit(H,Nr), 
                            Acc2 is Nr+8*Acc,
                            number(T,Acc2,Result).
number(X,Y) :- number(X,0,Y).

dec2oct(0,0).
dec2oct(S,X) :- X > 0 , 
               X1 is X // 8 , 
               dec2oct(S1,X1),  
               S0 is X mod 8 , 
               S is S0 + S1 * 10 .

division(X,Y,Z) :- number(X,Xdec), 
                   number(Y,Ydec), 
                   Ydec > 0, 
                   Zdec is Xdec//Ydec, 
                   dec2oct(Z, Zdec).

