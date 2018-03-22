import { action, observable, configure, decorate, runInAction } from "mobx";
import axios from "axios";

configure({ enforceActions: true });

class GalleryStore {
  inputSelector = null;
  page = 1;
  pages = 1;
  term = "";
  uploads = [];
  selectedUploadId = null;

  fetchUploads = async () => {
    const response = await axios.get("/admin/uploads.json", {
      params: { page: this.page, term: this.term }
    });
    this.setUploads(response.data);
    this.setHeaders(response.headers);
  };

  setInputSelector = inputSelector => {
    this.inputSelector = inputSelector;
  };

  setUploads = uploads => {
    this.uploads = uploads;
  };

  addUpload = upload => {
    this.uploads.unshift(upload);
  };

  setHeaders = headers => {
    this.pages = parseInt(headers["x-pagination-total"], 10);
  };

  setSelectedUploadId = uploadId => {
    this.selectedUploadId = uploadId;
  };

  loadPage = page => {
    this.page = page;
    this.fetchUploads();
  };

  updateAndSearchTerm = term => {
    this.term = term;
    this.fetchUploads();
  };

  submitUpload = async data => {
    const form = new FormData();
    form.append("upload[name]", data.name);
    form.append("upload[file]", data.file);

    const response = await axios.post("/admin/uploads.json", form);
    this.addUpload(response.data);
    return response.data;
  };
}

decorate(GalleryStore, {
  inputSelector: observable,
  page: observable,
  pages: observable,
  term: observable,
  uploads: observable,
  selectedUploadId: observable,
  setUploads: action,
  addUpload: action,
  setHeaders: action,
  setSelectedUploadId: action,
  setInputSelector: action,
  loadPage: action,
  updateAndSearchTerm: action
});

const store = new GalleryStore();
export default store;
