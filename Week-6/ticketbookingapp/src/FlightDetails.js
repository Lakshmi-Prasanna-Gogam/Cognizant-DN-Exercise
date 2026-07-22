import React from "react";

function FlightDetails() {
    return (
        <div>
            <h2>Flight Details</h2>

            <table border="1" cellPadding="10">
                <thead>
                    <tr>
                        <th>Flight No</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Time</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>AI101</td>
                        <td>Hyderabad</td>
                        <td>Delhi</td>
                        <td>08:00 AM</td>
                    </tr>

                    <tr>
                        <td>AI202</td>
                        <td>Chennai</td>
                        <td>Mumbai</td>
                        <td>11:30 AM</td>
                    </tr>

                    <tr>
                        <td>AI303</td>
                        <td>Bangalore</td>
                        <td>Kolkata</td>
                        <td>05:15 PM</td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
}

export default FlightDetails;