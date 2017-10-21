-module(depository_tag).
-compile(export_all).

-type name() :: string().
-type tag() :: string().
-type tags() :: [ tag(), ... ].

-spec tags(string(), list()) -> map().
tags(Name, Tags) -> 
	#{ name => Name
	 , tags => Tags }.
