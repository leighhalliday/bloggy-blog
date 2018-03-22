import PropTypes from "prop-types";
import React from "react";
import ReactMarkdown from "react-markdown";

export default class Markdown extends React.Component {
  static propTypes = {
    inputSelector: PropTypes.string.isRequired
  };

  state = {
    source: ""
  };

  componentDidMount() {
    const input = document.querySelector(this.props.inputSelector);

    this.setState({
      source: input.value
    });

    input.addEventListener("keyup", event => {
      this.setState({
        source: event.target.value
      });
    });
  }

  render() {
    return (
      <div>
        <ReactMarkdown source={this.state.source} />
      </div>
    );
  }
}
