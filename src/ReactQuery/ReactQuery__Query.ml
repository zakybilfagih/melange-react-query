type ('queryKey,
       'queryData,
       'data,
       'queryError,
       'pageParam,
       'queryContextMeta)
     queryOptions = {
  queryKey : ReactQuery__Types.queryKeyValue;
  queryFn :
    (( 'queryKey array,
       'pageParam,
       'queryContextMeta )
     ReactQuery__Types.queryFunctionContext ->
    'queryData Js.Promise.t)
    option;
      [@mel.optional]
  enabled : bool option; [@mel.optional]
  networkMode : ReactQuery__Types.networkMode option; [@mel.optional]
  retry : 'queryError ReactQuery__Types.retryValue option; [@mel.optional]
  retryOnMount : bool option; [@mel.optional]
  retryDelay : 'queryError ReactQuery__Types.retryDelayValue option; [@mel.optional]
  staleTime : ReactQuery__Types.timeValue option; [@mel.optional]
  gcTime : ReactQuery__Types.timeValue option; [@mel.optional]
  queryKeyHashFn : ('queryKey -> string) option; [@mel.optional]
  refetchInterval : ReactQuery__Types.refetchIntervalValue option; [@mel.optional]
  refetchIntervalInBackground : bool option; [@mel.optional]
  refetchOnMount : ReactQuery__Types.boolOrAlwaysValue option; [@mel.optional]
  refetchOnWindowFocus : ReactQuery__Types.boolOrAlwaysValue option; [@mel.optional]
  refetchOnReconnect : ReactQuery__Types.boolOrAlwaysValue option; [@mel.optional]
  notifyOnChangeProps : ReactQuery__Types.notifyOnChangePropsValue option; [@mel.optional]
  select : ('queryData -> 'data) option; [@mel.optional]
  initialData : ('queryData -> 'queryData) option; [@mel.optional]
  initialDataUpdatedAt : (unit -> int) option; [@mel.optional]
  placeholderData : (unit -> 'queryData) option; [@mel.optional]
  structuralSharing : bool option; [@mel.optional]
  throwOnError : bool option; [@mel.optional]
  meta : 'queryContextMeta Js.t option; [@mel.optional]
}
[@@deriving jsProperties]

type ('queryError, 'queryData) queryResult = {
  status : ReactQuery__Types.queryStatus;
  isPending : bool;
  isSuccess : bool;
  isError : bool;
  isLoadingError : bool;
  isRefetchError : bool;
  data : 'queryData option;
  dataUpdatedAt : int;
  error : 'queryError Js.Null.t;
  errorUpdatedAt : int;
  isStale : bool;
  isPlaceholderData : bool;
  isFetched : bool;
  isFetchedAfterMount : bool;
  fetchStatus : ReactQuery__Types.fetchStatus;
  isFetching : bool;
  isPaused : bool;
  isRefetching : bool;
  isLoading : bool;
  isInitialLoading : bool;
  failureCount : int;
  failureReason : 'queryError Js.Null.t;
  errorUpdateCount : int;
  refetch :
    ReactQuery__Types.refetchOptions -> ('queryError, 'queryData) queryResult Js.Promise.t;
}

external useQuery :
  ( 'queryKey,
    'queryData,
    'queryData,
    'queryError,
    'pageParam,
    'queryContextMeta )
  queryOptions ->
  ('queryError, 'queryData) queryResult
  = "useQuery"
[@@mel.module "@tanstack/react-query"]

external useQueryWithSelect :
  ('queryKey, 'queryData, 'data, 'queryError, 'pageParam, 'queryContextMeta) queryOptions ->
  ('queryError, 'data) queryResult
  = "useQuery"
[@@mel.module "@tanstack/react-query"]

external useQueries :
  ( 'queryKey,
    'queryData,
    'queryData,
    'queryError,
    'pageParam,
    'queryContextMeta )
  queryOptions
  array ->
  ('queryError, 'queryData) queryResult array
  = "useQueries"
[@@mel.module "@tanstack/react-query"]
