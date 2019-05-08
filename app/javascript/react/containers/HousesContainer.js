import React, { Component } from "react"
import { Route, IndexRoute, Router, browserHistory } from "react-router";

class HousesContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {}
  }

  componentDidMount(){
    fetch(`/api/v1/houses`)
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
        attraction: body.attractions,
        reviews: body.attractions.reviews,
        currentUser: body.user
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    debugger
    return (
      <div>
        <p>House component</p>
      </div>
    )
  }
}

export default HousesContainer
