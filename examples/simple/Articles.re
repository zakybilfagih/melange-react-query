[@deriving json]
type t = {
  name: string,
  description: string,
  subscribers_count: int,
  stargazers_count: int,
  forks_count: int,
};

let fetch = Helpers.FetchJSON.fetchAndDecode(~decoder=of_json);

let getRepoData = () => {
  fetch("https://api.github.com/repos/melange-re/melange");
};

[@react.component]
let make = () => {
  let repoDataQuery = {
    ReactQuery.Query.(
      useQuery(
        queryOptions(
          ~queryKey=ReactQuery.Utils.queryKey1("repoData"),
          ~queryFn=_ => getRepoData(),
          (),
        ),
      )
    );
  };

  switch (repoDataQuery.status) {
  | `pending => React.string("Loading...")
  | `error =>
    "'An error has occurred: "
    ++ Js.Null.getUnsafe(repoDataQuery.error)
    |> React.string
  | `success =>
    switch (repoDataQuery.data) {
    | None => React.null
    | Some(repoData) =>
      <div>
        <h1> repoData.name->React.string </h1>
        <p> repoData.description->React.string </p>
        <strong>
          {({js| 👀 |js} ++ (repoData.subscribers_count |> Js.Int.toString))
           ->React.string}
        </strong>
        <strong>
          {({js| ✨ |js} ++ (repoData.stargazers_count |> Js.Int.toString))
           ->React.string}
        </strong>
        <strong>
          {({js| 🍴 |js} ++ (repoData.forks_count |> Js.Int.toString))
           ->React.string}
        </strong>
        <div>
          {repoDataQuery.isFetching ? "Upadting..." : ""}->React.string
        </div>
      </div>
    }
  };
};
