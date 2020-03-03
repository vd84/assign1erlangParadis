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
-export([eval/1]).

eval(N) when is_number(N) -> N;
eval(N) when not is_number(N) -> error;
eval({Operation, E1, E2}) ->
  case Operation of
    'add' ->
      eval(E1) + eval(E2);
    'sub' ->
      eval(E1) - eval(E2);
    'mul' ->
      eval(E1) * eval(E2);
    'div' ->
      eval(E1) / eval(E2)
  end.







