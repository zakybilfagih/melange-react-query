# melange-react-query

Bindings to react-query for [Melange](https://melange.re/).

[![Issues](https://img.shields.io/github/issues/ewert-online/melange-react-query.svg)](https://github.com/ewert-online/melange-react-query/issues)
[![Last Commit](https://img.shields.io/github/last-commit/ewert-online/melange-react-query.svg)]()

## Example

```reason
Js.Promise.(
  Fetch.fetch("/api/hellos/1")
  |> then_(Fetch.Response.text)
  |> then_(text => print_endline(text) |> resolve)
);
```

## Installation

```sh
opam install melange-react-query
```

Then add `melange-react-query` to the `libraries` field in your dune file:

```lisp
(melange.emit ;; or (library ...)
 ...
 (libraries melange-react-query))
```

## Usage

### `Provider.createClient()`

The function responsible to create the query client

Usage:

```reason
  let client = Provider.createClient();
```

### `Provider.make()`

The React Context Provider responsible to hold all the react-query context

```reason
  <Provider client> children </Provider>
```

### `DevTools.make(...)`

The React Query DevTools Provider, which is responsible to initialize the React Query devtools

```reason
  <DevTools initialIsOpen={true} />
```

### `useQueryClient()`

The queryClient fetched from a hook

```reason
  let queryClient = useQueryClient();
  queryClient.fetchQuery({
    queryKey: [|"articles"|],
    retryOnMount: true
  });
```

### `useQuery`

```reason
  let queryResult = useQuery({
    queryKey: [|"articles"|],
    queryFn: () => fetchArticles()
  });
```

### `useMutation`

The hook responsible to mutate a query, when update/create/delete anything

```reason
  let mutationResult = useMutation({
    mutationKey: [|"articles"|],
    mutationFn: () => addArticle(article)
  });
```
