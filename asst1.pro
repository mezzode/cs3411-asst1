% Sean Batongbacal
% z5024967
% COMP3411 Assignment 1 - Prolog Programming

% Notes
% - At the start of each predicate write a comment describing the overall
%   function of the predicate. 
% - Test code; write test cases for every part.

% sumsq_even(Numbers, Sum)
% Sum is the sum of the squares of the even numbers in the list Numbers.
% sumsq_even(Numbers, Sum) :-
%     .

even(Number) :- 0 is Number mod 2.
odd(Number) :- 1 is Number mod 2.

% add even numbers
sum_even(List, Sum) :-
    List = [Head | Tail],
    sum_even(Tail, Rest),
    even(Head),
    Sum is Head + Rest.

% skip odd numbers
sum_even(List, Sum) :-
    List = [Head | Tail],
    sum_even(Tail, Rest),
    odd(Head),
    Sum = Rest.

% base case
sum_even(List, Sum) :-
    List = [],
    Sum = 0.
