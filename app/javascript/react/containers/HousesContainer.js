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

  handleJoinHouse(houseId) {
    fetch(`/api/v1/users/${houseId}`, {
      credentials: "same-origin",
      method: "PATCH",
      body: JSON.stringify(houseId),
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json"
      }
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
          throw error;
        }
      })
      .then(response => response.json())
      .then(body => {
        window.location.href = `/houses/${body.current_user.house_id}`
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
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
        this.handleJoinHouse(house.id)
      }
      return (
        <HouseTile
          key={house.id}
          id={house.id}
          name={house.name}
          password={house.password}
          handleJoin={handleJoin}
        />
      )
    })
    return (
      <div>
        <h2 className="house-header">Please join a house!</h2>
        <div className="scroll box">
          {houses}
        </div>
      </div>
    )
  }
}

export default HousesContainer
