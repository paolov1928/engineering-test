import React from 'react'
import { BookingTableRow } from 'components/listing'



class VariantBlock extends React.Component {

  componentDidMount(){
    console.log(this.props)
  }

  render() {
    let { variants, heading } = this.props
  return (
    <div className='table availability-table'>
      <div className='table-body'>
        {variants.filter(a=> a.segment.includes(heading)).map(variant => (
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
// .filter(a=> a.name.includes('release'))
