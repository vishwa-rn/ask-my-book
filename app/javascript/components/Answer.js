import React, { useState, useEffect } from "react";

const Answer = ({ text }) => {
  const [displayedText, setDisplayedText] = useState("");

  useEffect(() => {
    let index = 0;
    const interval = setInterval(() => {
      if (index < text.length) {
        setDisplayedText((prevText) => prevText + text[index]);
        index++;
      } else {
        clearInterval(interval);
      }
    }, 40);

    return () => clearInterval(interval);
  }, [text]);

  return (
    <p className="w-full max-w-3xl text-left text-white text-lg mt-4">
      {displayedText}
    </p>
  );
};

export default Answer;
