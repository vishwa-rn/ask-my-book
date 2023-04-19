import React, { useState } from "react";
import axios from "axios";

function InputBox() {
  const [question, setQuestion] = useState("2+2");
  const [answer, setAnswer] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    axios.defaults.headers.common["X-CSRF-Token"] = csrfToken;

    const response = await axios.post("/api/questions", { question });
    // Update the answer in your state management
    console.log(response);
    setAnswer(response.data.answer);
  };

  return (
    <>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={question}
          onChange={(e) => setQuestion(e.target.value)}
        />
        <button type="submit">Submit</button>
      </form>
      <p>{answer}</p>
    </>
  );
}

export default InputBox;
