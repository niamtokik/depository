%%%
%%% https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-1.md
%%% 

-module(manifest_v1).
-compile(export_all).

-spec name(string()) -> #{ atom() => string() }.
name(String) ->
	name(String, #{}).
-spec name(string(), map()) -> map().
name(String, Map) ->
	maps:put(name, String, Map). 	

-spec tag(string()) -> #{ atom() => string() }.
tag(String) ->
	tag(String, #{}).
-spec tag(string(), map()) -> map().
tag(String, Map) ->
	maps:put(tag, String, Map).

architecture(String) ->
	architecture(String, #{}).
architecture(String, Map) ->
	maps:put(architecture, String, Map).

fs_layers(List) ->
	fs_layers(List, #{}).
fs_layers(List, Map) ->
	maps:put(fsLayers, List, Map).

blob_sum(Digest) ->
	blob_sum(Digest, #{}).
blob_sum(Digest, Map) ->
	maps:put(blobSum, Digest, Map).

history(List) ->
	history(List, #{}).
history(List, Map) ->
	maps:put(history, List, Map).

% v1_compatibility.

schema_version(Integer) ->
	schema_version(Integer, #{}).
schema_version(Integer, Map) ->
	maps:put(schemaVersion, Integer, Map).

% signatures.
