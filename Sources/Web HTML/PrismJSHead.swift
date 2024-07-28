//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTML

public struct PrismJSHead: HTML {
  
  
  private let languages: [String]
  private let style_string: String
  private let script_string: String
  
  public init(
    languages: [String] = [],
    style: String = "",
    script: String = ""
  ) {
    self.languages = languages
    self.script_string = script
    self.style_string = style
  }
  
  public var body: some HTML {
    style {
      style_string
    }
    script().src("//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js")
    script().src(
      "//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-highlight/prism-line-highlight.min.js"
    )
    HTMLForEach(self.languages) { lang in
      script().src("//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-\(lang).min.js")
    }
    script {
      script_string
    }
  }
}

extension PrismJSHead {
  struct Language: ExpressibleByStringLiteral {
    
    let value: String
    
    public init(stringLiteral value: StringLiteralType) {
      self.value = value
    }
  }
}
//
//extension PrismJSHead.Language {
//  static let markup: Self = "markup"
//    static let html: Self = "html"
//    static let xml: Self = "xml"
//    static let svg: Self = "svg"
//    static let mathml: Self = "mathml"
//    static let ssml: Self = "ssml"
//    static let atom: Self = "atom"
//    static let rss: Self = "rss"
//    static let css: Self = "css"
//    static let clike: Self = "clike"
//    static let javascript: Self = "javascript"
//    static let js: Self = "js"
//    static let abap: Self = "abap"
//    static let abnf: Self = "abnf"
//    static let actionscript: Self = "actionscript"
//    static let ada: Self = "ada"
//    static let agda: Self = "agda"
//    static let al: Self = "al"
//    static let antlr4: Self = "antlr4"
//    static let g4: Self = "g4"
//    static let apacheconf: Self = "apacheconf"
//    static let apex: Self = "apex"
//    static let apl: Self = "apl"
//    static let applescript: Self = "applescript"
//    static let aql: Self = "aql"
//    static let arduino: Self = "arduino"
//    static let ino: Self = "ino"
//    static let arff: Self = "arff"
//    static let armasm: Self = "armasm"
//    static let arm_asm: Self = "arm-asm"
//    static let arturo: Self = "arturo"
//    static let art: Self = "art"
//    static let asciidoc: Self = "asciidoc"
//    static let adoc: Self = "adoc"
//    static let aspnet: Self = "aspnet"
//    static let asm6502: Self = "asm6502"
//    static let asmatmel: Self = "asmatmel"
//    static let autohotkey: Self = "autohotkey"
//    static let autoit: Self = "autoit"
//    static let avisynth: Self = "avisynth"
//    static let avs: Self = "avs"
//    static let avro_idl: Self = "avro-idl"
//    static let avdl: Self = "avdl"
//    static let awk: Self = "awk"
//    static let gawk: Self = "gawk"
//    static let bash: Self = "bash"
//    static let sh: Self = "sh"
//    static let shell: Self = "shell"
//    static let basic: Self = "basic"
//    static let batch: Self = "batch"
//    static let bbcode: Self = "bbcode"
//    static let shortcode: Self = "shortcode"
//    static let bbj: Self = "bbj"
//    static let bicep: Self = "bicep"
//    static let birb: Self = "birb"
//    static let bison: Self = "bison"
//    static let bnf: Self = "bnf"
//    static let rbnf: Self = "rbnf"
//    static let bqn: Self = "bqn"
//    static let brainfuck: Self = "brainfuck"
//    static let brightscript: Self = "brightscript"
//    static let bro: Self = "bro"
//    static let bsl: Self = "bsl"
//    static let oscript: Self = "oscript"
//    static let c: Self = "c"
//    static let csharp: Self = "csharp"
//    static let cs: Self = "cs"
//    static let dotnet: Self = "dotnet"
//    static let cpp: Self = "cpp"
//    static let cfscript: Self = "cfscript"
//    static let cfc: Self = "cfc"
//    static let chaiscript: Self = "chaiscript"
//    static let cil: Self = "cil"
//    static let cilkc: Self = "cilkc"
//    static let cilk_c: Self = "cilk-c"
//    static let cilkcpp: Self = "cilkcpp"
//    static let cilk_cpp: Self = "cilk-cpp"
//    static let cilk: Self = "cilk"
//    static let clojure: Self = "clojure"
//    static let cmake: Self = "cmake"
//    static let cobol: Self = "cobol"
//    static let coffeescript: Self = "coffeescript"
//    static let coffee: Self = "coffee"
//    static let concurnas: Self = "concurnas"
//    static let conc: Self = "conc"
//    static let csp: Self = "csp"
//    static let cooklang: Self = "cooklang"
//    static let coq: Self = "coq"
//    static let crystal: Self = "crystal"
//    static let css_extras: Self = "css-extras"
//    static let csv: Self = "csv"
//    static let cue: Self = "cue"
//    static let cypher: Self = "cypher"
//    static let d: Self = "d"
//    static let dart: Self = "dart"
//    static let dataweave: Self = "dataweave"
//    static let dax: Self = "dax"
//    static let dhall: Self = "dhall"
//    static let diff: Self = "diff"
//    static let django: Self = "django"
//    static let jinja2: Self = "jinja2"
//    static let dns_zone_file: Self = "dns-zone-file"
//    static let dns_zone: Self = "dns-zone"
//    static let docker: Self = "docker"
//    static let dockerfile: Self = "dockerfile"
//    static let dot: Self = "dot"
//    static let gv: Self = "gv"
//    static let ebnf: Self = "ebnf"
//    static let editorconfig: Self = "editorconfig"
//    static let eiffel: Self = "eiffel"
//    static let ejs: Self = "ejs"
//    static let eta: Self = "eta"
//    static let elixir: Self = "elixir"
//    static let elm: Self = "elm"
//    static let etlua: Self = "etlua"
//    static let erb: Self = "erb"
//    static let erlang: Self = "erlang"
//    static let excel_formula: Self = "excel-formula"
//    static let xlsx: Self = "xlsx"
//    static let xls: Self = "xls"
//    static let fsharp: Self = "fsharp"
//    static let factor: Self = "factor"
//    static let `false`: Self = "false"
//    static let firestore_security_rules: Self = "firestore-security-rules"
//    static let flow: Self = "flow"
//    static let fortran: Self = "fortran"
//    static let ftl: Self = "ftl"
//    static let gml: Self = "gml"
//}
