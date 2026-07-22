import React, { useState } from "react";
import Guest from "./Guest";
import User from "./User";

function App() {

    const [isLoggedIn, setIsLoggedIn] = useState(false);

    const login = () => {
        setIsLoggedIn(true);
    };

    const logout = () => {
        setIsLoggedIn(false);
    };

    let page;

    if (isLoggedIn) {
        page = <User />;
    } else {
        page = <Guest />;
    }

    return (
        <div style={{ textAlign: "center" }}>
            <h1>Ticket Booking App</h1>

            {
                isLoggedIn ?
                <button onClick={logout}>Logout</button>
                :
                <button onClick={login}>Login</button>
            }

            <hr />

            {page}
        </div>
    );
}

export default App;