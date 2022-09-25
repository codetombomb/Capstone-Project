import React, { useEffect, useContext } from 'react';
import { StateContext } from '../context';

export default function Home() {
  const { setHBNBs } = useContext(StateContext);

  useEffect(() => {
    fetch('/haunted_bnbs')
      .then((r) => r.json())
      .then((d) => {
        setHBNBs(d);
      });
  }, []);

  return (
    <div>
      <h1>Home Page</h1>
    </div>
  );
}
