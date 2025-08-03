const flights = [
  { id: 1, airline: 'Indigo', from: 'Delhi', to: 'Mumbai' },
  { id: 2, airline: 'Air India', from: 'Chennai', to: 'Bangalore' },
  { id: 3, airline: 'SpiceJet', from: 'Kolkata', to: 'Hyderabad' }
];

function FlightDetails({ allowBooking = false, onBook }) {
  return (
    <div>
      <h3>Available Flights</h3>
      <ul>
        {flights.map((flight) => (
          <li key={flight.id}>
             {flight.airline} – {flight.from} to {flight.to}
            {allowBooking && (
              <button
                onClick={() => onBook(flight.airline)}
                style={{ marginLeft: '10px' }}
              >
                Book
              </button>
            )}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default FlightDetails;
