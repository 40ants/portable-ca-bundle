=================
 portable-ca-bundle
=================

.. insert-your badges like that:

.. image:: https://travis-ci.org/40ants/portable-ca-bundle.svg?branch=master
    :target: https://travis-ci.org/40ants/portable-ca-bundle

.. Everything starting from this commit will be inserted into the
   index page of the HTML documentation.
.. include-from

This system defines a macro to restore
``dexador.backend.usocket::*ca-bundle*`` variable's value. By default,
this variable points to a file located inside ``dexador`` system, but
when you've built a binary and distributed it to another machine, lisp
is unable to find that file.


``with-portable-ca-bundle`` macro should be used at the top level and
wrap your "main" function. It will read ca-bundle file into the memory
and provide another macro ``with-restored-ca-bundle``, which can be used
inside of the "main" function to dump ca-bundle into the temprorary file
and point ``dexador.backend.usocket::*ca-bundle*`` there.

Here is how you should use it:

.. code-block:: common-lisp

   (with-portable-ca-bundle ()
     (defun main (&rest args)
       (with-restored-ca-bundle ()
         (format t "RESPONSE: ~A~%"
                 (dexador:get "https://google.com/")))))


.. Everything after this comment will be omitted from HTML docs.
.. include-to


