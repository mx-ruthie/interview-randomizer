/**
 * This component takes in a question and test cases and creates a sandbox https://codesandbox.io/docs/learn/sandboxes/cli-api#define-api
 */

import LZString from "lz-string";

function compress(string) {
  return LZString.compressToBase64(string)
    .replace(/\+/g, `-`) // Convert '+' to '-'
    .replace(/\//g, `_`) // Convert '/' to '_'
    .replace(/=+$/, ``); // Remove ending '='
}

const Sandbox = ({ question, testCases }) => {
  const formattedTestCases = testCases.map((testCase) => {
    let splitString = testCase.split("→");
    return `console.log(${splitString[0]}); //→ ${splitString[1]}`;
  });

  console.log(formattedTestCases, "formatted test cases");
  let text = `/*${question}*/ \n${formattedTestCases.join("\n")}`;

  let parameters = {
    files: {
      "index.js": {
        content: text,
      },
    },
  };
  const compressedParameters = compress(JSON.stringify(parameters));

  const url = `https://codesandbox.io/api/v1/sandboxes/define?parameters=${compressedParameters}`;

  return (
    <a href={url} target="_blank" rel="noopener noreferrer">
      Click here for sandbox
    </a>
  );
};


export default Sandbox;
