%%%-------------------------------------------------------------------
%%% @author dogge
%%% @copyright (C) 2020, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. mars 2020 13:36
%%%-------------------------------------------------------------------
-module(task1).
-author("dogge").

%% API
-export([eval/1, recur_eval/1]).


eval({Operation, E1, E2}) ->
  try
  {ok, recur_eval({Operation, E1, E2})}
  catch
    _:_ -> error
  end.


recur_eval(N) when is_number(N) -> N;
recur_eval(N) when not is_number(N) and not is_tuple(N) -> error(badarith);
recur_eval({Operation, E1, E2}) ->

  case Operation of
    'add' ->
      recur_eval(E1) + recur_eval(E2);
    'sub' ->
      recur_eval(E1) - recur_eval(E2);
    'mul' ->
      recur_eval(E1) * recur_eval(E2);
    'div' ->
      recur_eval(E1) / recur_eval(E2)
end.









