/* global expect describe it */

import React from 'react'
import { shallow } from 'enzyme'
import TextArea from 'components/admin/TextArea'

const tagLine = 'Beyond Adventures are a new-age of festival where nomadic adventure travel meets pure hedonism'

describe('<TextArea />', () => {
  it('renders a <textarea />', () => {
    const wrapper = shallow(<TextArea />)

    expect(wrapper.find('textarea')).toHaveLength(1)
  })

  it('renders the value prop within the textarea', () => {
    const wrapper = shallow(<TextArea value={tagLine} />)

    expect(wrapper.find('textarea').html())
      .toEqual(expect.stringContaining(tagLine))
  })

  describe('state.value is always a string', () => {
    it('converts null to empty string', () => {
      const wrapper = shallow(<TextArea value={null} />)
      expect(wrapper.state('value')).toEqual('')
    })

    it('converts undefined to empty string', () => {
      const wrapper = shallow(<TextArea />)
      expect(wrapper.state('value')).toEqual('')
    })
  })

  describe('rendering a maxLength counter', () => {
    const max = 300

    it('renders the counter', () => {
      const wrapper = shallow(<TextArea maxLength={max} />)

      expect(wrapper.find('textarea + span')).toHaveLength(1)
    })

    it('indicates the maxLength', () => {
      const wrapper = shallow(<TextArea maxLength={max} />)

      expect(wrapper.find('textarea + span').text())
        .toEqual(expect.stringContaining(`${max}`))
    })

    it('indicates the current text length', () => {
      const wrapper = shallow(<TextArea value={tagLine} maxLength={max} />)

      expect(wrapper.find('textarea + span').text())
        .toEqual(expect.stringContaining(`${tagLine.length}`))
    })

    it('updates when the user update the text in the input', () => {
      const wrapper = shallow(<TextArea value={tagLine} maxLength={max} />)

      wrapper.find('textarea').simulate('change', { target: { value: '' } })

      expect(wrapper.find('textarea + span').text())
        .toEqual(expect.stringContaining(`0/${max}`))
    })
  })

  describe('forcing the input to be a single line', () => {
    it('applies an inline style to the <textarea />', () => {
      const wrapper = shallow(<TextArea value={tagLine} forceSingle />)
      const style = wrapper.find('textarea').prop('style')

      expect(style).toHaveProperty('resize', 'none')
      expect(style).toHaveProperty('whiteSpace', 'nowrap')
      expect(style).toHaveProperty('overflow', 'hidden')
    })
  })
})
