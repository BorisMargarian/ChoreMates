import React from "react"
import moment from 'moment'

const ChoreTile = props => {
  let assigned = "NA", claimButton, completeButton
  if (props.user) {
    assigned = props.user.username
  }

  return (
    <div className="chore-tile">
      <div className="" >
        <img src={`${props.image}`} className="" />
      </div>
      <h3>Chore: {props.name}</h3>
      <p>{props.description}</p>
      <p>Cost: ${props.cost}</p>
      <p>Assigned to: {assigned}</p>
      <p>Status: {props.status}</p>
      <p>Due: {moment(props.due).format('DD/MM/YYYY on dddd')}</p>
    </div>
  )
}

export default ChoreTile
