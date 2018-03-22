import React from "react";
import { inject, observer } from "mobx-react";

class PhotoList extends React.Component {
  onImageClick = uploadId => {
    const { GalleryStore } = this.props;
    GalleryStore.setSelectedUploadId(uploadId);
    document.querySelector(GalleryStore.inputSelector).value = uploadId;
  };

  render() {
    const { GalleryStore } = this.props;
    const { selectedUploadId, uploads } = GalleryStore;

    return (
      <div className="images">
        {uploads.map(upload => (
          <div
            key={upload.id}
            className="img-container"
            onClick={() => {
              this.onImageClick(upload.id);
            }}
          >
            <img
              className={selectedUploadId === upload.id ? "selected" : ""}
              src={upload.file_thumbnail_url}
            />
          </div>
        ))}
      </div>
    );
  }
}

export default inject("GalleryStore")(observer(PhotoList));
