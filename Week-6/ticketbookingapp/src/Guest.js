import React from "react";
import FlightDetails from "./FlightDetails";

function Guest() {
    return (
        <div>
            <h1>Welcome Guest</h1>
            <p>You can browse flight details.</p>

            <FlightDetails />

            <h3>Please Login to Book Tickets.</h3>
        </div>
    );
}

export default Guest;