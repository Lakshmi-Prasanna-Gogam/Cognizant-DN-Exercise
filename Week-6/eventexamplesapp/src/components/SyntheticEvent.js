import React from "react";

function SyntheticEvent() {

  function handleClick(e) {

    e.preventDefault();

    alert("I was clicked");

  }

  return (

    <div>

      <h2>Synthetic Event Example</h2>

      <button onClick={handleClick}>

        OnPress

      </button>

    </div>

  );

}

export default SyntheticEvent;