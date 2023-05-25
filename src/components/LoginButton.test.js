import { render, screen } from '@testing-library/react';
import LoginButton from './LoginButton';

test('renders login button with "Log In"', () => {
  render(<LoginButton />);
  const buttonElement = screen.getByRole('button', { name: /Log In/i });
  expect(buttonElement).toBeInTheDocument();
});