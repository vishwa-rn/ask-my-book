import React from "react";
import HomePage from "./HomePage";
import "bootstrap/dist/css/bootstrap.min.css";
import SampleComponent from "./SampleComponent";

function App() {
  console.log("hello");
  return (
    <div className="App">
      {/* <HomePage /> */}
      <SampleComponent />
    </div>
  );
}

export default App;
