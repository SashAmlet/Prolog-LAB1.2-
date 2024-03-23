% Предикат для знаходження мінімального елементу в списку
min_list([Min], Min).
min_list([Head|Tail], Min) :-
    min_list(Tail, TailMin),
    Min is min(Head, TailMin).

% Предикат для знаходження максимального елементу в списку
max_list([Max], Max).
max_list([Head|Tail], Max) :-
    max_list(Tail, TailMax),
    Max is max(Head, TailMax).

% Предикат для вилучення всіх входжень елемента зі списку
remove_all(_, [], []).
remove_all(Elem, [Elem|Tail], Result) :-
    remove_all(Elem, Tail, Result).
remove_all(Elem, [Head|Tail], [Head|Result]) :-
    remove_all(Elem, Tail, Result).

% Предикат для знаходження мінімального та максимального елементів
% та вилучення їх зі списку
min_max_remove([], []).
min_max_remove(List, Result) :-
    min_list(List, Min),
    max_list(List, Max),
    remove_all(Min, List, TempResult),
    remove_all(Max, TempResult, Result).
