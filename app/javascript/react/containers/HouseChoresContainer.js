import React, { Component } from "react"
import { Route, IndexRoute, Router, browserHistory } from "react-router";
import HouseChoreTile from "../components/HouseChoreTile"

class HouseChoresContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      house: null,
      chores: [],
      current_user: null
    }
    this.handleClaimChore = this.handleClaimChore.bind(this)
  }

  componentDidMount() {
    fetch(`/api/v1/houses/${this.props.params.id}`)
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
        house: body.house,
        chores: body.chores,
        current_user: body.current_user
      });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleClaimChore(payload) {
    let houseId = this.state.house.id
    fetch(`/api/v1/houses/${houseId}`, {
      credentials: "same-origin",
      method: "PATCH",
      body: JSON.stringify(payload),
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
        this.setState({ chores: body.chores });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let header
    if (this.state.house) {
      header = `Chores for the house of ${this.state.house.name}`
    }
    let houseChores = this.state.chores.map(chore => {
      let url
      if (chore.chore_photo) {
        url = chore.chore_photo.url
      }
      return (
        <HouseChoreTile
          key={chore.id}
          id={chore.id}
          name={chore.name}
          due={chore.due}
          user={chore.user}
          status={chore.status}
          image={url}
          handleClaimChore={this.handleClaimChore}
          current_user_id={this.state.current_user.id}
        />
      )
    })
    return (
      <div>
        <h2>{header}</h2>
        <div className="scroll box">
          {houseChores}
        </div>
      </div>
    )
  }
}

export default HouseChoresContainer
