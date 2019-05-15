import React, { Component } from "react"
import { Route, IndexRoute, Router, browserHistory } from "react-router";
import HouseChoreTile from "../components/HouseChoreTile"

class HouseChoresContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      house: null,
      chores: [],
      current_user: null,
      choreType: "house"
    }
    this.choreStatusChange = this.choreStatusChange.bind(this)
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

  choreStatusChange(payload) {
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
    let header, houseChores, myChores
    if (this.state.house) {
      houseChores = (<input
        className="button"
        type="button"
        name="house"
        value={`${this.state.house.name} Chores`}
        onClick={this.showHouseForm}
      />)
      myChores = (<input
        className="button"
        type="button"
        name="mine"
        value="My Chores"
        onClick={this.showHouseForm}
      />)
      header = (
        <div>
          {houseChores}{myChores}
        </div>
      )
    }

    let choreList = this.state.chores.map(chore => {
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
          choreStatusChange={this.choreStatusChange}
          current_user_id={this.state.current_user.id}
        />
      )
    })
    if (choreList.length === 0) {
      choreList = <h3>Create some chores and they will show-up here!</h3>
    }
    return (
      <div>
        <div className="chore-header">
          <h2>{header}</h2>
        </div>
        <div className="scroll box">
          {choreList}
        </div>
      </div>
    )
  }
}

export default HouseChoresContainer
