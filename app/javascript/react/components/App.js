import React from "react";
import { Route, IndexRoute, Router, browserHistory } from "react-router";

import HousesContainer from "../containers/HousesContainer";

export const App = props => {
  return (
    <Router history={browserHistory}>
      <Route path="/houses" component={HousesContainer} />
    </Router>
  );
};

export default App;
