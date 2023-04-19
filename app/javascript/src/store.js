import { createStore } from "redux";

const initialState = {
  answer: null,
};

const rootReducer = (state = initialState, action) => {
  switch (action.type) {
    case "SET_ANSWER":
      return { ...state, answer: action.answer };
    default:
      return state;
  }
};

const store = createStore(rootReducer);

export default store;
