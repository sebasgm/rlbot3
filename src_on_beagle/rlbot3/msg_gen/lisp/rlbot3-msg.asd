
(cl:in-package :asdf)

(defsystem "rlbot3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Drive" :depends-on ("_package_Drive"))
    (:file "_package_Drive" :depends-on ("_package"))
    (:file "motorsPWM" :depends-on ("_package_motorsPWM"))
    (:file "_package_motorsPWM" :depends-on ("_package"))
  ))