import React from 'react'
import { BookingTableRow } from 'components/listing'



class VariantBlock extends React.Component {

  componentDidMount(){
    console.log(this.props)
  }

  render() {
    let { variants } = this.props
  return (
    <div className='table availability-table'>
      <div className='table-body'>
        {variants.map(variant => (
          <BookingTableRow
            key={variant.id}
            variant={variant}
          />
        ))}
      </div>
    </div>
  )
}
}

export default VariantBlock
