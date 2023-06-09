import React from "react";
import ReactDOM from "react-dom";
import { Provider } from "react-redux";
import store from "../src/store";
import App from "../components/App";
import "../styles/application.css";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(
    <Provider store={store}>
      <App />
    </Provider>,
    document.getElementById("app")
  );
});
