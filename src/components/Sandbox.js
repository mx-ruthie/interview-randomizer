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
  let functionNameString;
  
  const formattedTestCases = testCases.map((testCase) => {
    let splitString = testCase.split("→");
    functionNameString = splitString[0].split("(")[0];
    console.log(functionNameString, "function name string");
    console.log("i'm splitstring[0]", splitString[0]);
    return `console.log(${splitString[0]}); //→ ${splitString[1]}`;
  });


  console.log(formattedTestCases, "formatted test cases");
  let text = `/*${question}*/ \n \nfunction ${functionNameString}() {\n} \n\n${formattedTestCases.join("\n")}`;

  let parameters = {
    files: {
      "index.js": {
        content: text,
      },
    },
  };
  const compressedParameters = compress(JSON.stringify(parameters));

  const url = `https://codesandbox.io/api/v1/sandboxes/define?parameters=${compressedParameters}`;

  const handleClick = () => {
    window.open(url, "_blank");
  };

  return (
    <button onClick={handleClick} className="submit-button" value="click for sandbox link">
      Click to Generate Sandbox
    </button>
  );
};


export default Sandbox;
