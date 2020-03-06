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
-export([map/2, filter/2, split/2, groupby/2]).


map(F, L) ->
  map(F, [], L ).
map(_F, Result, []) -> Result;
map(F, Result, [H|T]) ->
  map(F, [Result|F(H)], T).





filter(F, L)  ->
  filter(F, [], L).
filter(_F, Result, []) -> Result;
filter(F, Result, [H|T]) ->
  case F(H) of
    true ->
      filter(F, Result ++ [H], T);
    false ->
      filter(F, Result, T)
  end.

split(F, L)  ->
  split(F, [], [], L).
split(_F, TrueResult, FalseResult, []) -> {TrueResult, FalseResult};
split(F, TrueResult, FalseResult, [H|T]) ->
  case F(H) of
    true ->
      split(F, TrueResult ++ [H], FalseResult, T);
    false ->
      split(F, TrueResult, FalseResult ++ [H], T)
  end.

groupby(F, L)  ->
  groupby(F, 1, #{negative => [], positive => [], zero => []}, L).
groupby(_F, _Acc, M, []) -> M;
groupby(F, Acc, M, [H|T]) ->
  case F(H) of
    positive ->
      Pos = maps:get(positive, M) ++ [Acc],
      groupby(F, Acc +1, maps:update(positive, Pos, M), T);
    negative ->
      Neg = maps:get(negative, M) ++ [Acc],
      groupby(F, Acc +1, maps:update(negative, Neg, M), T);
    zero ->
      Zer = maps:get(zero, M) ++ [Acc],
      groupby(F, Acc +1, maps:update(zero, Zer, M), T)


  end.