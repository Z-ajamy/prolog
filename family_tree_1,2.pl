:- initialization(main).


%Function to welcome the user.
hi :- 
    write('\n*************************************************************************\n--->Hello, World!'), nl.

%---------------------------------------------------


%Function to describe the program's operation.
main :-
    hi,
    write('--->This is Abd al-rahman Ahmed mohameed (His Code 20211048) family tree.\n*************************************************************************\n').

%---------------------------------------------------

% تحديد الذكور
male(hamed_1th).
male(ali).
male(abdullah).
male(adel).
male(emad).
male(hamed_2th).
male(hatem).
male(hossam).
male(hosny).
male(hussain).
male(mahmoud_senior).
male(mohameed_1th).
male(mohameed_2th).
male(mustafa).
male(alaa).
male(ahmed).
male(mohi).
male(amr).
male(mahmoud_junior).
male(abdulrahman).

% تحديد الإناث
female(amina_1th).
female(amina_2th).
female(malika).
female(mahroosa).
female(zainab).
female(ezz).
female(dawlat).
female(safiya).
female(hana).
female(eiman).
female(anaam).
female(ibtisam).
female(zeinab_ahmed).

%---------------------------------------------------

% العلاقات الزوجية
married(hamed_1th, amina_1th).
married(ali, malika).
married(ali, mahroosa).
married(hussain, mahroosa).
married(mahmoud_senior, safiya).
married(mohameed_1th, zainab).
married(mohameed_1th, dawlat).
married(ahmed, amina_2th).

%---------------------------------------------------

% أبناء حامد وأمينة
parent(hamed_1th, ali).
parent(amina_1th, ali).

% أبناء علي وملكة
parent(ali, abdullah).
parent(ali, adel).
parent(ali, emad).
parent(malika, abdullah).
parent(malika, adel).
parent(malika, emad).

% أبناء علي ومحروسة
parent(ali, hamed_2th).
parent(ali, hatem).
parent(ali, hossam).
parent(ali, hosny).
parent(ali, eiman).
parent(ali, ibtisam).
parent(ali, amina_2th). % أمينة ابنة علي
parent(mahroosa, hamed_2th).
parent(mahroosa, hatem).
parent(mahroosa, hossam).
parent(mahroosa, hosny).
parent(mahroosa, eiman).
parent(mahroosa, ibtisam).
parent(mahroosa, amina_2th).

% أبناء محروسة وحسين
parent(hussain, ezz).
parent(hussain, anaam).
parent(mahroosa, ezz).
parent(mahroosa, anaam).

% أبناء محمود الكبير وصفية
parent(mahmoud_senior, mohameed_1th).
parent(safiya, mohameed_1th).

% أبناء محمد وزينب
parent(mohameed_1th, mustafa).
parent(mohameed_1th, alaa).
parent(mohameed_1th, ahmed).
parent(mohameed_1th, mohi).
parent(mohameed_1th, amr).
parent(mohameed_1th, hana).
parent(zainab, mustafa).
parent(zainab, alaa).
parent(zainab, ahmed).
parent(zainab, mohi).
parent(zainab, amr).
parent(zainab, hana).

% أبناء محمد ودولت
parent(mohameed_1th, mahmoud_junior).
parent(dawlat, mahmoud_junior).

% أبناء أحمد وأمينة
parent(ahmed, abdulrahman).
parent(ahmed, zeinab_ahmed).
parent(ahmed, mohameed_2th).
parent(amina_2th, abdulrahman).
parent(amina_2th, zeinab_ahmed).
parent(amina_2th, mohameed_2th).

% اولاد العمومة
cousin(mahmoud_senior, hamed_1th).
%---------------------------------------------------

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).


hasbend(X, Y) :- married(X, Y).
wife(X, Y) :- married(Y, X).


haschild(X) :- parent(X, _).


sibling(X, Y) :- 
    parent(P, X), parent(P, Y), X \== Y.


full_brother(X, Y) :- 
    parent(P1, X), parent(P1, Y), parent(P2, X), parent(P2, Y), male(X), male(P1), female(P2), X \== Y.
half_brother(X, Y) :-
    father(F, X), father(F, Y), \+ (mother(M, X), mother(M, Y)), male(X), X \== Y.
half_brother(X, Y) :-
    mother(M, X), mother(M, Y), \+ (father(F, X), father(F, Y)), male(X), X \== Y.


is_child_of(Child, Parent) :- 
    parent(Parent, Child).


full_sister(X, Y) :- 
    parent(P1, X), parent(P1, Y), parent(P2, X), parent(P2, Y), female(X), male(P1), female(P2), X \== Y.
half_sister(X, Y) :-
    father(F, X), father(F, Y), \+ (mother(M, X), mother(M, Y)), female(X), X \== Y.
half_sister(X, Y) :-
    mother(M, X), mother(M, Y), \+ (father(F, X), father(F, Y)), female(X), X \== Y.



grandparent(GP, C) :- 
    parent(GP, P), parent(P, C).
grandfather(GF, C) :- 
    grandparent(GF, C), male(GF).
grandmother(GM, C) :- 
    grandparent(GM, C), female(GM).


uncle(U, C) :- 
    sibling(U, P), parent(P, C), male(U).


aunt(A, C) :- 
    sibling(A, P), parent(P, C), female(A).


step_father(SF, C) :- 
    married(SF, P), parent(P, C), male(SF), \+ parent(SF, C).
step_mother(SM, C) :- 
    married(P, SM), parent(P, C), female(SM), \+ parent(SM, C).



%----------------------- تطبيق 2 -----------------------

predecessor(X, Y) :- parent(X, Y), X \== Y.
predecessor(X, Y) :- parent(X, Z), predecessor(Z,Y), X \== Y.


relative(X, Y) :-
    sibling(X, Y), X \== Y.
relative(X, Y) :-
    cousin(X, Y), X \== Y.
relative(X, Y) :-
    grandparent(GP, X), grandparent(GP, Y), X \== Y.
relative(X, Y) :-
    uncle(X, Y); aunt(X, Y).
relative(X, Y) :-
    predecessor(PRE, X), predecessor(PRE, Y), X \== Y.


calc :-
    X is 100 + 200, write('100 + 200 is '), write(X), nl,
    Y is 400 - 150, write('400 - 150 is '), write(Y), nl,
    Z is 10 * 300, write('10 * 300 is '), write(Z), nl,
    A is 100 / 30, write('100 / 30 is '), write(A), nl,
    B is 100 // 30, write('100 // 30 is '), write(B), nl,
    C is 100 ** 2, write('100 ** 2 is '), write(C), nl,
    D is 100 mod 30, write('100 mod 30 is '), write(D), nl.



child_of(X, Y) :- father(X, Y); mother(X, Y).


count_to_100(100) :- write(100), nl.
count_to_100(X) :-
    X < 100,
    write(X), nl,
    Y is X + 1,
    count_to_10(Y).


gt(X, Y) :- X >= Y, write('X is greater or equal').
gt(X, Y) :- X < Y, write('X is smaller').


gte(X, Y) :- X > Y, write('X is greater').
gte(X, Y) :- X =:= Y, write('X and Y are same').
gte(X, Y) :- X < Y, write('X is smaller').


has_parent(X) :- parent(_, X).
