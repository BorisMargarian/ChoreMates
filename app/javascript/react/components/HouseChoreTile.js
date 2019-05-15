import React from "react"
import { Route, IndexRoute, Router, Link, browserHistory } from "react-router";

const HouseChoreTile = props => {
  let assigned = "NA", claimButton, completeButton
  if (props.user) {
    assigned = props.user.username
  }

  let clickClaimChore = (event) => {
    event.preventDefault()
    let newStatus
    if (props.status === "unclaimed") {
      newStatus = "claimed"
    } else {
      newStatus = "unclaimed"
    }
    let payload = {
      id: props.id,
      status: newStatus
    }
    props.choreStatusChange(payload)
  }

  let clickComplete = (event) => {
    event.preventDefault()
    let newStatus
    if (props.status === "claimed") {
      newStatus = "complete"
    }
    let payload = {
      id: props.id,
      status: newStatus
    }
    props.choreStatusChange(payload)
  }

  if (props.status === "unclaimed") {
    claimButton = (
      <input
        className="button"
        type="button"
        value="Claim"
        onClick={clickClaimChore}
      />
    )
  } else if (props.user && props.user.id === props.current_user_id && props.status === "claimed") {
    claimButton = (
      <input
        className="button"
        type="button"
        value="Unclaim"
        onClick={clickClaimChore}
      />
    )
    completeButton = (
      <input
        className="button"
        type="button"
        value="Complete"
        onClick={clickComplete}
      />
    )
  }

  return (
    <div className="chore-tile">
      <Link to={`/chores/${props.id}`} >
        <div className="" >
          <img src={`${props.image}`} className="" />
        </div>
      </Link>
      <h3>Chore: {props.name}</h3>
      <p>Assigned to: {assigned}</p>
      <p>Status: {props.status}</p>
      <p>Due by: {props.due}</p>
      {claimButton} {completeButton}
    </div>
  )
}

export default HouseChoreTile
