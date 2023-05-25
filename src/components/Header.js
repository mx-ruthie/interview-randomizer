import React from "react";
import logo from "../assets/logo.png";
import LoginButton from "./LoginButton";
import LogoutButton from "./LogoutButton";
import { useAuth0 } from "@auth0/auth0-react";
import Profile from "./Profile";
function Header() {
  const { isAuthenticated } = useAuth0();
  return (
    <>
    <header className="header">
      <img src={logo} alt="Logo" className="logo" />
    </header>
    <header className="App-header">
      {isAuthenticated ? null : <LoginButton />}
      {!isAuthenticated ? null : <LogoutButton />}
      {isAuthenticated ? null : (
        <>
          <h2>Techtonica Mock Interview Question Randomizer </h2>
          <h3>Log in to generate a code challenge.</h3>
        </>
      )}
      <Profile />
    </header>
  </>);
}

export default Header;
