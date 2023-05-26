const SaveQuestion = ({questionId, participantId}) => {
    const markComplete = async (event) => {
        event.preventDefault(); 
        await fetch("/api/completequestion", {
          method: "POST",
          headers: {
            "content-type": "application/json",
          },
          body: JSON.stringify({questionId, participantId})
        })
        .then(response => response.json())
        .then(data => {
          console.log("Save question result", data);
        }) 
        .catch(error => console.log(error));
      }

return (    
    
    <button onClick={markComplete} className="submit-button" value="save question as complete">Step 3: Mark Complete to Save</button>

)}

export default SaveQuestion;