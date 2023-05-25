import { render, screen } from '@testing-library/react';
import QuestionDetailsDisplay from './QuestionDetailsDisplay';

test('renders question and test cases', () => {
  const question = 'What is the answer?';
  const testCases = ['TestCase 1', 'TestCase 2', 'TestCase 3'];

  render(<QuestionDetailsDisplay question={question} testCases={testCases} />);

  const questionElement = screen.getByText(/What is the answer\?/i);
  expect(questionElement).toBeInTheDocument();

  const testCaseElements = screen.getAllByRole('listitem');
  expect(testCaseElements).toHaveLength(3);
  expect(testCaseElements[0]).toHaveTextContent('TestCase 1');
  expect(testCaseElements[1]).toHaveTextContent('TestCase 2');
  expect(testCaseElements[2]).toHaveTextContent('TestCase 3');
});