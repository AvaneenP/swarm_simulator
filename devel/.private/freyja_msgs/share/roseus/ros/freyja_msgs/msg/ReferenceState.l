;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::ReferenceState)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'ReferenceState (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::REFERENCESTATE")
  (make-package "FREYJA_MSGS::REFERENCESTATE"))

(in-package "ROS")
;;//! \htmlinclude ReferenceState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::ReferenceState
  :super ros::object
  :slots (_header _pn _pe _pd _vn _ve _vd _yaw _an _ae _ad ))

(defmethod freyja_msgs::ReferenceState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pn __pn) 0.0)
    ((:pe __pe) 0.0)
    ((:pd __pd) 0.0)
    ((:vn __vn) 0.0)
    ((:ve __ve) 0.0)
    ((:vd __vd) 0.0)
    ((:yaw __yaw) 0.0)
    ((:an __an) 0.0)
    ((:ae __ae) 0.0)
    ((:ad __ad) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pn (float __pn))
   (setq _pe (float __pe))
   (setq _pd (float __pd))
   (setq _vn (float __vn))
   (setq _ve (float __ve))
   (setq _vd (float __vd))
   (setq _yaw (float __yaw))
   (setq _an (float __an))
   (setq _ae (float __ae))
   (setq _ad (float __ad))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pn
   (&optional __pn)
   (if __pn (setq _pn __pn)) _pn)
  (:pe
   (&optional __pe)
   (if __pe (setq _pe __pe)) _pe)
  (:pd
   (&optional __pd)
   (if __pd (setq _pd __pd)) _pd)
  (:vn
   (&optional __vn)
   (if __vn (setq _vn __vn)) _vn)
  (:ve
   (&optional __ve)
   (if __ve (setq _ve __ve)) _ve)
  (:vd
   (&optional __vd)
   (if __vd (setq _vd __vd)) _vd)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:an
   (&optional __an)
   (if __an (setq _an __an)) _an)
  (:ae
   (&optional __ae)
   (if __ae (setq _ae __ae)) _ae)
  (:ad
   (&optional __ad)
   (if __ad (setq _ad __ad)) _ad)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _pn
    8
    ;; float64 _pe
    8
    ;; float64 _pd
    8
    ;; float64 _vn
    8
    ;; float64 _ve
    8
    ;; float64 _vd
    8
    ;; float64 _yaw
    8
    ;; float64 _an
    8
    ;; float64 _ae
    8
    ;; float64 _ad
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _pn
       (sys::poke _pn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pe
       (sys::poke _pe (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pd
       (sys::poke _pd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vn
       (sys::poke _vn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ve
       (sys::poke _ve (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vd
       (sys::poke _vd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _an
       (sys::poke _an (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ae
       (sys::poke _ae (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ad
       (sys::poke _ad (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _pn
     (setq _pn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pe
     (setq _pe (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pd
     (setq _pd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vn
     (setq _vn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ve
     (setq _ve (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vd
     (setq _vd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _an
     (setq _an (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ae
     (setq _ae (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ad
     (setq _ad (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get freyja_msgs::ReferenceState :md5sum-) "01a1c8686cad14cd024a0eabf82f6a91")
(setf (get freyja_msgs::ReferenceState :datatype-) "freyja_msgs/ReferenceState")
(setf (get freyja_msgs::ReferenceState :definition-)
      "# Reference 10-element state for the controller to follow.
Header header

float64 pn
float64 pe
float64 pd
float64 vn
float64 ve
float64 vd
float64 yaw
float64 an
float64 ae
float64 ad

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



(provide :freyja_msgs/ReferenceState "01a1c8686cad14cd024a0eabf82f6a91")


