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
        {variants.filter(v=> v.segment.includes(heading)).sort((a,b)=> Number(b.displayPrice.replace(/[^0-9\.-]+/g,"")) - Number(a.displayPrice.replace(/[^0-9\.-]+/g,""))).map(variant => (
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
// Insert the below before iteration
// let sortingObject = {default: 'soldOut', name: .sort((a,b)=> a.name.localeCompare(b.name)), price: .sort((a,b)=> Number(a.displayPrice.replace(/[^0-9\.-]+/g,"")) - Number(b.displayPrice.replace(/[^0-9\.-]+/g,""))) }
