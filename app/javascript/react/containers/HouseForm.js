import React, { Component } from "react"

class HouseForm extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: "",
      password: "",
      confirm: "",
      errors: {}
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleSubmit(event) {
    event.preventDefault()
    let name = this.state.name;
    let password = this.state.password;
    let confirm = this.state.confirm;
    let errors = {}
    let payload

    if (name.trim() === "") {
      errors["name"] = "Name cannot be blank!"
    }
    if (password.trim() === "") {
      errors["password"] = "Password cannot be blank!"
    }
    if (password !== confirm) {
      errors["confirm"] = "Password fields must match!"
    }
    if (Object.keys(errors).length !== 0) {
      this.setState({ errors: errors })
    } else {
      payload = { name: name, password: password }
      this.props.addNewHouse(payload)
    }
  }

  handleChange(event) {
    this.setState({ [event.target.name]: event.target.value })
  }

  render() {

    return (
      <div className="house-header">
        <form className="" onSubmit={this.handleSubmit}>
          <h3 className="">New House Information</h3>
          <label>House Name
            <input
              type="text"
              name="name"
              value={this.state.name}
              onChange={this.handleChange}
            />
          </label>
          <label>Password
            <input
              type="password"
              name="password"
              value={this.state.password}
              onChange={this.handleChange}
            />
          </label>
          <label>Confirm Password
            <input
              type="password"
              name="confirm"
              value={this.state.confirm}
              onChange={this.handleChange}
            />
          </label>
          <input
            className="button"
            type="submit"
            value="Add"
          />
        </form>
      </div>
    )
  }
}

export default HouseForm
