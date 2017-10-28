%%%------------------------------------------------------------------- 
%%% storage abstraction module
%%% this module will be used to abstract multiple way of storing
%%% data and meta-data.
%%%------------------------------------------------------------------- 
-module(storage).
-compile(export_all).
-behavior(gen_server).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
start() ->
	start([]).
start(_Args) ->
	start(?MODULE, _Args).
start(Name, _Args) ->
	start(Name, _Args, []).
start(Name, _Args, _Opts) ->
	gen_server:start({local, Name}, ?MODULE, _Args, _Opts).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
start_link() ->
	start_link([]).
start_link(_Args) ->
	start_link(?MODULE, _Args).
start_link(Name, _Args) ->
	start_link(Name, _Args, []).
start_link(Name, _Args, _Opts) ->
	gen_server:start_link({local, Name}, ?MODULE, _Args, _Opts).


%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
stop() ->
	stop(?MODULE).
stop(ServerRef) ->
	gen_server:stop(ServerRef).
stop(ServerRef, Reason) ->
	gen_server:stop(ServerRef, Reason, 1000).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
restart() ->
	stop(?MODULE),
	start().

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
init(_Args) ->
	{ok, #{ storage => storage_null }}.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
	ok.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
% HEAD /v2/<name>/blobs/<digest>
handle_call({head, _Name, _Digest}, _From, _State) ->
	unsupported(_State);

% POST /v2/<name>/blobs/uploads/
handle_call({post, _Name, _UUID}, _From, _State) ->
	unsupported(_State);

% PUT /v2/<name>/blobs/uploads/<uuid>?digest=<digest>
handle_call({put, _Name, _UUID, _Digest}, _From, _State) ->
	unsupported(_State);

% GET /v2/<name>/blobs/uploads/<uuid>
handle_call({get, _Name, _Digest}, _From, _State) ->
	unsupported(_State);
handle_call({get, _Info, _Name, _Digest}, _From, _State) ->
	unsupported(_State);

% PATCH /v2/<name>/blobs/uploads/<uuid> 
handle_call({patch, _Name, _Digest}, _From, _State) ->
	unsupported(_State);

% DELETE /v2/<name>/blobs/uploads/<uuid>
handle_call({delete, _Name, _Digest}, _From, _State) ->
	unsupported(_State);

% wildcard.
handle_call(_Request, _From, _State) ->
	unsupported(_State).

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
handle_cast(_Request, _State) ->
	{noreply, _State}.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
handle_info(_Info, _State) ->
	{noreply, _State, 1000}.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
code_change(_OldVersion, _State, _Extra) ->
	{ok, _State}.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
unsupported(State) ->
	{reply, unsupported, State}.

%%--------------------------------------------------------------------
%% call
%%--------------------------------------------------------------------
call(Data) ->
	gen_server:call(?MODULE, Data).
