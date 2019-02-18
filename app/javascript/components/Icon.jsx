import React from 'react'
import cx from 'classnames'

const Icon = (props) =>
  <i {...props} className={cx(`icon icon-${props.name}`, props.className)} />

export default Icon
