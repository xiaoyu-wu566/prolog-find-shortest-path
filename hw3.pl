arc(d,b,8).
arc(c,b,10).
arc(c,d,5).
arc(a,c,3).

path(A,B,C):- arc(A,B,C).


%A is starting point, B is ending point, P is path, C is cost
path(A,B,P,C) :-
    travel(A,B,[A],Q,C), 
    reverse(Q,P).

travel(A,B,P,[B|P],C) :- 
    arc(A,B,C).

travel(A,B,Visited,Path,C) :-
    arc(A,M,C1),
    arc(A,N,C2),
    C1 < C2
    ->  (   arc(A,M,C1),
    travel(M,B,[M|Visited],Path,C3),
    C is C1+C3);
    (   arc(A,N,C2),
    travel(N,B,[N|Visited],Path,C3),
    C is C2+C3).  
