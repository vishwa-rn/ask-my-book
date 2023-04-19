import React from "react";
import InputBox from "./InputBox";
import AnswerDisplay from "./AnswerDisplay";

function HomePage() {
  return (
    <div className="HomePage">
      <h1>Ask a Question</h1>
      <InputBox />
      <AnswerDisplay />
    </div>
  );
}

export default HomePage;
