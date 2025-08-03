import { useState } from 'react';
import Greeting from './Greeting';
import FlightDetails from './FlightDetails';
import './App.css';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = () => setIsLoggedIn(true);
  const handleLogout = () => setIsLoggedIn(false);

  return (
    <div className="App">
      <header>
        <h1>Ticket Booking App</h1>
        {isLoggedIn ? (
          <button onClick={handleLogout}>Logout</button>
        ) : (
          <button onClick={handleLogin}>Login</button>
        )}
      </header>

      <Greeting isLoggedIn={isLoggedIn} />

      <FlightDetails
        allowBooking={isLoggedIn}
        onBook={(flight) =>
          alert(`Ticket booked for flight: ${flight}`)
        }
      />
    </div>
  );
}

export default App;
