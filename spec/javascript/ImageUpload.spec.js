/* global describe expect it */

import React from 'react'
import ImageUpload from 'components/ImageUpload'
import { mount } from 'enzyme'
import { COMPLETE } from 'components/upload_widget/constants'

describe('<ImageUpload />', () => {
  it('renders the pending state by default', () => {
    const wrapper = mount((<ImageUpload />))
    expect(wrapper.exists('.icon-plus.pending')).toBe(true)
  })

  it('renders the hidden inputs when a signature is passed', () => {
    const signature = 'blahblahsignatureblahblah'
    const inputName = 'theinput'
    const props = {
      name: inputName,
      signature: signature
    }

    const wrapper = mount((<ImageUpload {...props} />))
    expect(wrapper.find(`input[name="${inputName}"]`).props().value).toBe(signature)
  })

  it('renders the current selected image if one is passed', () => {
    const imageUrl = 'https://image.com'
    const props = {
      currentImage: imageUrl
    }

    const wrapper = mount((<ImageUpload {...props} />))
    expect(wrapper.find('.img-fluid').props().src).toBe(imageUrl)
  })

  it('renders the image preview once the upload is complete', () => {
    const imageUrl = 'https://image.com'
    const props = {
      state: COMPLETE,
      file: {
        preview: imageUrl
      }
    }

    const wrapper = mount((<ImageUpload {...props} />))
    expect(wrapper.find('.img-fluid').props().src).toBe(imageUrl)
  })
})
