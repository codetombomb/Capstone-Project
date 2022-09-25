import React, { useEffect, useContext } from 'react';
import { StateContext } from './context';
import { NavLink, Outlet, useNavigate } from 'react-router-dom';
import { Navbar, Container } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

export default function App() {
  const { search, setSearch, currentGuest, setCurrentGuest } =
    useContext(StateContext);
  const navigate = useNavigate();

  useEffect(() => {
    if (window.location.pathname === '/') {
      navigate('/routes/Home');
    }
  }, []);

  return (
    <div>
      <h1>App Page</h1>

      <Navbar bg="dark" expand="sm-md-lg" className="sticky-top">
        <Container>
          <NavLink to="/routes/Home">Home</NavLink>
          <NavLink to="/routes/HBNB">HBNB</NavLink>
          <NavLink to="/routes/Map">Map</NavLink>
          {currentGuest !== null ? null : (
            <NavLink to="/routes/SignUp">Sign Up</NavLink>
          )}
          {currentGuest !== null ? null : (
            <NavLink to="/routes/SignIn">Sign In</NavLink>
          )}
          {currentGuest === null ? null : (
            <NavLink to="/routes/Reservations">Reservations</NavLink>
          )}
          &nbsp;
          <input
            style={{
              borderRadius: '5px',
            }}
            type="text"
            placeholder=" Search..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
        </Container>
      </Navbar>

      <Outlet />
    </div>
  );
}
