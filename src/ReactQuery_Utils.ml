let retry : 'error ReactQuery_Types.retryParam -> 'error ReactQuery_Types.retryValue =
  function
  | `bool value -> Obj.magic value
  | `number value -> Obj.magic value
  | `fn value -> Obj.magic value
;;

let retryDelay :
    'error ReactQuery_Types.retryDelayParam -> 'error ReactQuery_Types.retryDelayValue =
  function
  | `number value -> Obj.magic value
  | `fn value -> Obj.magic value
;;

let time : ReactQuery_Types.time -> ReactQuery_Types.timeValue = function
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
    'queryKey ReactQuery_Types.queryDataKeyOrFilter ->
    'queryKey ReactQuery_Types.queryDataKeyOrFilter = function
  | `keys value -> Obj.magic value
  | `filters value -> Obj.magic value
;;

let placeholderData :
    ('queryData, 'queryResult) ReactQuery_Types.placeholderData ->
    ReactQuery_Types.placeholderDataValue = function
  | `data data -> Obj.magic data
  | ((`fn value) [@as "function"]) -> Obj.magic value
;;

let refetchOnMount = boolOrAlways
let refetchOnWindowFocus = boolOrAlways
let refetchOnReconnect = boolOrAlways
