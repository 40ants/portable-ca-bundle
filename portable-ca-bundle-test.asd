#|
  This file is a part of portable-ca-bundle project.
|#

(in-package :cl-user)
(defpackage portable-ca-bundle-test-asd
  (:use :cl :asdf))
(in-package :portable-ca-bundle-test-asd)

(defsystem portable-ca-bundle-test
  :author ""
  :license ""
  :depends-on (:portable-ca-bundle
               :prove
               :hamcrest-prove)
  :components ((:module "t"
                :components
                ((:test-file "portable-ca-bundle"))))
  :description "Test system for portable-ca-bundle"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
