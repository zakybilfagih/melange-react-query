# melange-react-query

Bindings to [@tanstack/react-query](https://tanstack.com/query/latest) for [Melange](https://melange.re/).

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
  let queryClient = ReactQuery.useQueryClient();
  let queryResult = queryClient.fetchQuery(
    ReactQuery.fetchQueryOptions(
      ~queryKey=[|"articles"|],
      ~retryOnMount=true,
      (),
    )
  );
```

### `useQuery`

```reason
  let queryResult = ReactQuery.useQuery(
    ReactQuery.queryOptions(
      ~queryKey=[|"articles"|],
      ~queryFn=fetchArticles,
      ()
    )
  );
```

### `useMutation`

The hook responsible to mutate a query, when update/create/delete anything

```reason
  let mutationResult = ReactQuery.useMutation(
    ReactQuery.mutationOptions(
      ~mutationKey=[|"articles"|],
      ~mutationFn=(article) => addArticle(article),
      ()
    )
  );
```
