%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_handler_base).
-compile(export_all).

init(#{ method := <<"GET">>} = Req, Opts) ->
	depository_handler_default:init(Req, Opts);
init(Req, Opts) ->
	{ok, Req, Opts}.
