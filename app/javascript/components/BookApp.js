import React, { useState } from "react";
import CenteredInput from "./CenteredInput";
import SubmitButton from "./SubmitButton";
import Answer from "./Answer";
import bookThumbnail from "../images/origin-of-species.jpeg";

const BookApp = () => {
  const [inputValue, setInputValue] = useState("");
  const [answer, setAnswer] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  };

  const handleSubmit = async () => {
    setIsLoading(true);
    setAnswer("");

    // Change the API endpoint to match the Rails controller
    const response = await fetch("/api/questions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify({ question: inputValue }),
    });

    const data = await response.json();
    setAnswer(data.answer);
    setIsLoading(false);
  };

  return (
    <div className="bg-gray-900 min-h-screen flex flex-col items-center justify-center">
      <img
        src={bookThumbnail}
        alt="Book Thumbnail"
        className="w-48 h-64 mx-auto mt-12 mb-6"
      />
      {/* Add the book name and text */}
      <h1 className="text-2xl text-center text-white font-bold mb-2">
        Origin of species
      </h1>
      <p className="text-lg text-center text-white px-4 mb-6">
        This is an experiment in using AI to make the book's content more
        accessible. <br /> Ask a question and AI'll answer it in real-time:
      </p>
      <CenteredInput value={inputValue} onChange={handleInputChange} />
      <SubmitButton onClick={handleSubmit} />
      {isLoading ? (
        <p className="text-white text-lg mt-4">Loading...</p>
      ) : (
        <Answer text={answer} />
      )}{" "}
    </div>
  );
};

export default BookApp;
