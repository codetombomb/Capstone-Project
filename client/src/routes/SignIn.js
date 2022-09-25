import React, { useContext } from 'react';
import { StateContext } from '../context';

export default function SignIn() {
  const { username, setUsername, password, setPassword, setCurrentUser } =
    useContext(StateContext);

  function handleSignIn(e) {
    e.preventDefault();
    fetch('/signin', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        username: username,
        password: password,
      }),
    }).then((r) => {
      if (r.ok) {
        r.json().then((user) => {
          setCurrentUser(user);
          history.push(`/users/${user.id}`);
        });
      } else {
        r.json().then((data) => setErrors(Object.entries(data.errors)));
      }
    });
  }

  return (
    <form onSubmit={handleSignIn}>
      <input
        type="text"
        id="username"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />
      <input
        type="password"
        id="password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />
      <button type="submit">Sign In</button>
    </form>
  );
}
