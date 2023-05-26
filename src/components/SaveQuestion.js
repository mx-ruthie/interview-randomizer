import React, { useState } from "react";

const SaveQuestion = ({ questionId, participantId }) => {
  const [isButtonDisabled, setIsButtonDisabled] = useState(false);
  const [isButtonClicked, setIsButtonClicked] = useState(false);

  const markComplete = async (event) => {
    event.preventDefault();
    setIsButtonDisabled(true); 
    setIsButtonClicked(true); 

    await fetch("/api/completequestion", {
      method: "POST",
      headers: {
        "content-type": "application/json",
      },
      body: JSON.stringify({ questionId, participantId }),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log("Save question result", data);
      })
      .catch((error) => console.log(error));
  };

  const buttonClass = isButtonDisabled ? "submit-button-disable" : isButtonClicked ? "submit-button-clicked" : "submit-button";

  return (
    <button
      onClick={markComplete}
      className={buttonClass}
      value="save question as complete"
      disabled={isButtonDisabled} 
    >
      Step 3: Mark Complete to Save
    </button>
  );
};

export default SaveQuestion;
