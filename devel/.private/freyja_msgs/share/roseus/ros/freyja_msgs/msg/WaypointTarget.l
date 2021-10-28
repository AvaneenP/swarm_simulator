;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::WaypointTarget)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'WaypointTarget (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::WAYPOINTTARGET")
  (make-package "FREYJA_MSGS::WAYPOINTTARGET"))

(in-package "ROS")
;;//! \htmlinclude WaypointTarget.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*TIME*" (find-package "FREYJA_MSGS::WAYPOINTTARGET"))
(shadow '*TIME* (find-package "FREYJA_MSGS::WAYPOINTTARGET"))
(defconstant freyja_msgs::WaypointTarget::*TIME* 0)
(intern "*SPEED*" (find-package "FREYJA_MSGS::WAYPOINTTARGET"))
(shadow '*SPEED* (find-package "FREYJA_MSGS::WAYPOINTTARGET"))
(defconstant freyja_msgs::WaypointTarget::*SPEED* 1)
(defclass freyja_msgs::WaypointTarget
  :super ros::object
  :slots (_header _terminal_pn _terminal_pe _terminal_pd _terminal_vn _terminal_ve _terminal_vd _terminal_yaw _allocated_time _translational_speed _waypoint_mode ))

(defmethod freyja_msgs::WaypointTarget
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:terminal_pn __terminal_pn) 0.0)
    ((:terminal_pe __terminal_pe) 0.0)
    ((:terminal_pd __terminal_pd) 0.0)
    ((:terminal_vn __terminal_vn) 0.0)
    ((:terminal_ve __terminal_ve) 0.0)
    ((:terminal_vd __terminal_vd) 0.0)
    ((:terminal_yaw __terminal_yaw) 0.0)
    ((:allocated_time __allocated_time) 0.0)
    ((:translational_speed __translational_speed) 0.0)
    ((:waypoint_mode __waypoint_mode) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _terminal_pn (float __terminal_pn))
   (setq _terminal_pe (float __terminal_pe))
   (setq _terminal_pd (float __terminal_pd))
   (setq _terminal_vn (float __terminal_vn))
   (setq _terminal_ve (float __terminal_ve))
   (setq _terminal_vd (float __terminal_vd))
   (setq _terminal_yaw (float __terminal_yaw))
   (setq _allocated_time (float __allocated_time))
   (setq _translational_speed (float __translational_speed))
   (setq _waypoint_mode (round __waypoint_mode))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:terminal_pn
   (&optional __terminal_pn)
   (if __terminal_pn (setq _terminal_pn __terminal_pn)) _terminal_pn)
  (:terminal_pe
   (&optional __terminal_pe)
   (if __terminal_pe (setq _terminal_pe __terminal_pe)) _terminal_pe)
  (:terminal_pd
   (&optional __terminal_pd)
   (if __terminal_pd (setq _terminal_pd __terminal_pd)) _terminal_pd)
  (:terminal_vn
   (&optional __terminal_vn)
   (if __terminal_vn (setq _terminal_vn __terminal_vn)) _terminal_vn)
  (:terminal_ve
   (&optional __terminal_ve)
   (if __terminal_ve (setq _terminal_ve __terminal_ve)) _terminal_ve)
  (:terminal_vd
   (&optional __terminal_vd)
   (if __terminal_vd (setq _terminal_vd __terminal_vd)) _terminal_vd)
  (:terminal_yaw
   (&optional __terminal_yaw)
   (if __terminal_yaw (setq _terminal_yaw __terminal_yaw)) _terminal_yaw)
  (:allocated_time
   (&optional __allocated_time)
   (if __allocated_time (setq _allocated_time __allocated_time)) _allocated_time)
  (:translational_speed
   (&optional __translational_speed)
   (if __translational_speed (setq _translational_speed __translational_speed)) _translational_speed)
  (:waypoint_mode
   (&optional __waypoint_mode)
   (if __waypoint_mode (setq _waypoint_mode __waypoint_mode)) _waypoint_mode)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _terminal_pn
    8
    ;; float64 _terminal_pe
    8
    ;; float64 _terminal_pd
    8
    ;; float64 _terminal_vn
    8
    ;; float64 _terminal_ve
    8
    ;; float64 _terminal_vd
    8
    ;; float64 _terminal_yaw
    8
    ;; float32 _allocated_time
    4
    ;; float32 _translational_speed
    4
    ;; uint8 _waypoint_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _terminal_pn
       (sys::poke _terminal_pn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_pe
       (sys::poke _terminal_pe (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_pd
       (sys::poke _terminal_pd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_vn
       (sys::poke _terminal_vn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_ve
       (sys::poke _terminal_ve (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_vd
       (sys::poke _terminal_vd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _terminal_yaw
       (sys::poke _terminal_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _allocated_time
       (sys::poke _allocated_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _translational_speed
       (sys::poke _translational_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _waypoint_mode
       (write-byte _waypoint_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _terminal_pn
     (setq _terminal_pn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_pe
     (setq _terminal_pe (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_pd
     (setq _terminal_pd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_vn
     (setq _terminal_vn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_ve
     (setq _terminal_ve (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_vd
     (setq _terminal_vd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _terminal_yaw
     (setq _terminal_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _allocated_time
     (setq _allocated_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _translational_speed
     (setq _translational_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _waypoint_mode
     (setq _waypoint_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::WaypointTarget :md5sum-) "a15b2f6401b97924332941dc39790f93")
(setf (get freyja_msgs::WaypointTarget :datatype-) "freyja_msgs/WaypointTarget")
(setf (get freyja_msgs::WaypointTarget :definition-)
      "# Discrete waypoint for a waypoint handler to convert into ReferenceState.

Header header
float64 terminal_pn
float64 terminal_pe
float64 terminal_pd
float64 terminal_vn
float64 terminal_ve
float64 terminal_vd
float64 terminal_yaw

# time allocated to travel from 'here' to the target
float32 allocated_time
# use a constant speed instead of allocated_time(see flag below)
float32 translational_speed

# use allocated_time OR use translational_speed
uint8 TIME  = 0
uint8 SPEED = 1
uint8 waypoint_mode

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :freyja_msgs/WaypointTarget "a15b2f6401b97924332941dc39790f93")


