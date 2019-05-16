import React from "react"
import { Route, IndexRoute, Router, Link, browserHistory } from "react-router";
import moment from 'moment'

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

  let backgroundColor
  if (props.status === "complete") {
    backgroundColor = {backgroundColor: '#D3F6DB'}
  } else if (props.status === "claimed") {
    backgroundColor = {backgroundColor: '#FEFF99'}
  }

  return (
    <div className="chore-tile" style={backgroundColor}>
      <div className="" >
        <Link to={`/chores/${props.id}`} >
            <img src={`${props.image}`} className="chore-image" />
        </Link>
        <div className="chore-text">
          <h4>Chore: {props.name}</h4>
          <p>Assigned to: {assigned}<br/>
          Status: {props.status}<br/>
          Due: {moment(props.due).format('DD/MM/YYYY on dddd')}</p>
        </div>
      </div>
      {claimButton} {completeButton}
    </div>
  )
}

export default HouseChoreTile
