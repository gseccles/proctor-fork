import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    current: String
  }

  connect() {
    this.loadRoles()
  }

  async loadRoles() {
    const response = await fetch('/roles')
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }
    const roles = await response.json()
    
    // Clear existing options except the blank option
    while (this.element.options.length > 1) {
      this.element.remove(1)
    }

    roles.forEach(role => {
      const option = new Option(role.name, role.id)
      if (role.id === this.currentValue) {
        option.selected = true
      }
      this.element.add(option)
    })
  }
} 