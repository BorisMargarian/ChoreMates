import React, { Component } from "react"
import { Route, IndexRoute, Router, browserHistory } from "react-router";
import HouseTile from "../components/HouseTile"

class HousesContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      houses: [],
      current_user: null
    }
    this.handleJoinHouse = this.handleJoinHouse.bind(this)
  }
  handleJoinHouse(event) {
    event.preventDefault()
    debugger
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
        houses: body.houses,
        current_user: body.current_user
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let houses = this.state.houses.map(house => {
      let handleJoin = () => {
        this.handleJoinHouse()
      }
      return (
        <HouseTile
          key={house.id}
          id={house.id}
          name={house.name}
          handleJoin={handleJoin}
        />
      )
    })
    return (
      <div>
        {houses}
      </div>
    )
  }
}

export default HousesContainer
