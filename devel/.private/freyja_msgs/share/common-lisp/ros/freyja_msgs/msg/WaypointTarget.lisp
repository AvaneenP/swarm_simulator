; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude WaypointTarget.msg.html

(cl:defclass <WaypointTarget> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (terminal_pn
    :reader terminal_pn
    :initarg :terminal_pn
    :type cl:float
    :initform 0.0)
   (terminal_pe
    :reader terminal_pe
    :initarg :terminal_pe
    :type cl:float
    :initform 0.0)
   (terminal_pd
    :reader terminal_pd
    :initarg :terminal_pd
    :type cl:float
    :initform 0.0)
   (terminal_vn
    :reader terminal_vn
    :initarg :terminal_vn
    :type cl:float
    :initform 0.0)
   (terminal_ve
    :reader terminal_ve
    :initarg :terminal_ve
    :type cl:float
    :initform 0.0)
   (terminal_vd
    :reader terminal_vd
    :initarg :terminal_vd
    :type cl:float
    :initform 0.0)
   (terminal_yaw
    :reader terminal_yaw
    :initarg :terminal_yaw
    :type cl:float
    :initform 0.0)
   (allocated_time
    :reader allocated_time
    :initarg :allocated_time
    :type cl:float
    :initform 0.0)
   (translational_speed
    :reader translational_speed
    :initarg :translational_speed
    :type cl:float
    :initform 0.0)
   (waypoint_mode
    :reader waypoint_mode
    :initarg :waypoint_mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass WaypointTarget (<WaypointTarget>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointTarget>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointTarget)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<WaypointTarget> is deprecated: use freyja_msgs-msg:WaypointTarget instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:header-val is deprecated.  Use freyja_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'terminal_pn-val :lambda-list '(m))
(cl:defmethod terminal_pn-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_pn-val is deprecated.  Use freyja_msgs-msg:terminal_pn instead.")
  (terminal_pn m))

(cl:ensure-generic-function 'terminal_pe-val :lambda-list '(m))
(cl:defmethod terminal_pe-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_pe-val is deprecated.  Use freyja_msgs-msg:terminal_pe instead.")
  (terminal_pe m))

(cl:ensure-generic-function 'terminal_pd-val :lambda-list '(m))
(cl:defmethod terminal_pd-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_pd-val is deprecated.  Use freyja_msgs-msg:terminal_pd instead.")
  (terminal_pd m))

(cl:ensure-generic-function 'terminal_vn-val :lambda-list '(m))
(cl:defmethod terminal_vn-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_vn-val is deprecated.  Use freyja_msgs-msg:terminal_vn instead.")
  (terminal_vn m))

(cl:ensure-generic-function 'terminal_ve-val :lambda-list '(m))
(cl:defmethod terminal_ve-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_ve-val is deprecated.  Use freyja_msgs-msg:terminal_ve instead.")
  (terminal_ve m))

(cl:ensure-generic-function 'terminal_vd-val :lambda-list '(m))
(cl:defmethod terminal_vd-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_vd-val is deprecated.  Use freyja_msgs-msg:terminal_vd instead.")
  (terminal_vd m))

(cl:ensure-generic-function 'terminal_yaw-val :lambda-list '(m))
(cl:defmethod terminal_yaw-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:terminal_yaw-val is deprecated.  Use freyja_msgs-msg:terminal_yaw instead.")
  (terminal_yaw m))

(cl:ensure-generic-function 'allocated_time-val :lambda-list '(m))
(cl:defmethod allocated_time-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:allocated_time-val is deprecated.  Use freyja_msgs-msg:allocated_time instead.")
  (allocated_time m))

(cl:ensure-generic-function 'translational_speed-val :lambda-list '(m))
(cl:defmethod translational_speed-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:translational_speed-val is deprecated.  Use freyja_msgs-msg:translational_speed instead.")
  (translational_speed m))

(cl:ensure-generic-function 'waypoint_mode-val :lambda-list '(m))
(cl:defmethod waypoint_mode-val ((m <WaypointTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:waypoint_mode-val is deprecated.  Use freyja_msgs-msg:waypoint_mode instead.")
  (waypoint_mode m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<WaypointTarget>)))
    "Constants for message type '<WaypointTarget>"
  '((:TIME . 0)
    (:SPEED . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'WaypointTarget)))
    "Constants for message type 'WaypointTarget"
  '((:TIME . 0)
    (:SPEED . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointTarget>) ostream)
  "Serializes a message object of type '<WaypointTarget>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_pn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_pe))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_pd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_vn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_ve))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_vd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'terminal_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'allocated_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'translational_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waypoint_mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointTarget>) istream)
  "Deserializes a message object of type '<WaypointTarget>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_pn) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_pe) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_pd) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_vn) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_ve) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_vd) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'terminal_yaw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'allocated_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'translational_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'waypoint_mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointTarget>)))
  "Returns string type for a message object of type '<WaypointTarget>"
  "freyja_msgs/WaypointTarget")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointTarget)))
  "Returns string type for a message object of type 'WaypointTarget"
  "freyja_msgs/WaypointTarget")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointTarget>)))
  "Returns md5sum for a message object of type '<WaypointTarget>"
  "a15b2f6401b97924332941dc39790f93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointTarget)))
  "Returns md5sum for a message object of type 'WaypointTarget"
  "a15b2f6401b97924332941dc39790f93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointTarget>)))
  "Returns full string definition for message of type '<WaypointTarget>"
  (cl:format cl:nil "# Discrete waypoint for a waypoint handler to convert into ReferenceState.~%~%Header header~%float64 terminal_pn~%float64 terminal_pe~%float64 terminal_pd~%float64 terminal_vn~%float64 terminal_ve~%float64 terminal_vd~%float64 terminal_yaw~%~%# time allocated to travel from 'here' to the target~%float32 allocated_time~%# use a constant speed instead of allocated_time(see flag below)~%float32 translational_speed~%~%# use allocated_time OR use translational_speed~%uint8 TIME  = 0~%uint8 SPEED = 1~%uint8 waypoint_mode~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointTarget)))
  "Returns full string definition for message of type 'WaypointTarget"
  (cl:format cl:nil "# Discrete waypoint for a waypoint handler to convert into ReferenceState.~%~%Header header~%float64 terminal_pn~%float64 terminal_pe~%float64 terminal_pd~%float64 terminal_vn~%float64 terminal_ve~%float64 terminal_vd~%float64 terminal_yaw~%~%# time allocated to travel from 'here' to the target~%float32 allocated_time~%# use a constant speed instead of allocated_time(see flag below)~%float32 translational_speed~%~%# use allocated_time OR use translational_speed~%uint8 TIME  = 0~%uint8 SPEED = 1~%uint8 waypoint_mode~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointTarget>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     8
     8
     8
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointTarget>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointTarget
    (cl:cons ':header (header msg))
    (cl:cons ':terminal_pn (terminal_pn msg))
    (cl:cons ':terminal_pe (terminal_pe msg))
    (cl:cons ':terminal_pd (terminal_pd msg))
    (cl:cons ':terminal_vn (terminal_vn msg))
    (cl:cons ':terminal_ve (terminal_ve msg))
    (cl:cons ':terminal_vd (terminal_vd msg))
    (cl:cons ':terminal_yaw (terminal_yaw msg))
    (cl:cons ':allocated_time (allocated_time msg))
    (cl:cons ':translational_speed (translational_speed msg))
    (cl:cons ':waypoint_mode (waypoint_mode msg))
))
