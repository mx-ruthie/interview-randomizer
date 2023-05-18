// import { toBeRequired } from "@testing-library/jest-dom/dist/matchers";
import { useState } from "react";

//thinking about database modeling, this is a many to many relationship and there will be a junction table between users and questions

const InterviewerForm = () => {
  // create state here and onSubmit (post)
  const [completeStatus, setCompleteStatus] = useState();

  console.log(completeStatus, "before return");
  return (
    <div>
      <form className="completed">
        {/* need to add value to inputs of true or false */}
        {/* Batching - if there's state that depends on another state Like in the onChange here, there may be a weird bug that happens when logging won't work until the Submit has occurred, event handlers and hooks weirdness */}
        <input
          type="radio"
          name="complete-status"
          value={true}
          checked={completeStatus === true}
          onChange={(e) => {
            setCompleteStatus(true);
            console.log(completeStatus);
          }}
        />{" "}
        Completed
        <input
          type="radio"
          name="complete-status"
          value={false}
          checked={completeStatus === false}
          onChange={(e) => setCompleteStatus(false)}
        />{" "}
        Did Not Complete
        <button type="submit">Update Participant Record</button>
      </form>
    </div>
  );
};

export default InterviewerForm;
