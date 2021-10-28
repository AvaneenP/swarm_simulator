
(cl:in-package :asdf)

(defsystem "freyja_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
  ))