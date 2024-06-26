/*
estado_inicial(e([	v,v,v,v,v,v,v,
					v,v,v,v,v,v,v,
					v,v,v,v,v,v,v,
					v,v,v,v,v,v,v,
					v,v,v,v,v,v,v,
					v,v,v,v,v,v,v], w)).
*/
/*
estado_inicial(e([	v,v,v,v,v,v,v,
    v,v,v,v,v,v,v,
    w,b,w,v,w,b,w,
    b,w,b,w,b,w,b,
    b,w,b,w,b,w,b,
    b,w,b,w,b,w,b], w)).

*/
estado_inicial(e([  v,v,v,v,b,w,b,
                    w,b,v,w,w,b,w,
                    b,w,b,b,w,b,w,
                    w,b,w,b,w,b,w,
                    b,w,b,v,b,w,b,
                    w,b,w,b,w,b,w], w)).


valor(e(L,_),0,P):-  \+ member(v,L),!.
valor(E,V,P):-
        terminal(E),
        X is P mod 2,
        ( X == 1, V = 1 ; X == 0, V = -1 ).



terminal(E):- dividir_em_linhas(E,SL),E = e(L,J),(linhas(e(SL),J);
             colunas(e(SL),J);/* diagonal(e(SL),J);*/ cheio(L)).

cheio(L):- \+member(v,L).

linhas(e([]),_):- fail.
linhas(e([H|T]),X) :- linhas(H,X); linhas(e(T),X).
linhas([X,X,X,X|_],X):- X \= v.
linhas([_|T],X):- linhas(T,X).

colunas(e([]),_):- fail.
colunas(e([_,_,_,[]]),_):- fail.
colunas(e([A,B,C,D|T]),X) :- colunas(A,B,C,D,X); colunas(e([B,C,D|T]),X).
colunas([X|_],[X|_],[X|_],[X|_],X):- X \= v.
colunas([_|A],[_|B],[_|C],[_|D],X):- colunas(A,B,C,D,X).
colunas([],[],[],[],_):- fail.


diagonal(e([]),_):- fail.
diagonal(e([_,_,_,[]]),_):- fail.
diagonal(e([A,B,C,D|T]),X) :- diagonal(A,B,C,D,X); diagonal(e([B,C,D|T]),X).
diagonal([X|_],[_,X|_],[_,_,X|_],[_,_,_,X|_],X):- X \= v.
diagonal([_,_,_,X|_],[_,_,X|_],[_,X|_],[X|_],X):- X \= v.
diagonal([_|A],[_|B],[_|C],[_|D],X):- diagonal(A,B,C,D,X).
diagonal([],[],[],[],_):- fail.

dividir_em_linhas(e(L,_), S) :- divide(L,S).
divide([],[]).
divide([V1,V2,V3,V4,V5,V6,V7|T],[[V1,V2,V3,V4,V5,V6,V7]|T1]):- divide(T,T1).


inv(w,b).
inv(b,w).

op1(e(L,J),(C),e(L1,J1)) :-
    inv(J,J1),
    subs(v,J,L,L1,1,C),C > 0, C < 43.

subs(A,J,[A|R],[J|R],C,C).
subs(A,J,[B|R],[B|S],N,C) :-
        M is N+1,
        subs(A,J,R,S,M,C).