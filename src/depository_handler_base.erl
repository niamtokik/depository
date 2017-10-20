%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_handler_base).
-compile(export_all).

init(#{ method := <<"GET">>} = Req, Opts) ->
	CodeReturn = 200,
	DataReturn = <<"{}">>,
	Headers = #{ <<"content-type">> => <<"application/json">>
	           , <<"Docker-Distribution-API-Version">> => <<"registry/2.0">> },
	Response = cowboy_req:reply(CodeReturn, Headers, DataReturn, Req),
	{ok, Response, Opts};
init(Req, Opts) ->
	{ok, Req, Opts}.
