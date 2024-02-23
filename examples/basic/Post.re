[@deriving json]
type t = {
  id: int,
  title: string,
  body: string,
};

let fetch = Helpers.FetchJSON.fetchAndDecode(~decoder=of_json);

let getPost = id => {
  let id = id |> string_of_int;
  fetch({j|https://jsonplaceholder.typicode.com/posts/$id|j});
};

let usePost = id =>
  ReactQuery.Query.(
    useQuery(
      queryOptions(
        ~queryKey=ReactQuery.Utils.queryKey2("post", id),
        ~queryFn=_ => getPost(id),
        (),
      ),
    )
  );

[@react.component]
let make = (~id) => {
  let postQuery = usePost(id);

  switch (postQuery.status) {
  | `pending => <p> "Loading..."->React.string </p>
  | `error =>
    <span>
      {React.string("Error: " ++ Js.Null.getUnsafe(postQuery.error))}
    </span>
  | `success =>
    switch (postQuery.data) {
    | None => React.null
    | Some(post) =>
      <main>
        <h1> post.title->React.string </h1>
        <p> post.body->React.string </p>
        <div>
          {postQuery.isFetching ? "Background Updating..." : ""}->React.string
        </div>
      </main>
    }
  };
};
