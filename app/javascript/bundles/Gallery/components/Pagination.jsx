import React from "react";
import { inject, observer } from "mobx-react";

class Pagination extends React.Component {
  pages = () => {
    const pages = [];
    for (let i = 1; i <= this.props.GalleryStore.pages; i++) {
      pages.push(i);
    }
    return pages;
  };

  handleTermChange = e => {
    e.preventDefault();
    this.props.GalleryStore.updateAndSearchTerm(e.target.value);
  };

  render() {
    const { GalleryStore } = this.props;

    return (
      <div className="navigation">
        {/* <div>
          <input
            value={GalleryStore.term}
            onChange={e => this.handleTermChange(e)}
          />
        </div> */}

        {this.pages().map(page => (
          <button
            key={page}
            onClick={() => {
              GalleryStore.loadPage(page);
            }}
          >
            {page}
          </button>
        ))}
      </div>
    );
  }
}

export default inject("GalleryStore")(observer(Pagination));
