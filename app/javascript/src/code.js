import Prism from "prismjs";
import "prismjs/themes/prism-okaidia.css";
import "prismjs/components/prism-jsx.min";
import "prismjs/components/prism-typescript.min";
import "prismjs/components/prism-ruby.min";
import "prismjs/components/prism-elixir.min";
import "prismjs/components/prism-json.min";
import "prismjs/components/prism-scss.min";
import "prismjs/components/prism-sql.min";
import "prismjs/components/prism-yaml.min";

export default () => {
  document.querySelectorAll("pre code").forEach(block => {
    const lang = block.classList[0];
    // prism needs class like language-xxxx on pre tag (parent)
    block.parentNode.classList.add(`language-${lang}`);
    Prism.highlightElement(block);
  });
};
