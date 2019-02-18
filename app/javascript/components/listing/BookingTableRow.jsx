import React from 'react'
import NumberStepper from 'components/NumberStepper'
import { Tagline } from 'components/listing'
import classNames from 'classnames'

function Name({name, path}) {
  return (
    path
      ? <a href={path} className='plain-link' data-action='quicklook_v2'>
        <strong className='text-uppercase'> {name} </strong>
      </a>
      : <strong className='text-uppercase'> {name} </strong>
  )
}

class BookingTableRow extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      quantity: 0
    }
    this.updateQuantity = this.updateQuantity.bind(this)
  }

  updateQuantity(value){
    this.setState({quantity: value})
  }

  render() {
    let {name, soldOut, tagline, displayPrice, productPricingUnit } = this.props.variant,
      rowClassNames = classNames('row',
        {'text-strike hidden-sm-down': soldOut,
          'cell-highlight': this.state.quantity > 0 })

    return (
      <div className={rowClassNames} >
        <div className='col'>
          <Name name={name} />
          <Tagline tagline={tagline} />
        </div>
        <div className='col-4 col-md-3 text-center'>
          {displayPrice}
          {productPricingUnit &&
            <sub>/{productPricingUnit}</sub>}
        </div>
        <div className='w-100 mb-3 hidden-md-up' />
        <div className='col col-md-3 p-0'>
          { soldOut
            ? <button className='btn btn-secondary btn-lg w-100' disabled>Sold out</button>
            : <NumberStepper className='float-right' onChange={this.updateQuantity} value={this.state.quantity} />}
        </div>
      </div>
    )
  }
}
 export default BookingTableRow
