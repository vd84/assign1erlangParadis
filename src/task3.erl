%%%-------------------------------------------------------------------
%%% @author dogge
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. mars 2020 13:50
%%%-------------------------------------------------------------------
-module(task3).
-author("dogge").

%% API
-export([map/2]).




map(F, [H]) -> H;
map(F, [H|T]) when size(H): 1 and size(T) == 1 ->
  [F(H),F(T)];
map(F, [H|T]) ->
  A = F(H),
  %map(F, T)
  io:format(is_atom(A)),
  lists:append([A], map(F,T)).

