;; Auto-generated. Do not edit!


(when (boundp 'mission_waypoints::swarm_gps)
  (if (not (find-package "MISSION_WAYPOINTS"))
    (make-package "MISSION_WAYPOINTS"))
  (shadow 'swarm_gps (find-package "MISSION_WAYPOINTS")))
(unless (find-package "MISSION_WAYPOINTS::SWARM_GPS")
  (make-package "MISSION_WAYPOINTS::SWARM_GPS"))

(in-package "ROS")
;;//! \htmlinclude swarm_gps.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mission_waypoints::swarm_gps
  :super ros::object
  :slots (_pos _vel _name ))

(defmethod mission_waypoints::swarm_gps
  (:init
   (&key
    ((:pos __pos) (instance geometry_msgs::Vector3 :init))
    ((:vel __vel) (instance geometry_msgs::Vector3 :init))
    ((:name __name) "")
    )
   (send-super :init)
   (setq _pos __pos)
   (setq _vel __vel)
   (setq _name (string __name))
   self)
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:vel
   (&rest __vel)
   (if (keywordp (car __vel))
       (send* _vel __vel)
     (progn
       (if __vel (setq _vel (car __vel)))
       _vel)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _pos
    (send _pos :serialization-length)
    ;; geometry_msgs/Vector3 _vel
    (send _vel :serialization-length)
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _pos
       (send _pos :serialize s)
     ;; geometry_msgs/Vector3 _vel
       (send _vel :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; geometry_msgs/Vector3 _vel
     (send _vel :deserialize buf ptr-) (incf ptr- (send _vel :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mission_waypoints::swarm_gps :md5sum-) "16e62204318dc775aab86123a92688f3")
(setf (get mission_waypoints::swarm_gps :datatype-) "mission_waypoints/swarm_gps")
(setf (get mission_waypoints::swarm_gps :definition-)
      "geometry_msgs/Vector3 pos
geometry_msgs/Vector3 vel
string name
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :mission_waypoints/swarm_gps "16e62204318dc775aab86123a92688f3")


