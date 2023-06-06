/*estado_inicial(e(
    [[v,v,v,v,v,v],
     [v,v,v,v,v,v],
     [v,v,v,v,v,v],
     [v,v,v,v,v,v],
     [x,v,v,v,v,v],
     [x,v,v,v,v,v],
     [x,v,v,v,v,v]])).*/
estado_inicial(e(
   [[v,v,v,v,v,v,v],
    [v,v,v,v,v,v,v],
    [v,v,v,v,v,v,v],
    [v,v,v,v,v,v,v],
    [x,v,v,v,v,v,v],
    [x,v,v,v,v,v,v]])).

terminal(E):- linhas(E,_); colunas(E,_); diagonal(E,_); cheio(E).

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

cheio(e([A,B,C,D,E,F])) :- append(A, B, AB), append(C, D, CD), append(E, F, EF), append(AB,CD,L4), append(L4,EF, ALL), \+ member(v, ALL).
   

valor(E,1,P) :- terminal(E), R is P mod 2, R=1.
valor(E,-1,P) :- terminal(E), R is P mod 2, R=0.
valor(_,0,_).
/*
igual(X,X).

verificar(e([]),e([]),_,_).
verificar(e([HI|TI]), e([HF|TF]), (C,J), LA) :- C@<8,(igual(J, x); igual(J, o)), verificar(HI,HF,(C,J), LA), LAA is LA+1,verificar(e(TI), e(TF), (C,J), LAA).
verificar([],[],_,_).
verificar(CI,CF,(C, J),C ) :- ver_coluna(CI, CF, J).
verificar(CC,CC,(CA, _),C ) :- CA \= C.

vercoluna([],_,_).
ver_coluna([v|T], [HF|T],J):- igual(HF,J), (igual(TI, []); \+ member(v, TI)).
ver_coluna([H|TI], [H|TF],J):- ver_coluna(TI, TF, J).


op1(EI, J, EF) :-  verificar(EI, EF, J, 1).*/

igual(X, X).
%verifica(EI,EF,LA,(LP,CP),J):- 
verifica(e([]),e([]),_,_).
verifica(e([HI|TI]),e([HF|TF]),LA,(LP,CP,J)):- LP @< 7, CP @< 8, verifica(HI, HF,(LA,1),(LP,CP,J)), LAA is LA + 1, verifica(e(TI),e(TF),LAA,(LP,CP,J)).
%verifica(LI, LF, (LA,CA),(LP,CP),J)
verifica([],[],_,_,_).
verifica([HI|TI],[HF|TF],(L,C),(L,C,J)) :- igual(HI,v),igual(HF,J), CA is C+1, verifica(TI,TF,(L,CA),(L,C,J)).
verifica([H|TI],[H|TF],(LA,C),(L,C,J)) :-  LA \= L, ((LA < L,H = v); H \= v), CA is C + 1, verifica(TI,TF,(LA,CA),(L,C,J)).
verifica([H|TI],[H|TF],(LA,CA),(L,C,J)) :- CA \= C, CAA is CA +1, verifica(TI, TF, (LA,CAA),(L, C,J)).

%op1(EI, J, EF) :-  verifica(EI,EF,1,J).

op1(EI, J, EF) :- verifica(EI,EF,1,J).
/*
colunas(e(      
    [[v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [o,v,v,v,v,v,v],
     [o,v,v,v,v,v,v],
     [o,v,v,v,v,v,v],
     [o,v,v,v,v,v,v]]), o).

    */