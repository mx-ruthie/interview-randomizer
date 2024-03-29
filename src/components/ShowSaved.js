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
    } catch (error) {
      console.log(error);
    }
  };

  return ( 
    <div className="show-saved">
        
      <h1>Completed Questions</h1>
      {savedEntries.map((entry) => (
        <div key={entry.id}>
          <ul className="show-saved-ul">{entry.text}</ul>
        </div>
      ))}
    </div>
  );
};

export default ShowSaved;
