%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright 2017, Mathieu Kerjouan
%%%-------------------------------------------------------------------

-module(depository_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
	Options = [{port, 8080}],
	Routes = depository_routes:routes(),
	Domain = [{'_', Routes}],
	Compile = cowboy_router:compile(Domain),
	Dispatch = #{ env => #{ dispatch => Compile }},
	{ok, _} = cowboy:start_clear(depository, Options, Dispatch),
	depository_sup:start_link().

stop(_State) ->
	cowboy:stop_listener(depository).
