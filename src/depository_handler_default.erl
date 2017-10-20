%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_handler_default).
-compile(export_all).

init(Req, Opts) ->
	io:format("~p, ~p~n", [Req, Opts]),
	{ok, Req, Opts}.
