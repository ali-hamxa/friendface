import React from "react";
import { Route, Routes } from "react-router-dom";

import PostPage from "./pages/postpage";

const App = () => {
  return (
    <div>
      <Routes>
        <Route path="/" element={<PostPage />} />
      </Routes>
    </div>
  );
};

export default App;
