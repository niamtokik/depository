%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_handler_blob).
-compile(export_all).

% pull a layer
init(#{ method := <<"GET">>
      , bindings := #{ name := Name
                     , digest := Digest } } = Req, Opts) ->
	io:format("name: ~p~n", [Name]),
	io:format("digest: ~p~n", [Digest]),
	depository_handler_default:init(Req, Opts);

% push a layer
init(#{ method := <<"PUSH">>
      , bindings := #{ name := Name } } = Req, Opts) ->
	io:format("name: ~p~n", [Name]),
	depository_handler_default:init(Req, Opts);

% check if a layer already exist
init(#{ method := <<"HEAD">>
      , bindings := #{ name := Name
                     , digest := Digest } } = Req, Opts) ->
	io:format("name: ~p~n", [Name]),
	io:format("digest: ~p~n", [Digest]),
	depository_handler_default:init(Req, Opts);

init(Req, Opts) ->
	{ok, Req, Opts}.
