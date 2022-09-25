import React, { useEffect, useContext } from 'react';
import { StateContext } from '../context';

export default function Hbnb() {
  const { setHBNBs } = useContext(StateContext);

  useEffect(() => {
    fetch(`/haunted_bnbs/${id}`)
      .then((r) => r.json())
      .then((d) => {
        setHBNBs(d);
      });
  }, []);

  return (
    <div>
      <h1>HBNB Page</h1>
    </div>
  );
}
