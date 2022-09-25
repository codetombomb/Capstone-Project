import React, { useContext } from 'react';
import { StateContext } from '../context';

export default function Reservations() {
  const { checkIn, setCheckIn, checkOut, setCheckOut, reservation } =
    useContext(StateContext);

  function handleReservation() {
    fetch('/reservations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        checkIn,
        checkOut,
      }),
    })
      .then((r) => r.json())
      .then((d) => {
        reservation(d);
      });
  }

  return (
    <div>
      <h1>Reservations Page</h1>
      <form onSubmit={handleReservation}>
        <input
          type="date"
          id="checkin"
          value={checkIn}
          onChange={(e) => setCheckIn(e.target.value)}
        />
        <input
          type="date"
          id="checkout"
          value={checkOut}
          onChange={(e) => setCheckOut(e.target.value)}
        />
        <Button type="submit">Book</Button>
      </form>
    </div>
  );
}
