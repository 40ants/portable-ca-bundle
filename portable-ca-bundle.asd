#|
  This file is a part of portable-ca-bundle project.
|#


(in-package :cl-user)
(defpackage portable-ca-bundle-asd
  (:use :cl :asdf))
(in-package :portable-ca-bundle-asd)


(defsystem portable-ca-bundle
  :version (:read-file-form "version.lisp-expr")
  :author ""
  :license ""
  :depends-on (alexandria
               cl-fad
               dexador)
  :components ((:module "src"
                :components
                ((:file "portable-ca-bundle"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.rst"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq)
                (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op portable-ca-bundle-test))))

