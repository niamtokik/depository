-module(depository_basic_SUITE).
-compile(export_all).

suite() ->
	[].

all() ->
	[depository].

init_per_testcase(depository, _Config) ->
	depository:start().

depository(_Config) ->
	ranch:get_port(depository) =:= 8080 .

