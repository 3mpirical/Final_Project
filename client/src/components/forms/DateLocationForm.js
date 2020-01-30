import React, {Component} from 'react';
import { ProjectConsumer, } from "../../providers/ProjectProvider";

class DateLocationForm extends Component {

  state = { button: {
    one: 'estimatorButton', two: 'estimatorButton', three: 'estimatorButton', four: 'estimatorButton'
    }
  }

  toggle = (unique, item) => {
    const{ button } = this.state
    if (unique === 'estimatorButton') {
      this.setState({ button: {...button, [item]: 'selectedButton'} })
    }
    else if (unique === 'selectedButton') {
      this.setState({ button: {...button, [item]: 'estimatorButton'} })
    }
  }

  render() {

    const{value: {toggleCategoryItem}} = this.props
    const { button: {one, two, three, four} } = this.state

  return(
      <>
        <h1 id='dateLocation' style={{paddingTop: '60px'}}>Dates & Locations</h1>
        <div align='center' className='grid-container'>

          <fieldset>
            <legend>Calendaring</legend>
            <button className={one} onClick={() => {toggleCategoryItem('date_location', 'calendar'); this.toggle(one, 'one');}}>

            </button>
          </fieldset>

          <fieldset>
            <legend>Custom Map</legend>
            <button className={two} onClick={() => {toggleCategoryItem('date_location', 'display'); this.toggle(two, 'two');}}>

            </button>
          </fieldset>

          <fieldset>
            <legend>Geolocation</legend>
            <button className={three} onClick={() => {toggleCategoryItem('date_location', 'map_display'); this.toggle(three, 'three');}}>

            </button>
          </fieldset>

          <fieldset>
            <legend>Bookings</legend>
            <button className={four} onClick={() => {toggleCategoryItem('date_location', 'booking'); this.toggle(four, 'four');}}>

            </button>
          </fieldset>

        </div>
      </>
    )
  }
}

export default class ConnectedDateLocationForm extends React.Component {
  render() {
    return (
      <ProjectConsumer>
        { value => <DateLocationForm {...this.props} value={value}/>}
      </ProjectConsumer>
    )
  }
}
