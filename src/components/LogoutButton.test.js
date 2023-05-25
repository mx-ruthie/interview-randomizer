import { render, screen } from '@testing-library/react';
import LogoutButton from './LogoutButton';

test('renders logout button with "Log Out"', () => {
  render(<LogoutButton />);
  const buttonElement = screen.getByRole('button', { name: /Log Out/i });
  expect(buttonElement).toBeInTheDocument();
});