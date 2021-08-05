; Auto-generated. Do not edit!


(cl:in-package mission_waypoints-msg)


;//! \htmlinclude swarm_gps.msg.html

(cl:defclass <swarm_gps> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (vel
    :reader vel
    :initarg :vel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass swarm_gps (<swarm_gps>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <swarm_gps>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'swarm_gps)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mission_waypoints-msg:<swarm_gps> is deprecated: use mission_waypoints-msg:swarm_gps instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <swarm_gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mission_waypoints-msg:pos-val is deprecated.  Use mission_waypoints-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <swarm_gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mission_waypoints-msg:vel-val is deprecated.  Use mission_waypoints-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <swarm_gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mission_waypoints-msg:name-val is deprecated.  Use mission_waypoints-msg:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <swarm_gps>) ostream)
  "Serializes a message object of type '<swarm_gps>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vel) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <swarm_gps>) istream)
  "Deserializes a message object of type '<swarm_gps>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vel) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<swarm_gps>)))
  "Returns string type for a message object of type '<swarm_gps>"
  "mission_waypoints/swarm_gps")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'swarm_gps)))
  "Returns string type for a message object of type 'swarm_gps"
  "mission_waypoints/swarm_gps")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<swarm_gps>)))
  "Returns md5sum for a message object of type '<swarm_gps>"
  "16e62204318dc775aab86123a92688f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'swarm_gps)))
  "Returns md5sum for a message object of type 'swarm_gps"
  "16e62204318dc775aab86123a92688f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<swarm_gps>)))
  "Returns full string definition for message of type '<swarm_gps>"
  (cl:format cl:nil "geometry_msgs/Vector3 pos~%geometry_msgs/Vector3 vel~%string name~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'swarm_gps)))
  "Returns full string definition for message of type 'swarm_gps"
  (cl:format cl:nil "geometry_msgs/Vector3 pos~%geometry_msgs/Vector3 vel~%string name~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <swarm_gps>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vel))
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <swarm_gps>))
  "Converts a ROS message object to a list"
  (cl:list 'swarm_gps
    (cl:cons ':pos (pos msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':name (name msg))
))
