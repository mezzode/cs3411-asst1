% Sean Batongbacal
% z5024967
% COMP3411 Assignment 1 - Prolog Programming

% Notes
% - At the start of each predicate write a comment describing the overall
%   function of the predicate. 
% - Test code; write test cases for every part.

% Question 1

% even(Number) is true if Number is even
even(Number) :- 0 is Number mod 2.
% odd(Number) is true if Number is odd
odd(Number) :- 1 is Number mod 2.

% sumsq_even(Numbers, Sum)
% Sum is the sum of the squares of the even numbers in the list Numbers.

% add square of even numbers
sumsq_even(Numbers, Sum) :-
    Numbers = [Head | Tail],
    sumsq_even(Tail, Rest),
    even(Head),
    Sum is Head * Head + Rest.

% skip odd numbers
sumsq_even(Numbers, Sum) :-
    Numbers = [Head | Tail],
    sumsq_even(Tail, Rest),
    odd(Head),
    Sum = Rest.

% base case
sumsq_even(Numbers, Sum) :-
    Numbers = [],
    Sum = 0.

% Question 2

% all_like(What, List)
% Suceeds if List is empty or contains only people who like What.

% base case
all_like(What, List) :-
    List = [].

% recursion
all_like(What, List) :-
    List = [Head | Tail],
    likes(Head, What),
    all_like(What, Tail).

% Question 3

% sqrt_table(N, M, Result)
% Result is a list of pairs [A, B] where A are numbers from N to M and B
% is the square root of A. N >= M, and both are non-negative integers.

sqrt_table(N, M, Result) :- 
    N >= M,
    M >= 0,
    Next is N - 1,
    sqrt_table(Next, M, Tail),
    Result = [Head | Tail],
    Head = [N, Root],
    Root is sqrt(N).
    
sqrt_table(N, M, Result) :-
    N = M,
    M >= 0,
    Root is sqrt(N),
    Result = [[N, Root]].

% Question 4

% chop_down(List, NewList)
% NewList is List with all sequences of successive decreasing whole
% numbers replaced with the last number of the sequence.
% e.g.
% chop_down([1, 3, 7, 6, 5, 10, 9], Result).
% Result = [1, 3, 5, 9] ;
% false.

% empty List
chop_down(List, NewList) :-
    List = [],
    NewList = List.

% single item list
chop_down(List, NewList) :-
    List = [_],
    NewList = List.

% continue if the first number is not part of a sequence
chop_down(List, NewList) :-
    List = [First | Tail],
    Tail = [Second | _],
    First =\= Second + 1,
    chop_down(Tail, NewList2),
    NewList = [First | NewList2].

% chop first number if it is part of a sequence
chop_down(List, NewList) :-
    List = [First | Tail],
    Tail = [Second | Tail2],
    First is Second + 1,
    chop_down(Tail, NewList).

% Question 5

% tree_eval(Value, Tree, Eval)
% Tree branches are of the form:
% - tree(L, Op, R) where Op is one of '+', '-', '*', '/'
% Tree leaves may be one of two forms:
% - tree(empty, Num, empty) where Num is a number
% - tree(empty, z, empty) where z represents Value

% z leaf
tree_eval(Value, Tree, Eval) :-
    Tree = tree(empty, z, empty),
    Eval = Value.

% num leaf
tree_eval(Value, Tree, Eval) :-
    Tree = tree(empty, Eval, empty),
    number(Eval).
