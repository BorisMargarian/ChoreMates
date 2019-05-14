import React, { Component } from "react"
import { Route, IndexRoute, Router, browserHistory } from "react-router";
import ChoreTile from "../components/ChoreTile"

class ChoreContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      chore: {},
      current_user: null
    }
  }

  componentDidMount() {
    let choreId = this.props.routeParams.id
    fetch(`/api/v1/chores/${choreId}`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}(${response.statusText})`,
          error = new Error(errorMessage);
        throw error;
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        chore: body.chore,
        current_user: body.current_user
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let url
    if (this.state.chore.chore_photo) {
      url = this.state.chore.chore_photo.url
    }
    return (
      <div className="chore-header">
        <ChoreTile
          id={this.state.chore.id}
          name={this.state.chore.name}
          description={this.state.chore.description}
          due={this.state.chore.due}
          cost={this.state.chore.cost}
          status={this.state.chore.status}
          image={url}
        />
      </div>
    )
  }
}

export default ChoreContainer
