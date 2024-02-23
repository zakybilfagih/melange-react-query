[@deriving json]
type post = {
  id: int,
  title: string,
  body: string,
};

[@deriving json]
type t = list(post);

let fetch = Helpers.FetchJSON.fetchAndDecode(~decoder=of_json);

let getPosts = () => fetch("https://jsonplaceholder.typicode.com/posts");

let usePosts = () =>
  ReactQuery.Query.(
    useQuery(
      queryOptions(
        ~queryKey=ReactQuery.Utils.queryKey1("posts"),
        ~queryFn=_ => getPosts(),
        (),
      ),
    )
  );

module PostPreview = {
  [@react.component]
  let make = (~title, ~id, ~onClick=?) => {
    let queryClient = ReactQuery.Client.useQueryClient();
    let visited =
      queryClient
      |> ReactQuery.Client.getQueryData(
           ReactQuery.Utils.queryKey2("post", id),
         )
      |> Option.is_some;

    let visitedStyles =
      visited
        ? ReactDOM.Style.make(~fontWeight="bold", ~color="green", ())
        : ReactDOM.Style.make();

    <p>
      <a
        ?onClick
        href="#"
        style={ReactDOM.Style.combine(
          ReactDOM.Style.make(~cursor="pointer", ()),
          visitedStyles,
        )}>
        title->React.string
      </a>
    </p>;
  };
};

[@react.component]
let make = () => {
  let postsQuery = usePosts();
  let (selectedPostId, setSelectedPostId) = React.useState(_ => None);

  switch (selectedPostId) {
  | None =>
    <div>
      <h1> "Posts"->React.string </h1>
      {switch (postsQuery.status) {
       | `pending => <p> "Loading..."->React.string </p>
       | `error =>
         <span>
           {{
              "Error: " ++ Js.Null.getUnsafe(postsQuery.error)##message;
            }
            ->React.string}
         </span>
       | `success =>
         <>
           <div>
             {switch (postsQuery.data) {
              | Some(posts) =>
                posts
                |> List.map(post => {
                     <PostPreview
                       key={post.id |> string_of_int}
                       id={post.id}
                       title={post.title}
                       onClick={_ => setSelectedPostId(_ => Some(post.id))}
                     />
                   })
                |> Array.of_list
                |> React.array
              | None => React.null
              }}
           </div>
           <div>
             {postsQuery.isFetching ? "Background Updating..." : ""}
             ->React.string
           </div>
         </>
       }}
    </div>
  | Some(id) =>
    <div>
      <button type_="button" onClick={_ => setSelectedPostId(_ => None)}>
        "Back"->React.string
      </button>
      <Post id />
    </div>
  };
};
