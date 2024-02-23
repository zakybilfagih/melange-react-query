(lang dune 3.14)

(using melange 0.1)

(generate_opam_files true)

(name melange-react-query)

(version 0.1.0)

(source
 (github zakybilfagih/melange-react-query))

(authors "M. Zaki <zilonesauer@gmail.com>")

(maintainers "M. Zaki <zilonesauer@gmail.com>")

(homepage "https://github.com/zakybilfagih/melange-react-query")

(bug_reports "https://github.com/zakybilfagih/melange-react-query")

(license "MIT")

(package
 (name melange-react-query)
 (synopsis "React Query support for Melange")
 (depends
  (ocaml
   (>= "5.1.1"))
  (melange
   (>= "3.0.0-51"))
  (reason
   (>= "3.10.0"))
  reason-react
  reason-react-ppx
  (opam-check-npm-deps :with-test)
  (ocaml-lsp-server :with-test)
  (dot-merlin-reader :with-test)))
