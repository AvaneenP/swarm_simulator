; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude CurrentState.msg.html

(cl:defclass <CurrentState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state_vector
    :reader state_vector
    :initarg :state_vector
    :type (cl:vector cl:float)
   :initform (cl:make-array 13 :element-type 'cl:float :initial-element 0.0))
   (state_valid
    :reader state_valid
    :initarg :state_valid
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CurrentState (<CurrentState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CurrentState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CurrentState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<CurrentState> is deprecated: use freyja_msgs-msg:CurrentState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CurrentState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:header-val is deprecated.  Use freyja_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state_vector-val :lambda-list '(m))
(cl:defmethod state_vector-val ((m <CurrentState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:state_vector-val is deprecated.  Use freyja_msgs-msg:state_vector instead.")
  (state_vector m))

(cl:ensure-generic-function 'state_valid-val :lambda-list '(m))
(cl:defmethod state_valid-val ((m <CurrentState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:state_valid-val is deprecated.  Use freyja_msgs-msg:state_valid instead.")
  (state_valid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CurrentState>) ostream)
  "Serializes a message object of type '<CurrentState>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state_valid)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CurrentState>) istream)
  "Deserializes a message object of type '<CurrentState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'state_vector) (cl:make-array 13))
  (cl:let ((vals (cl:slot-value msg 'state_vector)))
    (cl:dotimes (i 13)
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state_valid)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CurrentState>)))
  "Returns string type for a message object of type '<CurrentState>"
  "freyja_msgs/CurrentState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CurrentState)))
  "Returns string type for a message object of type 'CurrentState"
  "freyja_msgs/CurrentState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CurrentState>)))
  "Returns md5sum for a message object of type '<CurrentState>"
  "bb3e9083594b5a85032db45485cf4a00")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CurrentState)))
  "Returns md5sum for a message object of type 'CurrentState"
  "bb3e9083594b5a85032db45485cf4a00")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CurrentState>)))
  "Returns full string definition for message of type '<CurrentState>"
  (cl:format cl:nil "# Full state generated for the controller:~%# [pn, pe, pd, vn, ve, vd, roll, pitch, yaw, rrate, prate, yrate, delta_t]~%Header header~%float64[13] state_vector~%uint8       state_valid~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CurrentState)))
  "Returns full string definition for message of type 'CurrentState"
  (cl:format cl:nil "# Full state generated for the controller:~%# [pn, pe, pd, vn, ve, vd, roll, pitch, yaw, rrate, prate, yrate, delta_t]~%Header header~%float64[13] state_vector~%uint8       state_valid~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CurrentState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'state_vector) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CurrentState>))
  "Converts a ROS message object to a list"
  (cl:list 'CurrentState
    (cl:cons ':header (header msg))
    (cl:cons ':state_vector (state_vector msg))
    (cl:cons ':state_valid (state_valid msg))
))
