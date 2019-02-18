import React from 'react'
import DropzoneWithPreview from 'components/upload_widget/Dropzone'
import DirectUploadDropzone from 'components/hoc/DirectUploadDropzone'

class ImageUpload extends React.Component {
  render() {
    return (
      <DropzoneWithPreview {...this.props} />
    )
  }
}

export default DirectUploadDropzone(ImageUpload)
