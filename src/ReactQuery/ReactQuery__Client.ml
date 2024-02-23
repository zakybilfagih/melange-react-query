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

let queryBehavior ~onFetch = { onFetch }

type 'data getPreviousPageParamFunction = {
  firstPage : 'data;
  allPages : 'data array;
}

let getPreviousPageParamFunction ~firstPage ~allPages = { firstPage; allPages }

type 'data getNextPageParamFunction = {
  lastPage : 'data;
  allPages : 'data array;
}

let getNextPageParamFunction ~lastPage ~allPages = { lastPage; allPages }

type ('error,
       'data,
       'queryData,
       'queryKey,
       'pageParam,
       'queryContextMeta)
     queryObserverOptions = {
  retry : 'error ReactQuery__Types.retryValue option; [@optional]
  retryDelay : 'error ReactQuery__Types.retryValue option; [@optional]
  cacheTime : int option; [@optional]
  isDataEqual : ('data option -> 'data -> bool) option; [@optional]
  queryHash : string option; [@optional]
  queryKey : 'queryKey option; [@optional]
  queryKeyHashFn : ('queryKey -> string) option; [@optional]
  initialData : (unit -> 'data) option; [@optional]
  initialDataUpdatedAt : (unit -> int option) option; [@optional]
  behavior : queryBehavior option; [@optional]
  structuralSharing : bool option; [@optional]
  getPreviousPageParam : 'data getPreviousPageParamFunction option; [@optional]
  getNextPageParam : 'data getNextPageParamFunction option; [@optional]
  defaulted : bool option; [@optional]
  enabled : bool option; [@optional]
  staleTime : int option; [@optional]
  refetchInterval : ReactQuery__Types.refetchIntervalValue option; [@optional]
  refetchIntervalInBackground : bool option; [@optional]
  refetchOnWindowFocus : ReactQuery__Types.boolOrAlwaysValue option; [@optional]
  refetchOnReconnect : ReactQuery__Types.boolOrAlwaysValue option; [@optional]
  refetchOnMount : ReactQuery__Types.boolOrAlwaysValue option; [@optional]
  retryOnMount : bool option; [@optional]
  notifyOnChangeProps : notifyOnChangePropsKeys array option; [@optional]
  notifyOnChangePropsExclusions : bool array option; [@optional]
  onSuccess : ('data -> unit) option; [@optional]
  onError : ('error -> unit) option; [@optional]
  onSettled : ('data option -> 'error option -> unit) option; [@optional]
  useErrorBoundary : bool option; [@optional]
  select : ('queryData -> 'data) option; [@optional]
  suspense : bool option; [@optional]
  keepPreviousData : bool option; [@optional]
  placeholderData : ReactQuery__Types.placeholderDataValue option; [@optional]
  optimisticResults : bool option; [@optional]
  queryFn :
    ('queryKey, 'pageParam, 'queryContextMeta) ReactQuery__Types.queryFunctionContext ->
    'queryData Js.Promise.t;
}

type ('error, 'data, 'queryData, 'queryKey, 'pageParam, 'queryContextMeta) defaultOptions = {
  queries :
    ( 'error,
      'data,
      'queryData,
      'queryKey,
      'pageParam,
      'queryContextMeta )
    queryObserverOptions
    option;
}

let defaultOptions ?queries () = { queries }

type invalidateQueryFilter = { refetchType : [ `active | `inactive | `all | `none ] }

let invalidateQueryFilter ~refetchType = { refetchType }

type clientRefetchOptions = { throwOnError : bool option }

let clientRefetchOptions ~throwOnError = { throwOnError }

type 'queryKey invalidateQueryOptions = {
  queryKey : 'queryKey option;
  filters : invalidateQueryFilter option;
  refetchOptions : clientRefetchOptions option;
}

let invalidateQueryOptions ?queryKey ?filters ?refetchOptions () =
  { queryKey; filters; refetchOptions }
;;

type 'queryKey refetchQueriesOptions = {
  queryKey : 'queryKey option;
  filters : 'queryKey ReactQuery__Types.queryFilter option;
  refetchOptions : clientRefetchOptions option;
}

let refetchQueriesOptions ?queryKey ?filters ?refetchOptions () =
  { queryKey; filters; refetchOptions }
;;

type 'queryKey cancelQueriesOptions = {
  queryKey : 'queryKey option;
  filters : 'queryKey ReactQuery__Types.queryFilter option;
}

let cancelQueriesOptions ?queryKey ?filters () = { queryKey; filters }

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
  status : ReactQuery__Types.queryStatus;
}

type ('queryKey, 'queryData, 'queryError, 'pageParam, 'queryContextMeta) fetchQueryOptions = {
  queryKey : 'queryKey option;
  queryFn :
    (('queryKey, 'pageParam, 'queryContextMeta) ReactQuery__Types.queryFunctionContext ->
    'queryData Js.Promise.t)
    option;
  retry : 'queryError ReactQuery__Types.retryValue option;
  retryOnMount : bool option;
  retryDelay : 'queryError ReactQuery__Types.retryDelayValue option;
  staleTime : ReactQuery__Types.timeValue option;
  queryKeyHashFn : ('queryKey -> string) option;
  refetchOnMount : ReactQuery__Types.boolOrAlwaysValue option;
  structuralSharing : bool option;
  initialData : ('queryData -> 'queryData) option;
  initialDataUpdatedAt : (unit -> int) option;
}

let fetchQueryOptions
    ?queryKey
    ?queryFn
    ?retry
    ?retryOnMount
    ?retryDelay
    ?staleTime
    ?queryKeyHashFn
    ?refetchOnMount
    ?structuralSharing
    ?initialData
    ?initialDataUpdatedAt
    () =
  {
    queryKey;
    queryFn;
    retry;
    retryOnMount;
    retryDelay;
    staleTime;
    queryKeyHashFn;
    refetchOnMount;
    structuralSharing;
    initialData;
    initialDataUpdatedAt;
  }
;;

type ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) queryClient = {
  fetchQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) fetchQueryOptions ->
    'queryData Js.Promise.t;
  fetchInfiniteQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) fetchQueryOptions ->
    'queryData ReactQuery__Types.infiniteData Js.Promise.t;
  prefetchQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) fetchQueryOptions ->
    unit Js.Promise.t;
  prefetchInfiniteQuery :
    ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) fetchQueryOptions ->
    unit Js.Promise.t;
  setQueryData : 'queryKey -> 'queryData option -> 'queryData;
  getQueryState :
    'queryKey ->
    'queryKey ReactQuery__Types.queryFilter ->
    ('queryData, 'queryError) queryState;
  setQueriesData :
    'queryKey ReactQuery__Types.queryDataKeyOrFilterValue ->
    ('queryData option -> 'queryData) ->
    unit;
  invalidateQueries :
    'queryKey ReactQuery__Types.queryFilter option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  refetchQueries :
    'queryKey ReactQuery__Types.queryFilter option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  cancelQueries : 'queryKey ReactQuery__Types.queryFilter option -> unit Js.Promise.t;
  removeQueries : 'queryKey ReactQuery__Types.queryFilter option -> unit Js.Promise.t;
  resetQueries :
    'queryKey ReactQuery__Types.queryFilter option ->
    clientRefetchOptions option ->
    unit Js.Promise.t;
  isFetching : 'queryKey ReactQuery__Types.queryFilter option -> bool;
  isMutating : 'queryKey ReactQuery__Types.queryFilter option -> bool;
  clear : unit -> unit;
}

external getQueryData : ReactQuery__Types.queryKeyValue -> 'queryData option = "getQueryData"
[@@mel.send.pipe:
  ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) queryClient]

external useQueryClient :
  unit -> ('queryKey, 'queryData, 'queryError, 'pageParams, 'queryContextMeta) queryClient
  = "useQueryClient"
[@@mel.module "@tanstack/react-query"]

module Provider = struct
  external createClient : unit -> queryClientValue = "QueryClient"
  [@@mel.new] [@@mel.module "@tanstack/react-query"]

  external make :
    client:queryClientValue ->
    ?contextSharing:bool ->
    children:React.element ->
    React.element
    = "QueryClientProvider"
  [@@mel.module "@tanstack/react-query"] [@@react.component]
end
