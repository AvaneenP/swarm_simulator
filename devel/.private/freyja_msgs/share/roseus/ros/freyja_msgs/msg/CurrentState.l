;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::CurrentState)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'CurrentState (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::CURRENTSTATE")
  (make-package "FREYJA_MSGS::CURRENTSTATE"))

(in-package "ROS")
;;//! \htmlinclude CurrentState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::CurrentState
  :super ros::object
  :slots (_header _state_vector _state_valid ))

(defmethod freyja_msgs::CurrentState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state_vector __state_vector) (make-array 13 :initial-element 0.0 :element-type :float))
    ((:state_valid __state_valid) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _state_vector __state_vector)
   (setq _state_valid (round __state_valid))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state_vector
   (&optional __state_vector)
   (if __state_vector (setq _state_vector __state_vector)) _state_vector)
  (:state_valid
   (&optional __state_valid)
   (if __state_valid (setq _state_valid __state_valid)) _state_valid)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[13] _state_vector
    (* 8    13)
    ;; uint8 _state_valid
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[13] _state_vector
     (dotimes (i 13)
       (sys::poke (elt _state_vector i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; uint8 _state_valid
       (write-byte _state_valid s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[13] _state_vector
   (dotimes (i (length _state_vector))
     (setf (elt _state_vector i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; uint8 _state_valid
     (setq _state_valid (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::CurrentState :md5sum-) "bb3e9083594b5a85032db45485cf4a00")
(setf (get freyja_msgs::CurrentState :datatype-) "freyja_msgs/CurrentState")
(setf (get freyja_msgs::CurrentState :definition-)
      "# Full state generated for the controller:
# [pn, pe, pd, vn, ve, vd, roll, pitch, yaw, rrate, prate, yrate, delta_t]
Header header
float64[13] state_vector
uint8       state_valid

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



(provide :freyja_msgs/CurrentState "bb3e9083594b5a85032db45485cf4a00")


