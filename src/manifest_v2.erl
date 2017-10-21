%%%
%%% https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md
%%%

-module(manifest_v2).
-compile(export_all).

-type schema_version() :: integer().
-type media_type() :: iolist().
-type config() :: map().
-type digest() :: iolist().
-type layer() :: map().
-type layers() :: [ layer(), ... ].
-type urls() :: list().

media_types() ->
	[<<"application/vnd.docker.distribution.manifest.v1+json">>
	,<<"application/vnd.docker.distribution.manifest.v2+json">>
	,<<"application/vnd.docker.distribution.manifest.list.v2+json">>
	,<<"application/vnd.docker.container.image.v1+json">>
	,<<"application/vnd.docker.image.rootfs.diff.tar.gzip">>
	,<<"application/vnd.docker.image.rootfs.foreign.diff.tar.gzip">>
	,<<"application/vnd.docker.plugin.v1+json">>].

digest() ->
	<<"sha256:e692418e4cbaf90ca69d05a66403747baa33ee08806650b51fab815ad7fc331f">>.

platform() ->
	#{ architecture => <<"ppc64le">>
	 , os => <<"linux">>
	}.

manifest() ->
	#{ mediaType => <<"application/vnd.docker.distribution.manifest.v2+json">>
	 , size => 7143
	 , digest => digest()
	 , platform => platform()
	}.

manifest_list() ->
	#{ schemaVersion => 2
	 , mediaType => <<"">>
	 , manifests => [ manifest(), manifest() ]
	}.

config() ->
	#{ mediaType => <<"application/vnd.docker.container.image.v1+json">>
	 , size => 7023
	 , digest => digest()
	}.

layer() ->
	#{ mediaType => <<"application/vnd.docker.image.rootfs.diff.tar.gzip">>
	 , size => 32654
	 , digest => digest()
	}.

image_manifest() ->
	#{ schemaVersion => 2
	 , mediaType => <<"application/vnd.docker.distribution.manifest.v2+json">>
	 , config => config()
	 , layers => [ layer(), layer() ]
	}.
