apply(add,X,Y,Res) :- Res is X + Y.
apply(subtract,X,Y,Res) :- Res is X - Y.
apply(multiply,X,Y,Res) :- Res is X * Y.
apply(divide,X,Y,Res) :- Res is X / Y.

% apply_lr([CurOp|RestOps], [H|ListVals], Res) :- apply(CurOp,Res,H,Res),
%
apply_lr([],[],0).
apply_lr([],[ResVal], ResVal).
apply_lr([CurOp|RestOps], [H,N|ListVals], Res) :- apply(CurOp,H,N,NewRes), apply_lr(RestOps,[NewRes|ListVals],Res).
% apply_lr([CurOp], [H], Res) :- apply(CurOp, Res,H,NewRes).
%

my_permutation([], []).
my_permutation(L, [H|T]) :- append(LL, [H|LR], L), append(LL, LR, LN), my_permutation(LN, T).

% all_lists is somewhat of a permutation generator, but you can have
% copies of the operation in the permutation

% Can use Length(X,Length) to generate an empty list of size Length
% Ex. Length(X,3) = [_,_,_]
%
% Create a helper function that fills in the empty list with elements
% from the list of elements
%
% member/2 predicate can get elements from the list

% Build list with just add in it -> [add,_,_] -> insert another add into
% the list -> [add,add,_] -> insert a final add into the list ->
% [add,add,add] (first output) -> backtrack to the previous list with
% only 2 adds in it and insert subtract -> [add,add,subtract] (second
% output) -> backtrack to 2 adds list and backtrack again to the 1 add
% list and insert a subtract -> [add,subtract,_]
%
% Each elements from the list of operations is extracted using member/2,
% which will be where the program backtracks to each time
%
% Should only need to do all_lists once because we only want a don't
% care list once, and then we will backtrack for everything else

fill_list(List,[]) :- member([],List).
fill_list(List,[Element]) :- member(Element,List).
fill_list(List,[Element|Tail]) :-  member(Element,List),fill_list(List,Tail).

all_lists(0,_,[]).
all_lists(Length, List, Res) :- length(Res,Length), fill_list(List,Res).


%Combo
%Length/2 can be used to create empty list of certain length
%Use is/2
%Use all_lists and apply_lr possibly
combo(List, Values,Res) :- apply_lr(List,Values,Res).





