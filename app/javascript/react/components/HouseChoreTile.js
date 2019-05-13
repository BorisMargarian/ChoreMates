import React from "react"

const HouseChoreTile = props => {
  let assigned = "NA", claimButton
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
    props.handleClaimChore(payload)
  }

  if (props.status === "unclaimed") {
    claimButton = (
      <input
        className="button"
        type="button"
        value="Claim Chore"
        onClick={clickClaimChore}
      />
    )
  } else if (props.user && props.user.id === props.current_user_id) {
    claimButton = (
      <input
        className="button"
        type="button"
        value="Unclaim Chore"
        onClick={clickClaimChore}
      />
    )
  }

  return (
    <div className="chore-tile">
      <div className="" >
        <img src={`${props.image}`} className="" />
      </div>
      <h3>Chore: {props.name}</h3>
      <p>Assigned to: {assigned}</p>
      <p>Due by: {props.due}</p>
      {claimButton}
    </div>
  )
}

export default HouseChoreTile
