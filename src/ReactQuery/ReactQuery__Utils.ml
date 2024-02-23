let retry : 'error ReactQuery__Types.retryParam -> 'error ReactQuery__Types.retryValue =
  function
  | `bool value -> Obj.magic value
  | `number value -> Obj.magic value
  | `fn value -> Obj.magic value
;;

let retryDelay :
    'error ReactQuery__Types.retryDelayParam -> 'error ReactQuery__Types.retryDelayValue =
  function
  | `number value -> Obj.magic value
  | `fn value -> Obj.magic value
;;

let time : ReactQuery__Types.time -> ReactQuery__Types.timeValue = function
  | `number value -> Obj.magic value
  | `infinity -> Obj.magic infinity
;;

let refetchInterval = function
  | `bool value -> Obj.magic value
  | `number value -> Obj.magic value
;;

let boolOrAlways = function
  | `bool value -> Obj.magic value
  | `always -> Obj.magic `always
;;

let notifyOnChangeProps = function
  | `array value -> Obj.magic value
  | `tracked -> Obj.magic `tracked
;;

let setQueryData :
    'queryKey ReactQuery__Types.queryDataKeyOrFilter ->
    'queryKey ReactQuery__Types.queryDataKeyOrFilter = function
  | `keys value -> Obj.magic value
  | `filters value -> Obj.magic value
;;

let placeholderData :
    ('queryData, 'queryResult) ReactQuery__Types.placeholderData ->
    ReactQuery__Types.placeholderDataValue = function
  | `data data -> Obj.magic data
  | ((`fn value) [@as "function"]) -> Obj.magic value
;;

let refetchOnMount = boolOrAlways
let refetchOnWindowFocus = boolOrAlways
let refetchOnReconnect = boolOrAlways
let queryKey1 a : ReactQuery__Types.queryKeyValue = Obj.magic [| a |]
let queryKey2 a b : ReactQuery__Types.queryKeyValue = Obj.magic (a, b)
let queryKey3 a b c : ReactQuery__Types.queryKeyValue = Obj.magic (a, b, c)
let queryKey4 a b c d : ReactQuery__Types.queryKeyValue = Obj.magic (a, b, c, d)
