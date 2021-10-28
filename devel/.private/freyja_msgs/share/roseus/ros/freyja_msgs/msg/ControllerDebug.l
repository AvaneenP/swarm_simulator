;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::ControllerDebug)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'ControllerDebug (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::CONTROLLERDEBUG")
  (make-package "FREYJA_MSGS::CONTROLLERDEBUG"))

(in-package "ROS")
;;//! \htmlinclude ControllerDebug.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::ControllerDebug
  :super ros::object
  :slots (_header _lqr_u _thrust _roll _pitch _yaw _state_valid ))

(defmethod freyja_msgs::ControllerDebug
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lqr_u __lqr_u) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:thrust __thrust) 0.0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:state_valid __state_valid) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lqr_u __lqr_u)
   (setq _thrust (float __thrust))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _state_valid (round __state_valid))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lqr_u
   (&optional __lqr_u)
   (if __lqr_u (setq _lqr_u __lqr_u)) _lqr_u)
  (:thrust
   (&optional __thrust)
   (if __thrust (setq _thrust __thrust)) _thrust)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:state_valid
   (&optional __state_valid)
   (if __state_valid (setq _state_valid __state_valid)) _state_valid)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[4] _lqr_u
    (* 8    4)
    ;; float64 _thrust
    8
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; uint8 _state_valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[4] _lqr_u
     (dotimes (i 4)
       (sys::poke (elt _lqr_u i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _thrust
       (sys::poke _thrust (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _state_valid
       (write-byte _state_valid s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[4] _lqr_u
   (dotimes (i (length _lqr_u))
     (setf (elt _lqr_u i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _thrust
     (setq _thrust (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _state_valid
     (setq _state_valid (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::ControllerDebug :md5sum-) "2232284d6ca530cfbb5e7df4dce8fe0e")
(setf (get freyja_msgs::ControllerDebug :datatype-) "freyja_msgs/ControllerDebug")
(setf (get freyja_msgs::ControllerDebug :definition-)
      "# Debug message from controller.
# Often useful for observers, lqr_u is the 4-axis acceleration vector.
# State can be invalid due to time delay, or a dead source.

Header header
float64[4] lqr_u
float64 thrust
float64 roll
float64 pitch
float64 yaw
uint8 state_valid

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



(provide :freyja_msgs/ControllerDebug "2232284d6ca530cfbb5e7df4dce8fe0e")


