type queryClientValue
type fetchMeta

type notifyOnChangePropsKeys =
  [ `error
  | `isError
  | `isIdle
  | `isLoading
  | `isLoadingError
  | `isRefetchError
  | `isSuccess
  | `status
  | `tracked
  ]

type infiniteQueryObserverResultProps =
  [ `error
  | `isError
  | `isIdle
  | `isLoading
  | `isLoadingError
  | `isRefetchError
  | `isSuccess
  | `status
  | `tracked
  ]

type fetchContext
type queryBehavior = { onFetch : fetchContext -> unit }

type 'data getPreviousPageParamFunction = {
  firstPage : 'data;
  allPages : 'data array;
}

type 'data getNextPageParamFunction = {
  lastPage : 'data;
  allPages : 'data array;
}

type ('error, 'data, 'queryData, 'queryKey, 'pageParam) queryObserverOptions = {
  retry : 'error ReactQuery_Types.retryValue option;
  retryDelay : 'error ReactQuery_Types.retryValue option;
  cacheTime : int option;
  isDataEqual : ('data option -> 'data -> bool) option;
  queryFn :
    ('queryKey, 'pageParam) ReactQuery_Types.queryFunctionContext ->
    'queryData Js.Promise.t;
  queryHash : string option;
  queryKey : 'queryKey option;
  queryKeyHashFn : ('queryKey -> string) option;
  initialData : (unit -> 'data) option;
  initialDataUpdatedAt : (unit -> int option) option;
  behavior : queryBehavior option;
  structuralSharing : bool option;
  getPreviousPageParam : 'data getPreviousPageParamFunction option;
  getNextPageParam : 'data getNextPageParamFunction option;
  _defaulted : bool option;
  enabled : bool option;
  staleTime : int option;
  refetchInterval : ReactQuery_Types.refetchIntervalValue option;
  refetchIntervalInBackground : bool option;
  refetchOnWindowFocus : ReactQuery_Types.boolOrAlwaysValue option;
  refetchOnReconnect : ReactQuery_Types.boolOrAlwaysValue option;
  refetchOnMount : ReactQuery_Types.boolOrAlwaysValue option;
  retryOnMount : bool option;
  notifyOnChangeProps : notifyOnChangePropsKeys array option;
  notifyOnChangePropsExclusions : bool array option;
  onSuccess : ('data -> unit) option;
  onError : ('error -> unit) option;
  onSettled : ('data option -> 'error option -> unit) option;
  useErrorBoundary : bool option;
  select : ('queryData -> 'data) option;
  suspense : bool option;
  keepPreviousData : bool option;
  placeholderData : ReactQuery_Types.placeholderDataValue option;
  optimisticResults : bool option;
}

type ('error, 'data, 'queryData, 'queryKey, 'pageParam) defaultOptions = {
  queries : ('error, 'data, 'queryData, 'queryKey, 'pageParam) queryObserverOptions option;
}

type invalidateQueryFilter = { refetchType : [ `active | `inactive | `all | `none ] }
type clientRefetchOptions = { throwOnError : bool option }

type 'queryKey invalidateQueryOptions = {
  queryKey : 'queryKey option;
  filters : invalidateQueryFilter option;
  refetchOptions : clientRefetchOptions option;
}

type 'queryKey refetchQueriesOptions = {
  queryKey : 'queryKey option;
  filters : 'queryKey ReactQuery_Types.QueryFilter.t option;
  refetchOptions : clientRefetchOptions option;
}

type 'queryKey cancelQueriesOptions = {
  queryKey : 'queryKey option;
  filters : 'queryKey ReactQuery_Types.QueryFilter.t option;
}

type ('queryData, 'queryError) queryState = {
  data : 'queryData option;
  dataUpdateCount : int;
  dataUpdatedAt : int;
  error : 'queryError Js.Nullable.t;
  errorUpdateCount : int;
  errorUpdatedAt : int;
  fetchFailureCount : int;
  fetchMeta : fetchMeta;
  isFetching : bool;
  isInvalidated : bool;
  isPaused : bool;
  status : ReactQuery_Types.queryStatus;
}

type ('queryKey, 'queryData, 'queryError, 'pageParam) fetchQueryOptions = {
  queryKey : 'queryKey option;
  queryFn :
    (('queryKey, 'pageParam) ReactQuery_Types.queryFunctionContext ->
    'queryData Js.Promise.t)
    option;
  retry : 'queryError ReactQuery_Types.retryValue option;
  retryOnMount : bool option;
  retryDelay : 'queryError ReactQuery_Types.retryDelayValue option;
  staleTime : ReactQuery_Types.timeValue option;
  queryKeyHashFn : ('queryKey -> string) option;
  refetchOnMount : ReactQuery_Types.boolOrAlwaysValue option;
  structuralSharing : bool option;
  initialData : ('queryData -> 'queryData) option;
  initialDataUpdatedAt : (unit -> int) option;
}

type ('queryKey, 'queryData, 'queryError, 'pageParams) queryClient = {
  fetchQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams) fetchQueryOptions ->
    'queryData Js.Promise.t;
  fetchInfiniteQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams) fetchQueryOptions ->
    'queryData ReactQuery_Types.infiniteData Js.Promise.t;
  prefetchQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams) fetchQueryOptions ->
    unit Js.Promise.t;
  prefetchInfiniteQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams) fetchQueryOptions ->
    unit Js.Promise.t;
  getQueryData : 'queryKey -> 'queryData option;
  setQueryData : 'queryKey -> 'queryData option -> 'queryData;
  getQueryState :
    'queryKey ->
    'queryKey ReactQuery_Types.QueryFilter.t ->
    ('queryData, 'queryError) queryState;
  setQueriesData :
    'queryKey ReactQuery_Types.queryDataKeyOrFilterValue ->
    ('queryData option -> 'queryData) ->
    unit;
  invalidateQueries :
    'queryKey ReactQuery_Types.QueryFilter.t option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  refetchQueries :
    'queryKey ReactQuery_Types.QueryFilter.t option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  cancelQueries : 'queryKey ReactQuery_Types.QueryFilter.t option -> unit Js.Promise.t;
  removeQueries : 'queryKey ReactQuery_Types.QueryFilter.t option -> unit Js.Promise.t;
  resetQueries :
    'queryKey ReactQuery_Types.QueryFilter.t option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  isFetching : 'queryKey ReactQuery_Types.QueryFilter.t option -> bool;
  isMutating : 'queryKey ReactQuery_Types.QueryFilter.t option -> bool;
  clear : unit -> unit;
}

external useQueryClient :
  unit -> ('queryKey, 'queryData, 'queryError, 'pageParams) queryClient
  = "useQueryClient"
[@@module "@tanstack/react-query"]

module Provider = struct
  external createClient : unit -> queryClientValue = "QueryClient"
  [@@new] [@@module "@tanstack/react-query"]

  external make :
    client:queryClientValue ->
    ?contextSharing:bool ->
    children:React.element ->
    React.element
    = "QueryClientProvider"
  [@@module "@tanstack/react-query"] [@@react.component]
end
