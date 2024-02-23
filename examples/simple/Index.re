module App = {
  let client = ReactQuery.Client.Provider.createClient();

  [@react.component]
  let make = () =>
    <ReactQuery.Client.Provider client>
      <Articles />
    </ReactQuery.Client.Provider>;
};

let element = ReactDOM.querySelector("#root");
switch (element) {
| None => Js.Console.error("Failed to get root element")
| Some(el) =>
  let root = ReactDOM.Client.createRoot(el);
  ReactDOM.Client.render(root, <App />);
};
