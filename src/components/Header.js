import React from "react";
import logo from "../assets/logo.png";
import LoginButton from "./LoginButton";
import LogoutButton from "./LogoutButton";
import { useAuth0 } from "@auth0/auth0-react";
function Header() {
  const { isAuthenticated } = useAuth0();
  return (
    <>
      <header className="App-header">
        <header className="header">
          <img src={logo} alt="Logo" className="logo" />
        </header>
        <div className="auth-buttons">
          {isAuthenticated ? null : <LoginButton />}
          {!isAuthenticated ? null : <LogoutButton />}
        </div>
      </header>
    </>
  );
}

export default Header;
