import { DirectUpload } from 'activestorage'
import { COMPLETE, UPLOADING } from 'components/upload_widget/constants'

class Uploader {
  constructor(file, component) {
    let {url} = component.props
    this.file = file
    this.baseComponent = component
    this.upload = new DirectUpload(this.file, url, this)
  }

  startUpload() {
    this.upload.create((error, blob) => {
      if (error) {
        console.error('Error:', error)
      } else {
        this.baseComponent.setState({
          signature: blob.signed_id,
          currentState: COMPLETE
        })
        this.baseComponent.onUploadFinish(blob.signed_id)
      }
    })
  }

  directUploadWillStoreFileWithXHR(request) {
    request.upload.addEventListener('progress',
      event => this.directUploadDidProgress(event))
  }

  directUploadDidProgress(event) {
    this.baseComponent.setState(
      {
        percent: event.loaded / event.total * 100,
        currentState: UPLOADING
      })
  }
}

export default Uploader
