import PropTypes from "prop-types";
import React from "react";
import { Provider } from "mobx-react";
import GalleryStore from "../stores/GalleryStore";
import PhotoList from "./PhotoList";
import Pagination from "./Pagination";
import NewUpload from "./NewUpload";

export default class Gallery extends React.Component {
  static propTypes = {
    uploadId: PropTypes.number,
    inputSelector: PropTypes.string.isRequired
  };
  static defaultProps = {
    uploadId: null
  };

  componentDidMount() {
    GalleryStore.setInputSelector(this.props.inputSelector);
    GalleryStore.setSelectedUploadId(this.props.uploadId);
    GalleryStore.fetchUploads();
  }

  render() {
    return (
      <Provider GalleryStore={GalleryStore}>
        <div className="gallery">
          <PhotoList />
          <NewUpload />
          <Pagination />
        </div>
      </Provider>
    );
  }
}
