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
    <div className="house-tile">
      <form className="" onSubmit={handleSubmit}>
        <h3>{props.name}</h3>
        <div className="password-join">
          <div className="house-join">
            <label name={props.name} >Password
              <input className="p-field" type="password" name="password"/>
            </label>
          </div>
          <div className="join-button">
            <input
              className="button"
              type="submit"
              value={`Join`}
            />
          </div>
        </div>
      </form>
    </div>
  )
}

export default HouseTile
