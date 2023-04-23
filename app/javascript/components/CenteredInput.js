import React from "react";

const CenteredInput = ({ value, onChange }) => (
  <textarea
    value={value}
    onChange={onChange}
    className="block w-full max-w-2xl mx-auto my-2 text-lg p-2 text-white bg-gray-700 border border-gray-600 rounded-md shadow-inner focus:outline-none focus:border-gray-500 xs:mx-4 sm:mx-4"
    placeholder="What is Origin of species about?"
    rows="2"
  />
);

export default CenteredInput;
