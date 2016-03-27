% Sean Batongbacal
% z5024967
% COMP3411 Assignment 1 - Prolog Programming

% Notes
% - At the start of each predicate write a comment describing the overall
%   function of the predicate. 
% - Test code; write test cases for every part.

% sumsq_even(Numbers, Sum)
% Sum is the sum of the squares of the even numbers in the list Numbers.
%% sumsq_even(Numbers, Sum) :-
%%     .

sum(List, Sum) :-
    List = [Head | Tail],
    sum(Tail, Rest),
    Sum is Head + Rest.

sum(List, Sum) :-
    List = [],
    Sum = 0.
