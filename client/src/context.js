import { useState, createContext } from 'react';
// import { Container, Card, Col, Row, Button } from 'react-bootstrap';
// import { v4 as uuid } from 'uuid';

const StateContext = createContext();

function StateProvider({ children }) {
  const [search, setSearch] = useState('');
  const [currentGuest, setCurrentGuest] = useState(null);

  // functions

  return (
    <StateContext.Provider
      value={{
        search,
        setSearch,
        currentGuest,
        setCurrentGuest,
      }}
    >
      {children}
    </StateContext.Provider>
  );
}

export { StateContext, StateProvider };
