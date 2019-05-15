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
    this.choreTypeSelect = this.choreTypeSelect.bind(this)
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

  choreTypeSelect(event) {
    event.preventDefault()
    this.setState({ choreType: event.target.name })
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
    let header, houseChores, myChores, filteredChores
    let houseChoresClass = "button"
    let myChoresClass = "button"
    let current_user = this.state.current_user

    if (this.state.choreType === "house") {
      houseChoresClass += " selected"
      filteredChores = this.state.chores
    } else if (this.state.choreType === "mine") {
      myChoresClass += " selected"
      filteredChores = this.state.chores.filter(chore => {
        if (chore.user && current_user) {
          return chore.user.id === current_user.id
        }
      })
    }

    if (this.state.house) {
      houseChores = (
          <input
            className={houseChoresClass}
            type="button"
            name="house"
            value={`${this.state.house.name} Chores`}
            onClick={this.choreTypeSelect}
          />
      )
      myChores = (
        <input
          className={myChoresClass}
          type="button"
          name="mine"
          value="My Chores"
          onClick={this.choreTypeSelect}
        />
      )
      header = (
        <div>
          {houseChores}{myChores}
        </div>
      )
    }



    let choreList = filteredChores.map(chore => {
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
