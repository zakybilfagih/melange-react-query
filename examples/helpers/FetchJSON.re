type t = Js.Promise.t(Js.Json.t);

let fetch = (url): t => {
  Js.Promise.(
    Fetch.fetch(url)
    |> then_(res => {
         Fetch.Response.json(res)
         |> then_(payload =>
              if (Fetch.Response.ok(res)) {
                resolve(payload);
              } else {
                [|
                  Fetch.Response.status(res) |> string_of_int,
                  Fetch.Response.statusText(res),
                |]
                |> Js.Array.join(~sep=" ")
                |> Js.Exn.raiseError;
              }
            )
       })
  );
};

let fetchWithInit = (url, init): t => {
  Js.Promise.(
    Fetch.fetchWithInit(url, init)
    |> then_(res => {
         Fetch.Response.json(res)
         |> then_(payload =>
              if (Fetch.Response.ok(res)) {
                resolve(payload);
              } else {
                [|
                  Fetch.Response.status(res) |> string_of_int,
                  Fetch.Response.statusText(res),
                |]
                |> Js.Array.join(~sep=" ")
                |> Js.Exn.raiseError;
              }
            )
       })
  );
};

let decode = (~decoder: Js.Json.t => 'a, promise: t) => {
  Js.Promise.(promise |> then_(json => json |> decoder |> resolve));
};

let fetchAndDecode = (~decoder, url) => url |> fetch |> decode(~decoder);
let fetchWithInitAndDecode = (~decoder, url, init) =>
  fetchWithInit(url, init) |> decode(~decoder);
