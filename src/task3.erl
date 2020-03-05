%%%-------------------------------------------------------------------
%%% @author Douglas
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. mars 2020 09:45
%%%-------------------------------------------------------------------
-module(task3).
-author("Douglas").

%% API
-export([map/2, filter/2]).


map(F, [H|T]) ->

  [F(H)|map(F, T)];
map(_F, []) -> [].


filter(F, [H|T])  ->
  case F(H) of
    true ->
      [H, filter(F, T)];
    false ->
      filter(F, T)
end;
filter(F, []) -> [].
