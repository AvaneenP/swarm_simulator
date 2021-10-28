;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::TrajectoryDebug)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'TrajectoryDebug (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::TRAJECTORYDEBUG")
  (make-package "FREYJA_MSGS::TRAJECTORYDEBUG"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryDebug.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::TrajectoryDebug
  :super ros::object
  :slots (_header _system_state _hover_z_target ))

(defmethod freyja_msgs::TrajectoryDebug
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:system_state __system_state) 0)
    ((:hover_z_target __hover_z_target) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _system_state (round __system_state))
   (setq _hover_z_target (float __hover_z_target))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:system_state
   (&optional __system_state)
   (if __system_state (setq _system_state __system_state)) _system_state)
  (:hover_z_target
   (&optional __hover_z_target)
   (if __hover_z_target (setq _hover_z_target __hover_z_target)) _hover_z_target)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _system_state
    1
    ;; float32 _hover_z_target
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _system_state
       (write-byte _system_state s)
     ;; float32 _hover_z_target
       (sys::poke _hover_z_target (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _system_state
     (setq _system_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _hover_z_target
     (setq _hover_z_target (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get freyja_msgs::TrajectoryDebug :md5sum-) "5095b0ba555b2f0c0ee575842a1ee607")
(setf (get freyja_msgs::TrajectoryDebug :datatype-) "freyja_msgs/TrajectoryDebug")
(setf (get freyja_msgs::TrajectoryDebug :definition-)
      "# Debug message for trajectory generation

Header header
uint8 system_state
float32 hover_z_target

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



(provide :freyja_msgs/TrajectoryDebug "5095b0ba555b2f0c0ee575842a1ee607")


