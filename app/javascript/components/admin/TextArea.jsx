import React from 'react'
import PropTypes from 'prop-types'

const COUNTER_CLASSES = 'small text-muted float-right'
const SINGLE_STYLE = {
  resize: 'none',
  whiteSpace: 'nowrap',
  overflow: 'hidden'
}

class TextArea extends React.Component {
  constructor(props) {
    super(props)

    const {forceSingle, value, ...attrs} = props

    this.state = { value: value || '' }
    this.attrs = attrs
    this.style = {}

    if (forceSingle === true) {
      this.style = SINGLE_STYLE
    }
  }

  render() {
    const { maxLength } = this.props
    const { value } = this.state

    return (
      <React.Fragment>
        <textarea
          {...this.attrs}
          style={this.style}
          value={value}
          onChange={(e) => this.setState({ value: e.target.value })}
        />

        {maxLength &&
        <span className={COUNTER_CLASSES}>{`${value.length}/${maxLength}`}</span>}
      </React.Fragment>
    )
  }
}

TextArea.propTypes = {
  value: PropTypes.string,
  autofocus: PropTypes.bool,
  cols: PropTypes.number,
  dirname: PropTypes.string,
  disabled: PropTypes.bool,
  form: PropTypes.string,
  maxLength: PropTypes.number,
  name: PropTypes.string,
  placeholder: PropTypes.string,
  readonly: PropTypes.bool,
  required: PropTypes.bool,
  rows: PropTypes.number,
  wrap: PropTypes.string,
  forceSingle: PropTypes.bool
}

TextArea.defaultProps = {
  forceSingle: false
}

export default TextArea
