import React from 'react';
import './App.css';

function App() {
  // Heading element
  const heading = <h1>Office Space Rental App</h1>;

  // Office data
  const offices = [
    {
      name: "Premium Tech Park",
      rent: 75000,
      address: "MG Road, Bangalore",
      image: "https://via.placeholder.com/300x200?text=Office+1"
    },
    {
      name: "Startup Hub",
      rent: 50000,
      address: "Kharadi, Pune",
      image: "https://via.placeholder.com/300x200?text=Office+2"
    },
    {
      name: "Downtown Workspace",
      rent: 62000,
      address: "Gachibowli, Hyderabad",
      image: "https://via.placeholder.com/300x200?text=Office+3"
    }
  ];

  return (
    <div className="App">
      {heading}
      <div className="office-list">
        {offices.map((office, index) => (
          <div key={index} className="office-card">
            <img src={office.image} alt={office.name} className="office-image" />
            <h2>{office.name}</h2>
            <p><strong>Address:</strong> {office.address}</p>
            <p
              className="office-rent"
              style={{ color: office.rent > 60000 ? 'green' : 'red' }}
            >
              <strong>Rent:</strong> ₹{office.rent}
            </p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;