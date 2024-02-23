type query
type queryKeyValue
type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type 'queryError retryValue
type 'queryError retryDelayValue
type 'queryKey queryDataKeyOrFilterValue
type placeholderDataValue

type ('queryKey, 'pageParam, 'queryContextMeta) queryFunctionContext = {
  queryKey : 'queryKey;
  pageParam : 'pageParam;
  meta : 'queryContextMeta Js.t Js.Undefined.t;
}

let queryFunctionContext ~queryKey ~pageParam ~meta = { queryKey; pageParam; meta }

type 'error retryParam =
  [ `bool of bool
  | `number of int
  | `fn of int -> 'error -> bool
  ]

type 'error retryDelayParam =
  [ `number of int
  | `fn of int -> 'error -> int
  ]

type time =
  [ `number of int
  | `infinity
  ]

type refetchInterval =
  [ `bool of bool
  | `number of int
  ]

type boolOrAlways =
  [ `bool of bool
  | `always
  ]

type notifyOnChangeProps =
  [ `array of string array
  | `all
  ]

type 'queryData infiniteData = {
  pages : 'queryData array;
  pageParams : int array;
}

let infiniteData ~pages ~pageParams = { pages; pageParams }

type queryStatus =
  [ `pending
  | `error
  | `success
  ]

type fetchStatus =
  [ `fetching
  | `pending
  | `paused
  | `idle
  ]

type networkMode =
  [ `online
  | `always
  | `offlineFirst
  ]

type ('queryData, 'queryResult) placeholderData =
  [ `data of 'queryData
  | `fn of unit -> 'queryResult option [@as "function"]
  ]

type 'queryKey queryFilter = {
  exact : bool option;
  type_ : [ `active | `inactive | `all ] option; [@mel.as "type"]
  stale : bool option;
  fetching : bool option;
  predicate : (query -> bool) option;
  queryKey : 'queryKey option;
}

let queryFilter ?exact ?type_ ?stale ?fetching ?predicate ?queryKey () =
  { exact; type_; stale; fetching; predicate; queryKey }
;;

type 'queryKey queryDataKeyOrFilter =
  [ `keys of 'queryKey
  | `filters of 'queryKey queryFilter
  ]

type refetchOptions = {
  throwOnError : bool;
  cancelRefetch : bool;
}

let refetchOptions ~throwOnError ~cancelRefetch = { throwOnError; cancelRefetch }
