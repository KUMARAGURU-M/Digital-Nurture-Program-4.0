import React from "react";
import "./App.css";
import officeImg from "./office.jpg"; // Put your office image in `src/`

function App() {
  const heading = "Office Space";

  const officeList = [
    { Name: "DBS", Rent: 50000, Address: "Chennai" },
    { Name: "WeWork", Rent: 70000, Address: "Bangalore" },
    { Name: "Regus", Rent: 45000, Address: "Hyderabad" },
    { Name: "SmartSpace", Rent: 80000, Address: "Mumbai" },
  ];

  return (
    <div className="App">
      <h1>{heading}, at Affordable Range</h1>

      {officeList.map((office, index) => {
        const rentClass = office.Rent <= 60000 ? "textRed" : "textGreen";

        return (
          <div key={index} className="office-card">
            <img
              src={officeImg}
              width="25%"
              height="25%"
              alt="Office Space"
            />
            <h2>Name: {office.Name}</h2>
            <h3 className={rentClass}>Rent: Rs. {office.Rent}</h3>
            <h3>Address: {office.Address}</h3>
            <hr />
          </div>
        );
      })}
    </div>
  );
}

export default App;
