%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_routes).
-compile(export_all).

check_handler(base) ->
	#{ headers => [<<"Host">>, <<"Authorization">>]
	 , parameters => [] };
check_handler(tag) ->
	#{ headers => [<<"Host">>, <<"Authorization">>]
	 , parameters => [] };
check_handler(manifest) ->
	#{ headers => [ <<"Host">>, <<"Authorization">> ]
	 , parameters => [name, reference] }.

-spec routes() -> [{string(), atom(), list()}, ...].
routes() ->
	[{"/v2/", depository_handler_base , check_handler(base) }
	,{"/v2/:name/tags/list", depository_handler_tag, check_handler(tag) }
	,{"/v2/:name/manifests/:reference", depository_handler_manifest, check_handler(manifest) }
	,{"/v2/:name/blobs/:digest", depository_handler_blob, []}
	,{"/v2/:name/blobs/uploads", depository_handler_blob, []}
	,{"/v2/:name/blobs/uploads/:uuid", depository_handler_blob, []}
	,{"/v2/_catalog", depository_handler_catalog, []}
	].
