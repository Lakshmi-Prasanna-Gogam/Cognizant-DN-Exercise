import React from "react";
import officeImage from "./Images/office.jpg";

function App() {

  const offices = [
    {
      id: 1,
      name: "Sky Tower",
      rent: 55000,
      address: "Hyderabad"
    },
    {
      id: 2,
      name: "Tech Park",
      rent: 75000,
      address: "Bangalore"
    },
    {
      id: 3,
      name: "Business Hub",
      rent: 45000,
      address: "Chennai"
    },
    {
      id: 4,
      name: "Cyber Plaza",
      rent: 90000,
      address: "Pune"
    }
  ];

  return (

    <div style={{padding:"20px"}}>
      <h1>Office Space Rental App</h1>
      <img src={officeImage} alt="Office" width="500" height="300"/>
      <h2>Available Office Spaces</h2>
      {
        offices.map((office)=>(
          <div key={office.id} style={{ border:"1px solid gray", padding:"15px", margin:"15px" }} >
            <h3>{office.name}</h3>
            <p>
              <b>Address :</b> {office.address}
            </p>
            <p>
              <b>Rent :</b>
              <span style={{ color: office.rent < 60000 ? "red" : "green" }} >
                ₹{office.rent}
              </span>
            </p>
          </div>
        ))
      }
    </div>
  );
}
export default App;