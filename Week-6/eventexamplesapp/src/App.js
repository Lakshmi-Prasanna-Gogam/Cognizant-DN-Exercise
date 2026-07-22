import React from "react";

import Counter from "./components/Counter";
import Welcome from "./components/Welcome";
import SyntheticEvent from "./components/SyntheticEvent";
import CurrencyConvertor from "./components/CurrencyConvertor";

function App() {

  return (

    <div style={{padding:"20px"}}>

      <h1>Event Examples App</h1>

      <Counter />

      <hr />

      <Welcome />

      <hr />

      <SyntheticEvent />

      <hr />

      <CurrencyConvertor />

    </div>

  );

}

export default App;