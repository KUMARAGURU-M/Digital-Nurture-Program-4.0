// src/App.js
import React, { useState } from 'react';
import './App.css';
import CurrencyConvertor from './CurrencyConvertor';

function App() {
  const [counter, setCounter] = useState(1);

  const handleIncrement = () => {
    incrementValue();
    sayHello();
  };

  const incrementValue = () => {
    setCounter(prev => prev + 1);
  };

  const sayHello = () => {
    alert("Hello! This is a static message.");
  };

  const handleDecrement = () => {
    setCounter(prev => prev - 1);
  };

  const sayWelcome = (msg) => {
    alert(msg);
  };

  const handleClick = () => {
    alert("I was clicked");
  };

  return (
    <div className="App">
      <p>{counter}</p>
      <button onClick={handleIncrement}>Increment</button><br />
      <button onClick={handleDecrement}>Decrement</button><br />
      <button onClick={() => sayWelcome("Welcome!")}>Say welcome</button><br />
      <button onClick={handleClick}>Click on me</button><br /><br />

      <CurrencyConvertor />
    </div>
  );
}

export default App;
