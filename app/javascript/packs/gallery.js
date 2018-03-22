import ReactOnRails from "react-on-rails";

import Gallery from "../bundles/Gallery/components/Gallery";
import Markdown from "../bundles/Gallery/components/Markdown";

// This is how react_on_rails can see the Gallery in the browser.
ReactOnRails.register({
  Gallery,
  Markdown
});
