import React from "react";
import { render, screen } from "@testing-library/react";
import Header from "./Header";

jest.mock("@auth0/auth0-react", () => ({
  useAuth0: () => ({ isAuthenticated: false }),
}));

describe("Header", () => {
  test("renders logo", () => {
    render(<Header />);
    const logoElement = screen.getByAltText("Logo");
    expect(logoElement).toBeInTheDocument();
  });

  test("renders LoginButton when not authenticated", () => {
    render(<Header />);
    const loginButtonElement = screen.getByRole("button", { name: "Log In" });
    expect(loginButtonElement).toBeInTheDocument();
  });
});

