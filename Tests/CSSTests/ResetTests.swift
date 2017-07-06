import XCTest
import Prelude
import CSS

class ResetTests: XCTestCase {
  func testResetPretty() {
    XCTAssertEqual(
      """

a, abbr, acronym, address, article, aside, audio, b, blockquote, body, canvas, caption, cite, code, dd, details, div, dl, dt, em, embed, fieldset, figure, figcaption, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, html, iframe, i, img, input, label, legend, li, menu, nav, ol, section, span, strong, summary, table, tbody, td, tfoot, th, thead, time, tr, p, pre, q, u, ul, video {
  margin-top     : 0;
  margin-right   : 0;
  margin-bottom  : 0;
  margin-left    : 0;
  padding-top    : 0;
  padding-right  : 0;
  padding-bottom : 0;
  padding-left   : 0;
  font-size      : 100%;
  font-family    : inherit;
  font-style     : inherit;
  font-weight    : inherit;
  vertical-align : baseline;
}

article, footer, header, menu, nav, section {
  display : block;
}

body {
  line-height : 1;
}

ol, ul {
  list-style-type : none;
}

blockquote::after, blockquote::before, q::before, q::after {
  content : "";
  content : none;
}

blockquote, q {
  quotes : none;
}

table {
  border-collapse : collapse;
  border-spacing  : 0;
}


""",
      render(config: pretty, css: reset)
    )
  }

  func testResetCompact() {
    XCTAssertEqual(
      "a, abbr, acronym, address, article, aside, audio, b, blockquote, body, canvas, caption, cite, code, dd, details, div, dl, dt, em, embed, fieldset, figure, figcaption, footer, form, h1, h2, h3, h4, h5, h6, header, hgroup, html, iframe, i, img, input, label, legend, li, menu, nav, ol, section, span, strong, summary, table, tbody, td, tfoot, th, thead, time, tr, p, pre, q, u, ul, video{margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;font-size:100%;font-family:inherit;font-style:inherit;font-weight:inherit;vertical-align:baseline}article, footer, header, menu, nav, section{display:block}body{line-height:1}ol, ul{list-style-type:none}blockquote::after, blockquote::before, q::before, q::after{content:\"\";content:none}blockquote, q{quotes:none}table{border-collapse:collapse;border-spacing:0}",
      render(config: compact, css: reset)
    )
  }
}
