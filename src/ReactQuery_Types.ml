type query
type timeValue
type boolOrAlwaysValue
type refetchIntervalValue
type notifyOnChangePropsValue
type 'queryError retryValue
type 'queryError retryDelayValue
type 'queryKey queryDataKeyOrFilterValue
type placeholderDataValue

type ('queryKey, 'pageParam) queryFunctionContext = {
  queryKey : 'queryKey;
  pageParam : 'pageParam;
}

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

type queryStatus =
  [ `loading
  | `success
  | `error
  | `initialData
  ]

type ('queryData, 'queryResult) placeholderData =
  [ `data of 'queryData
  | `fn of unit -> 'queryResult option [@as "function"]
  ]

module QueryFilter = struct
  type 'queryKey t = {
    exact : bool option;
    type_ : [ `active | `inactive | `all ] option; [@as "type"]
    stale : bool option;
    fetching : bool option;
    predicate : (query -> bool) option;
    queryKey : 'queryKey option;
  }

  let make ?exact ?type_ ?stale ?fetching ?predicate ?queryKey () =
    { exact; type_; stale; fetching; predicate; queryKey }
  ;;
end

type 'queryKey queryDataKeyOrFilter =
  [ `keys of 'queryKey
  | `filters of 'queryKey QueryFilter.t
  ]

type refetchOptions = {
  throwOnError : bool;
  cancelRefetch : bool;
}
