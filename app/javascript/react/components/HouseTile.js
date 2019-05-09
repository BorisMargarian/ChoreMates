import React from "react"

const HouseTile = props => {
  let handleSubmit = (event) => {
    event.preventDefault()
    let userInput = event.target.elements.password.value
    if (userInput === props.password) {
      props.handleJoin()
    } else {
      alert("Incorrect Password, try again!")
    }
  }

  return (
    <div>
      <form className="" onSubmit={handleSubmit}>
        <h3>{props.name}</h3>
        <label name={props.name} >Password
          <input type="password" name="password"/>
        </label>
        <input
          className="button"
          type="submit"
          value="Join this House"
        />
      </form>
    </div>
  )
}

export default HouseTile
