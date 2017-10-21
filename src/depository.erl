-module(depository).
-compile(export_all).

main(_) ->
	start().

start() ->
	application:ensure_all_started(depository).
