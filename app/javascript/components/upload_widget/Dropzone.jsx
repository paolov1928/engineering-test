import React from 'react'
import Dropzone from 'react-dropzone'
import { ProgressCircle } from 'components/upload_widget'
import { SELECTED, COMPLETE } from 'components/upload_widget/constants'
import Icon from 'components/Icon'
import cx from 'classnames'

const ImagePreview = ({imageSource}) => (
  <div style={{position: 'relative'}} >
    <img src={imageSource} className='img-fluid' />
    <div className='overlay' >
      <Icon className='pending' name='plus' />
    </div>
  </div>
)

class DropzoneWithPreview extends React.Component {
  render() {
    const { id, name, onDrop, signature, currentState, file, currentSelection,
      percent, className } = this.props

    return (
      <div className={cx('dropzone-item', className)}>
        <Dropzone
          className='dropzone-area'
          onDrop={onDrop}
          multiple={false}
          accept='image/jpeg, image/png, image/gif'
          maxSize={10000000}
          inputProps={
            {'data-direct-upload-url': this.props.url,
              'id': id}
          }
        >
          { currentState === SELECTED &&
            <ImagePreview imageSource={currentSelection} />
          }
          <ProgressCircle state={currentState} percent={percent} />
          { currentState === COMPLETE &&
            <ImagePreview imageSource={file.preview} />
          }
        </Dropzone>
        {signature &&
          <input
            type='hidden'
            value={signature}
            data-provides='upload'
            name={name}
          />}
      </div>
    )
  }
}

export default DropzoneWithPreview
