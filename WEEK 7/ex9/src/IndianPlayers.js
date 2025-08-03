import React from "react";

export function OddPlayers([first, , third, , fifth]) {
  return (
    <div>
      <li>First: {first}</li>
      <li>Third: {third}</li>
      <li>Fifth: {fifth}</li>
    </div>
  );
}

export function EvenPlayers([, second, , fourth, , sixth]) {
  return (
    <div>
      <li>Second: {second}</li>
      <li>Fourth: {fourth}</li>
      <li>Sixth: {sixth}</li>
    </div>
  );
}

export function ListofIndianPlayers({ IndianPlayers }) {
  return (
    <ul>
      {IndianPlayers.map((player, idx) => (
        <li key={idx}>{player}</li>
      ))}
    </ul>
  );
}
