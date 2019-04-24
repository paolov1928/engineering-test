import React from 'react'
import { BookingTableRow } from 'components/listing'



class VariantBlock extends React.Component {

  constructor(props){
    super(props)
    this.sortVariants = this.sortVariants.bind(this)
    this.makeNumber = this.makeNumber.bind(this)
  }

  componentDidMount(){
    console.log(this.props)
  }

  makeNumber(currency){
    return Number(currency.displayPrice.replace(/[^0-9\.-]+/g,""))
  }

  sortVariants(variants){
    // should make this into a sorting object so can have a SSoTruth and edit the sort options easily
    if (this.props.sort === 'Price (H to L)')
    {return variants.sort((a,b)=> this.makeNumber(b) - this.makeNumber(a))}

    else if (this.props.sort === 'Price (L to H)') {return variants.sort((a,b)=> this.makeNumber(a) - this.makeNumber(b))}

    else if (this.props.sort === 'Alphabetically') {return variants.sort((a,b)=> a.name.localeCompare(b.name))}



  }

  render() {
    let { variants, heading } = this.props
    this.sortVariants(variants)
  return (
    <div className='table availability-table'>
      <div className='table-body'>
        {variants.filter(v=> v.segment.includes(heading)).map(variant => (
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
