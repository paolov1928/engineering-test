import React from 'react'
import { BookingTableRow } from 'components/listing'
import {sortableContainer, sortableElement} from 'react-sortable-hoc';
import arrayMove from 'array-move';

const SortableItem = sortableElement(({value}) => <li>{value}</li>);

const SortableContainer = sortableContainer(({children}) => {
  return <ul>{children}</ul>;
});


class VariantBlock extends React.Component {
  constructor(props){
    super(props)
    this.state = {variants: this.props.variants}
    this.onSortEnd = this.onSortEnd.bind(this);
  }

  onSortEnd({oldIndex, newIndex}){
    this.setState(({variants}) => ({
      variants: arrayMove(variants, oldIndex, newIndex),
    }));
  };

  componentDidMount(){
    console.log(this.props)
  }

  render() {
    let { variants, heading } = this.props
  return (
    <div className='table availability-table'>
      <div className='table-body'>
        <SortableContainer onSortEnd={this.onSortEnd}>
        {variants.filter(a=> a.segment.includes(heading)).map(variant => (
          <BookingTableRow
            key={variant.id}
            variant={variant}
          />
        ))}
        </SortableContainer>
      </div>
    </div>
  )
}
}

export default VariantBlock
// .filter(a=> a.name.includes('release'))
