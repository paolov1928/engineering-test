import React from 'react'
import { Uploader } from 'components/upload_widget'
import { PENDING, SELECTED } from 'components/upload_widget/constants'
import PropTypes from 'prop-types'

function DirectUploadDropzone(WrappedComponent) {
  return class extends React.Component {
    constructor(props) {
      super(props)
      this.uploadFile = this.uploadFile.bind(this)
      this.onUploadFinish = this.onUploadFinish.bind(this)
      this.onDrop = this.onDrop.bind(this)
      this.state = {
        percent: 0,
        currentState: this.props.state || (this.props.currentImage ? SELECTED : PENDING),
        currentSelection: this.props.currentImage,
        file: this.props.file || {},
        signature: this.props.signature
      }
    }

    onDrop(files) {
      Array.from(files).forEach(file => this.uploadFile(file))
    }

    onUploadFinish(signature) {
      if (this.props.onUpload) {
        this.props.onUpload(signature, this.state.file.preview)
      }
    }

    uploadFile(file) {
      let uploader = new Uploader(file, this)

      this.setState({file: file})
      uploader.startUpload()
    }

    render() {
      return <WrappedComponent
        onDrop={this.onDrop}
        {...this.props}
        {...this.state}
      />
    }
  }
}

DirectUploadDropzone.propTypes = {
  id: PropTypes.string
}

DirectUploadDropzone.defaultProps = {
  id: null
}

export default DirectUploadDropzone
