%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_handler_manifest).
-compile(export_all).

% pull an image manifest
init(#{ method := <<"GET">>
      , bindings := #{ name := Name
                     , reference := Reference} } = Req, Opts) ->
	io:format("name: ~p~n", [Name]),
	io:format("reference: ~p~n", [Reference]),
	depository_handler_default:init(Req, Opts);

% check if an image manifest exist
init(#{ method := <<"HEAD">>
      , bindinfs := #{ name := Name 
                     , reference := Reference }} = Req, Opts) ->
	io:format("name: ~p~n", [Name]),
	io:format("reference: ~p~n", [Reference]),
	depository_handler_default:init(Req, Opts);

% put a manifest 
init(#{ method := <<"PUT">> } = Req, Opts) ->
	depository_handler_default:init(Req, Opts);

% delete a manifest
init(#{ method := <<"DELETE">> } = Req, Opts) ->
	depository_handler_default:init(Req, Opts);

% else we return a 404 not found
init(Req, Opts) ->
	{ok, Req, Opts}.
