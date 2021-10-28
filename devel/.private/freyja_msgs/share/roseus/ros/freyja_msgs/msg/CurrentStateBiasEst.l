;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::CurrentStateBiasEst)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'CurrentStateBiasEst (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::CURRENTSTATEBIASEST")
  (make-package "FREYJA_MSGS::CURRENTSTATEBIASEST"))

(in-package "ROS")
;;//! \htmlinclude CurrentStateBiasEst.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::CurrentStateBiasEst
  :super ros::object
  :slots (_header _state_vector ))

(defmethod freyja_msgs::CurrentStateBiasEst
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state_vector __state_vector) (make-array 12 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _state_vector __state_vector)
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
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[12] _state_vector
    (* 8    12)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[12] _state_vector
     (dotimes (i 12)
       (sys::poke (elt _state_vector i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[12] _state_vector
   (dotimes (i (length _state_vector))
     (setf (elt _state_vector i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get freyja_msgs::CurrentStateBiasEst :md5sum-) "1ab5d62c27ac2f41f121e92a2fdaa3ca")
(setf (get freyja_msgs::CurrentStateBiasEst :datatype-) "freyja_msgs/CurrentStateBiasEst")
(setf (get freyja_msgs::CurrentStateBiasEst :definition-)
      "# Estimated state augmented with bias estimates
# [pn, pe, pd, vn, ve, vd, bn, be, bd, debug1, debug2, debug3]
# Use debug to monitor the variance of estimator, for instance.
Header header
float64[12] state_vector

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



(provide :freyja_msgs/CurrentStateBiasEst "1ab5d62c27ac2f41f121e92a2fdaa3ca")


