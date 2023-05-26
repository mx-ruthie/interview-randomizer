import React, { useState, useEffect } from "react";

const ShowSaved = ({participantId}) => {
  const [savedEntries, setSavedEntries] = useState([]);

  useEffect(() => {
    fetchSavedEntries();
  }, []);

  const fetchSavedEntries = async () => {
    try {
        console.log("this is the participant id",participantId)
      const response = await fetch(`/api/savedquestions/${participantId}`);
      const data = await response.json();
      setSavedEntries(data.questions);
      console.log("this is logged data",data); //is the currently logged in person always at pos 0?
    } catch (error) {
      console.log(error);
    }
  };

  return ( 
    <div className="show-saved">
      <h1>Show Saved Entries</h1>
      {savedEntries.map((entry) => (
        <div key={entry.id}>
          <h3>Question: {entry.text}</h3>
          <h4>Test Cases:</h4>
        </div>
      ))}
    </div>
  );
};

export default ShowSaved;
