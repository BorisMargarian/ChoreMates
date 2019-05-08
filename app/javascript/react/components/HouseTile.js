import React from "react"

const HouseTile = props => {
  let houseId = props.id
  let handleSubmit = (event) => {
    event.preventDefault()
    debugger
    let password = event.target.elements.password.value
  }

  return (
    <div>
      <form className="" onSubmit={handleSubmit}>
        <h3>{props.name}</h3>
        <label name={props.name} >House Password
          <input type="password" name="password"/>
        </label>
        <input
          className="button"
          type="submit"
          value="Submit"
        />
      </form>
    </div>
  )
}

export default HouseTile
