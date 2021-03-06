import React from "react";
import { Route, IndexRoute, Router, browserHistory } from "react-router";

import HousesContainer from "../containers/HousesContainer";
import HouseChoresContainer from "../containers/HouseChoresContainer";
import ChoreContainer from "../containers/ChoreContainer";

export const App = props => {
  return (
    <Router history={browserHistory}>
      <Route path="/houses" component={HousesContainer} />
      <Route path="/houses/:id" component={HouseChoresContainer} />
      <Route path="/chores/:id" component={ChoreContainer} />
    </Router>
  );
};

export default App;
