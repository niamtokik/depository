%%%-------------------------------------------------------------------
%%%
%%%-------------------------------------------------------------------
-module(depository_api_error).
-compile(export_all).
-type code() :: string().
-type message() :: string().
-type detail() :: term().
-type api_error() :: #{ code => code()
                      , message => message()
                      , detail => detail() }.
-type api_errors() :: #{ errors => [ api_error(), ... ] }.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec code(string()) -> #{ code => string() }.
code(Integer) ->
	code(Integer, #{}).

-spec code(string(), map()) -> map().
code(Integer, Map) ->
	maps:put(code, Integer, Map).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec message(string()) -> #{ message => string() }.
message(String) ->
	message(String, #{}).

-spec message(string(), map()) -> map().
message(String, Map) ->
	maps:put(message, String, Map).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec detail(term()) -> #{ detail => term() }.
detail(Term) ->
	detail(Term, #{}).

-spec detail(term(), map()) -> map().
detail(Term, Map) ->
	maps:put(detail, Term, Map).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec error(code(), message(), detail()) -> api_error().
error(Code, Message, Detail) ->
	C = code(Code, #{}),
	M = message(Message, C),
	D = detail(Detail, M),
	D.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
-spec errors([api_error(), ...]) -> api_errors().
errors(List) -> 
	errors(List, #{}).

-spec errors(list(), map()) -> map().
errors(List, Map) ->
	maps:put(List, Map).

