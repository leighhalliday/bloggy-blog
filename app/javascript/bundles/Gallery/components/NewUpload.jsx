import React from "react";
import { inject, observer } from "mobx-react";

class NewUpload extends React.Component {
  handleSubmit = async e => {
    e.preventDefault();
    const { GalleryStore } = this.props;

    const upload = await GalleryStore.submitUpload({
      name: this.nameInput.value,
      file: this.fileInput.files[0]
    });

    e.target.reset();
    document.querySelector(GalleryStore.inputSelector).value = upload.id;
  };

  render() {
    return (
      <form
        onSubmit={e => {
          this.handleSubmit(e);
        }}
      >
        <input
          type="text"
          placeholder="Upload name"
          ref={input => {
            this.nameInput = input;
          }}
        />
        <input
          type="file"
          ref={input => {
            this.fileInput = input;
          }}
        />
        <button className="btn btn-primary">Upload</button>
      </form>
    );
  }
}

export default inject("GalleryStore")(observer(NewUpload));
