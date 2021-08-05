
(cl:in-package :asdf)

(defsystem "mission_waypoints-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "swarm_gps" :depends-on ("_package_swarm_gps"))
    (:file "_package_swarm_gps" :depends-on ("_package"))
  ))