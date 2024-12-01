:- initialization(main).


%Function to welcome the user.
hi :- 
    write('\n*************************************************************************\n--->Hello, World!'), nl.

%---------------------------------------------------


%Function to describe the program's operation.
main :-
    hi,
    write('--->This is Abd al-rahman Ahmed mohameed (His Code 20211048) project.\n*************************************************************************\n').

%---------------------------------------------------



% التحقق من وجود عنصر في قائمة
list_member(X, [X|_]).
list_member(X, [_|Tail]) :- list_member(X, Tail).

% دمج قائمتين
list_concat([], L, L).
list_concat([Head|Tail], L, [Head|Result]) :- list_concat(Tail, L, Result).

% حساب طول القائمة
list_length([], 0).
list_length([_|Tail], Length) :-
    list_length(Tail, TailLength),
    Length is TailLength + 1.

% حذف عنصر من القائمة
list_delete(X, [X|Tail], Tail).
list_delete(X, [Head|Tail], [Head|Result]) :- list_delete(X, Tail, Result).

% إدخال عنصر في القائمة
list_insert(X, L, [X|L]).

% عكس القائمة
list_reverse([], []).
list_reverse([Head|Tail], Reversed) :-
    list_reverse(Tail, RevTail),
    list_concat(RevTail, [Head], Reversed).

% إزاحة لليسار
list_shift([Head|Tail], Shifted) :-
    list_concat(Tail, [Head], Shifted).

% ترتيب القائمة
list_order([X, Y | Tail]) :- X =< Y, list_order([Y | Tail]).
list_order([_]).

% توليد التبديلات
list_permutation([], []).
list_permutation(L, [X|P]) :-
    list_delete(X, L, L1),
    list_permutation(L1, P).

% العد التصاعدي
count_up(Start, End) :-
    Start =< End,
    writeln(Start),
    Next is Start + 1,
    count_up(Next, End).
count_up(Start, End) :- Start > End.

% العد التنازلي
count_down(Start, End) :-
    Start >= End,
    writeln(Start),
    Prev is Start - 1,
    count_down(Prev, End).
count_down(Start, End) :- Start < End.

% اتخاذ القرار بناءً على عدد المهام
decision(List) :-
    list_length(List, Length),
    ( Length =:= 0 -> writeln('No tasks in the list.');
      Length < 5 -> writeln('Few tasks to do.');
      writeln('You have many tasks!')).
