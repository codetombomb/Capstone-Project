import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { StateProvider } from './context';
import App from './App';
import Home from './routes/Home';
import HBNB from './routes/HBNB';
import Map from './routes/Map';
import SignUp from './routes/SignUp';
import SignIn from './routes/SignIn';
import Reservations from './routes/Reservations';

ReactDOM.createRoot(document.getElementById('root')).render(
  <StateProvider>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />}>
          <Route path="/routes/Home" element={<Home />} />
          <Route path="/routes/HBNB" element={<HBNB />} />
          <Route path="/routes/Map" element={<Map />} />
          <Route path="/routes/SignUp" element={<SignUp />} />
          <Route path="/routes/SignIn" element={<SignIn />} />
          <Route path="/routes/Reservations" element={<Reservations />} />
        </Route>
      </Routes>
    </BrowserRouter>
  </StateProvider>
);
