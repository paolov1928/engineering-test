import React from 'react'
import Icon from 'components/Icon'
import cx from 'classnames'

class NumberStepper extends React.Component {
  constructor(props) {
    super(props)

    this.state = {value: props.value}
    this.step = props.step
    this.max = props.max
    this.min = props.min
    this.disabled = props.disabled
    this.increment = this.increment.bind(this)
    this.decrement = this.decrement.bind(this)
  }

  increment() {
    this._update(this.state.value + this.step)
  }

  decrement() {
    this._update(this.state.value - this.step)
  }

  _update(newValue) {
    newValue = Math.min(Math.max(newValue, this.min), this.max)
    this.setState({ value: newValue })
    this.props.onChange(newValue)
  }

  componentDidUpdate(prevProps, prevState) {
    if (prevProps.value !== this.props.value) {
      this.setState({value: this.props.value})
    }
  }

  render() {
    let {value} = this.state
    const classNames = cx('input-group', 'number-stepper', this.props.className)

    return (
      <div className={classNames}>
        <div className='input-group-btn'>
          <button
            className='btn btn-secondary'
            type='button'
            disabled={this.disabled || value <= this.min}
            name='decrement'
            onClick={this.decrement}>
            <Icon name='minus' />
          </button>
        </div>
        <input
          type='text'
          className='form-control'
          value={value}
          disabled
        />
        <div className='input-group-btn'>
          <button
            className='btn btn-secondary'
            type='button'
            name='increment'
            disabled={this.disabled || value >= this.max}
            onClick={this.increment}>
            <Icon name='plus' />
          </button>
        </div>
      </div>
    )
  }
}

NumberStepper.defaultProps = {
  step: 1,
  max: 10,
  min: 0
}

export default NumberStepper
