; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude TrajectoryDebug.msg.html

(cl:defclass <TrajectoryDebug> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (system_state
    :reader system_state
    :initarg :system_state
    :type cl:fixnum
    :initform 0)
   (hover_z_target
    :reader hover_z_target
    :initarg :hover_z_target
    :type cl:float
    :initform 0.0))
)

(cl:defclass TrajectoryDebug (<TrajectoryDebug>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryDebug>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryDebug)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<TrajectoryDebug> is deprecated: use freyja_msgs-msg:TrajectoryDebug instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TrajectoryDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:header-val is deprecated.  Use freyja_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'system_state-val :lambda-list '(m))
(cl:defmethod system_state-val ((m <TrajectoryDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:system_state-val is deprecated.  Use freyja_msgs-msg:system_state instead.")
  (system_state m))

(cl:ensure-generic-function 'hover_z_target-val :lambda-list '(m))
(cl:defmethod hover_z_target-val ((m <TrajectoryDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:hover_z_target-val is deprecated.  Use freyja_msgs-msg:hover_z_target instead.")
  (hover_z_target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryDebug>) ostream)
  "Serializes a message object of type '<TrajectoryDebug>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_state)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hover_z_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryDebug>) istream)
  "Deserializes a message object of type '<TrajectoryDebug>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_state)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hover_z_target) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryDebug>)))
  "Returns string type for a message object of type '<TrajectoryDebug>"
  "freyja_msgs/TrajectoryDebug")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryDebug)))
  "Returns string type for a message object of type 'TrajectoryDebug"
  "freyja_msgs/TrajectoryDebug")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryDebug>)))
  "Returns md5sum for a message object of type '<TrajectoryDebug>"
  "5095b0ba555b2f0c0ee575842a1ee607")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryDebug)))
  "Returns md5sum for a message object of type 'TrajectoryDebug"
  "5095b0ba555b2f0c0ee575842a1ee607")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryDebug>)))
  "Returns full string definition for message of type '<TrajectoryDebug>"
  (cl:format cl:nil "# Debug message for trajectory generation~%~%Header header~%uint8 system_state~%float32 hover_z_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryDebug)))
  "Returns full string definition for message of type 'TrajectoryDebug"
  (cl:format cl:nil "# Debug message for trajectory generation~%~%Header header~%uint8 system_state~%float32 hover_z_target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryDebug>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryDebug>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryDebug
    (cl:cons ':header (header msg))
    (cl:cons ':system_state (system_state msg))
    (cl:cons ':hover_z_target (hover_z_target msg))
))
