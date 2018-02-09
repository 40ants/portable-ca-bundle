(in-package :cl-user)
(defpackage portable-ca-bundle-test
  (:use :cl
        :portable-ca-bundle
        :prove
        :hamcrest.matchers))
(in-package :portable-ca-bundle-test)


(plan 1)

(subtest "Replace this test with real staff."
  (assert-that (foo 1 2 3)
               (contains 1 2 3)))

(finalize)
