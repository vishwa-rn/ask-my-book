import React from "react";
import { useSelector } from "react-redux";

function AnswerDisplay() {
  const answer = useSelector((state) => state.answer);

  return (
    <div className="AnswerDisplay">
      {answer && (
        <>
          <h2>Answer:</h2>
          <p>{answer}</p>
        </>
      )}
    </div>
  );
}

export default AnswerDisplay;
