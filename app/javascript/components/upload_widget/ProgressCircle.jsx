import React from 'react'
import { UPLOADING, PENDING } from 'components/upload_widget/constants'
import Icon from 'components/Icon'
import { Circle } from 'rc-progress'

export default function({state, percent}) {
  return (
    <React.Fragment>
      {state === PENDING && <Icon className='pending' name='plus' />}
      {state === UPLOADING && <Circle percent={percent} strokeWidth='5' />}
    </React.Fragment>
  )
}
