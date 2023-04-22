import React from "react";

const SubmitButton = ({ onClick }) => (
  <button
    onClick={onClick}
    className="w-1/2 md:w-1/4 lg:w-1/5 xl:w-1/5 text-lg bg-white text-gray-900 py-2 px-4 mt-4 rounded-md shadow-md hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-500"
  >
    Ask question
  </button>
);

export default SubmitButton;
