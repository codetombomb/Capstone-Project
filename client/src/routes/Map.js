import React, { useEffect, useContext } from 'react';
import { StateContext } from '../context';

export default function Map() {
  const { setHBNBs } = useContext(StateContext);

  useEffect(() => {
    fetch('/haunted_bnbs')
      .then((r) => r.json())
      .then((d) => {
        setHBNBs(d);
      });
  }, []);

  function findHBNB() {
    fetch(`/haunted_bnbs/${id}`)
      .then((r) => r.json())
      .then((d) => {
        setHBNBs(d);
      });
  }

  return (
    <div>
      <h1>Map Page</h1>
      <Button onClick={findHBNB}>Find HBNB</Button>
    </div>
  );
}
