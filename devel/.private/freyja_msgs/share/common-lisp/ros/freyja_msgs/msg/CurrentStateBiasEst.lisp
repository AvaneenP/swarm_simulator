; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude CurrentStateBiasEst.msg.html

(cl:defclass <CurrentStateBiasEst> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state_vector
    :reader state_vector
    :initarg :state_vector
    :type (cl:vector cl:float)
   :initform (cl:make-array 12 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass CurrentStateBiasEst (<CurrentStateBiasEst>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CurrentStateBiasEst>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CurrentStateBiasEst)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<CurrentStateBiasEst> is deprecated: use freyja_msgs-msg:CurrentStateBiasEst instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CurrentStateBiasEst>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:header-val is deprecated.  Use freyja_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state_vector-val :lambda-list '(m))
(cl:defmethod state_vector-val ((m <CurrentStateBiasEst>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:state_vector-val is deprecated.  Use freyja_msgs-msg:state_vector instead.")
  (state_vector m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CurrentStateBiasEst>) ostream)
  "Serializes a message object of type '<CurrentStateBiasEst>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'state_vector))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CurrentStateBiasEst>) istream)
  "Deserializes a message object of type '<CurrentStateBiasEst>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'state_vector) (cl:make-array 12))
  (cl:let ((vals (cl:slot-value msg 'state_vector)))
    (cl:dotimes (i 12)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CurrentStateBiasEst>)))
  "Returns string type for a message object of type '<CurrentStateBiasEst>"
  "freyja_msgs/CurrentStateBiasEst")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CurrentStateBiasEst)))
  "Returns string type for a message object of type 'CurrentStateBiasEst"
  "freyja_msgs/CurrentStateBiasEst")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CurrentStateBiasEst>)))
  "Returns md5sum for a message object of type '<CurrentStateBiasEst>"
  "1ab5d62c27ac2f41f121e92a2fdaa3ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CurrentStateBiasEst)))
  "Returns md5sum for a message object of type 'CurrentStateBiasEst"
  "1ab5d62c27ac2f41f121e92a2fdaa3ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CurrentStateBiasEst>)))
  "Returns full string definition for message of type '<CurrentStateBiasEst>"
  (cl:format cl:nil "# Estimated state augmented with bias estimates~%# [pn, pe, pd, vn, ve, vd, bn, be, bd, debug1, debug2, debug3]~%# Use debug to monitor the variance of estimator, for instance.~%Header header~%float64[12] state_vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CurrentStateBiasEst)))
  "Returns full string definition for message of type 'CurrentStateBiasEst"
  (cl:format cl:nil "# Estimated state augmented with bias estimates~%# [pn, pe, pd, vn, ve, vd, bn, be, bd, debug1, debug2, debug3]~%# Use debug to monitor the variance of estimator, for instance.~%Header header~%float64[12] state_vector~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CurrentStateBiasEst>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'state_vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CurrentStateBiasEst>))
  "Converts a ROS message object to a list"
  (cl:list 'CurrentStateBiasEst
    (cl:cons ':header (header msg))
    (cl:cons ':state_vector (state_vector msg))
))
