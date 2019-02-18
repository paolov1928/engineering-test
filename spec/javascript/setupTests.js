/* global jest beforeEach */

import Enzyme from 'enzyme'
import Adapter from 'enzyme-adapter-react-16'
import {JSDOM} from 'jsdom'

Enzyme.configure({ adapter: new Adapter() })

// Taken from:
//   https://github.com/stripe/react-stripe-elements/blob/c4d63e4dcd2e7df09fe7b6a161de69fbe6499851/src/index.test.js#L26-L43
let elementMock, elementsMock, stripeMock

beforeEach(() => {
  elementMock = {
    mount: jest.fn(),
    destroy: jest.fn(),
    on: jest.fn(),
    update: jest.fn()
  }
  elementsMock = {
    create: jest.fn().mockReturnValue(elementMock)
  }
  stripeMock = {
    elements: jest.fn().mockReturnValue(elementsMock),
    createToken: jest.fn(),
    createSource: jest.fn()
  }

  global.Stripe = jest.fn().mockReturnValue(stripeMock)

  const {document} = (new JSDOM()).window
  global.document = document
})
