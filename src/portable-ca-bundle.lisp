(defpackage portable-ca-bundle
  (:use :cl)
  (:export
   #:with-portable-ca-bundle
   #:with-restored-ca-bundle))
(in-package :portable-ca-bundle)


(defmacro with-portable-ca-bundle (() &body body)
  "This macro stores content of dexador's CA bundle in a variable
and restores it in a temprorary file during execution of a block, wrapped with
with-restored-ca-bundle call.

Use this trick to use dexador from an executable file, distributed to another machine."
  (alexandria:with-unique-names (file-content)
    `(let* ((path dexador.backend.usocket::*ca-bundle*)
            (,file-content (alexandria:read-file-into-string path)))
       (macrolet ((with-restored-ca-bundle (() &body body)
                    `(let* ((temp-path
                              (cl-fad:with-output-to-temporary-file (s)
                                (write-string ,',file-content s)))
                            (dexador.backend.usocket::*ca-bundle* (namestring temp-path)))
                       (unwind-protect (progn ,@body)
                         (delete-file temp-path)))))
         ,@body))))
