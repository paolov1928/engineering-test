/* global expect describe it */

import React from 'react'
import { mount } from 'enzyme'

import ProgressCircle from 'components/upload_widget/ProgressCircle'
import { UPLOADING, PENDING } from 'components/upload_widget/constants'

describe('<ProgressCircle />', () => {
  it('renders a loading circle when the state is uploading', () => {
    const wrapper = mount(<ProgressCircle state={UPLOADING} percent={50} />)
    expect(wrapper.exists('.rc-progress-circle')).toBe(true)
  })

  it('renders a plus icon when the state is pending', () => {
    const wrapper = mount(<ProgressCircle state={PENDING} />)
    expect(wrapper.exists('.icon-plus')).toBe(true)
  })
})
