
import React from "react";

function ListofPlayers({ players }) {
  return (
    <ul>
      {players.map((item, idx) => (
        <li key={idx}>
          Mr. {item.name} <span>{item.score}</span>
        </li>
      ))}
    </ul>
  );
}

export function Scorebelow70({ players }) {
  const players70 = [];
  players.forEach((item) => {
    if (item.score <= 70) {
      players70.push(item);
    }
  });

  return (
    <ul>
      {players70.map((p, idx) => (
        <li key={idx}>
          Mr. {p.name} <span>{p.score}</span>
        </li>
      ))}
    </ul>
  );
}

export default ListofPlayers;
