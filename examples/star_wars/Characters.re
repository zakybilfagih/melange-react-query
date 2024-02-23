let useCharacters = () => {
  ReactQuery.(
    Query.useQuery(
      Query.queryOptions(
        ~queryKey=Utils.queryKey1("characters"),
        ~queryFn=_ => Api.Characters.getAll(),
        ~staleTime=Utils.time(`infinity),
        (),
      ),
    )
  );
};

[@react.component]
let make = () => {
  open React;
  let charactersQuery = useCharacters();

  Js.log(charactersQuery.error);

  <>
    <h1> {string("Characters")} </h1>
    {switch (charactersQuery.status) {
     | `pending => <p> {string("Pending...")} </p>
     | `error => <p> {string("Error :(")} </p>
     | `success =>
       <ul>
         {switch (charactersQuery.data) {
          | None => string("No Characters found")
          | Some(characters) =>
            characters.results
            |> Js.Array.map(~f=({url, name, _}: Api.Character.t) => {
                 <li key=url> <p> {string(name)} </p> </li>
               })
            |> array
          }}
       </ul>
     }}
  </>;
};