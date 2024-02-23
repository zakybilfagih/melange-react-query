[@deriving json]
type t = {
  count: int,
  next: option(string),
  previous: option(string),
  results: array(Character.t),
};

let getAll = () => {
  let fetch = Helpers.FetchJSON.fetchAndDecode(~decoder=of_json);
  fetch("https://swapi.dev/api/people/");
};
