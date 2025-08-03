// src/CurrencyConvertor.js
import React, { useState } from 'react';

function CurrencyConvertor() {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('Euro');

  const handleSubmit = (e) => {
    e.preventDefault();

    let convertedAmount = 0;

    if (currency === 'Euro') {
      convertedAmount = parseFloat(amount) * 80;
    }

    alert(`Converting to ${currency} Amount is ${convertedAmount}`);
  };

  return (
    <div>
      <h2 style={{ color: 'green' }}>Currency Convertor!!!</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Amount:
          <input
            type="number"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
          />
        </label>
        <br /><br />
        <label>
          Currency:
          <select
            value={currency}
            onChange={(e) => setCurrency(e.target.value)}
          >
            <option value="Euro">Euro</option>
          </select>
        </label>
        <br /><br />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default CurrencyConvertor;
