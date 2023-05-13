estado_inicial(e(
    [[v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v]])).

%terminal([]):- fail.
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
diagonal([X|A],[_,X|B],[_,_,X|C],[_,_,_,X|D],X):- X \= v.
diagonal([_,_,_,X|_],[_,_,X|_],[_,X|_],[X|_],X):- X \= v.
diagonal([_|A],[_|B],[_|C],[_|D],X):- diagonal(A,B,C,D,X).
diagonal([],[],[],[],_):- fail.

/*
linhas(e(      
    [[v,v,v,v,v,v,v],
     [v,v,x,x,x,x,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v],
     [v,v,v,v,v,v,v]])).

    */