module Date = {
  type t = Js.Date.t;

  let to_json = date => date |> Js.Date.toString |> string_to_json;

  let of_json = json => json |> string_of_json |> Js.Date.fromString;
};

module Gender = {
  type t =
    | Male
    | Female
    | Other;

  let to_string =
    fun
    | Male => "male"
    | Female => "female"
    | Other => "n/a";

  let of_string =
    fun
    | "male" => Male
    | "female" => Female
    | _ => Other;

  let to_json = t => t |> to_string |> string_to_json;

  let of_json = json => json |> string_of_json |> of_string;
};

[@deriving json]
type t = {
  name: string,
  height: string,
  mass: string,
  hair_color: string,
  skin_color: string,
  eye_color: string,
  birth_year: string,
  gender: Gender.t,
  homeworld: string,
  films: array(string),
  species: array(string),
  vehicles: array(string),
  starships: array(string),
  created: Date.t,
  edited: Date.t,
  url: string,
};

let getById = id => {
  let fetch = Helpers.FetchJSON.fetchAndDecode(~decoder=of_json);
  fetch({j|https://swapi.dev/api/people/$id/|j});
};
