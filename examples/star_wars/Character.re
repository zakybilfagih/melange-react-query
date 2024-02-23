let useCharacters = id => {
  ReactQuery.(
    Query.useQuery(
      Query.queryOptions(
        ~queryKey=Utils.queryKey2("characters", id),
        ~queryFn=_ => Api.Character.getById(id),
        (),
      ),
    )
  );
};

[@react.component]
let make = (~id) => {
  open React;
  let characterQuery = useCharacters(id);

  switch (characterQuery.status) {
  | `pending => <p> {string("Pending...")} </p>
  | `error => <p> {string("Error :(")} </p>
  | `success =>
    switch (characterQuery.data) {
    | None => string("Character not found")
    | Some({name, _}) => <> <h1> {string(name)} </h1> </>
    }
  };
};
