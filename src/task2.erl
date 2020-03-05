%%%-------------------------------------------------------------------
%%% @author dogge
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. mars 2020 13:36
%%%-------------------------------------------------------------------
-module(task2).
-author("dogge").

%% API
-export([eval/2]).


eval({Operation, A, B}, M) when is_map(M) ->
  try
    {ok, recur_eval({Operation, A, B}, M)}
  catch
    error:badarith -> {error, variable_not_found};
    _:_ -> {error, unknown_error}
  end.


recur_eval(N, _M) when is_number(N) -> N;
recur_eval(N, M) when is_atom(N) and is_map_key(N, M) -> maps:get(N, M);
recur_eval(N, _M) when not is_tuple(N) -> error(badarith);
recur_eval({Operation, E1, E2}, M) ->

  case Operation of
    'add' ->
      recur_eval(E1, M) + recur_eval(E2, M);
    'sub' ->
      recur_eval(E1, M) - recur_eval(E2, M);
    'mul' ->
      recur_eval(E1, M) * recur_eval(E2, M);
    'div' ->
      recur_eval(E1, M) / recur_eval(E2, M)
  end.

