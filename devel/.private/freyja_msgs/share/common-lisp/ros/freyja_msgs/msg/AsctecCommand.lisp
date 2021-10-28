; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude AsctecCommand.msg.html

(cl:defclass <AsctecCommand> (roslisp-msg-protocol:ros-message)
  ((command_type
    :reader command_type
    :initarg :command_type
    :type cl:fixnum
    :initform 0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (thrust
    :reader thrust
    :initarg :thrust
    :type cl:float
    :initform 0.0)
   (ctrl_byte
    :reader ctrl_byte
    :initarg :ctrl_byte
    :type cl:fixnum
    :initform 0))
)

(cl:defclass AsctecCommand (<AsctecCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AsctecCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AsctecCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<AsctecCommand> is deprecated: use freyja_msgs-msg:AsctecCommand instead.")))

(cl:ensure-generic-function 'command_type-val :lambda-list '(m))
(cl:defmethod command_type-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:command_type-val is deprecated.  Use freyja_msgs-msg:command_type instead.")
  (command_type m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:roll-val is deprecated.  Use freyja_msgs-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:pitch-val is deprecated.  Use freyja_msgs-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:yaw-val is deprecated.  Use freyja_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'thrust-val :lambda-list '(m))
(cl:defmethod thrust-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:thrust-val is deprecated.  Use freyja_msgs-msg:thrust instead.")
  (thrust m))

(cl:ensure-generic-function 'ctrl_byte-val :lambda-list '(m))
(cl:defmethod ctrl_byte-val ((m <AsctecCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:ctrl_byte-val is deprecated.  Use freyja_msgs-msg:ctrl_byte instead.")
  (ctrl_byte m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AsctecCommand>) ostream)
  "Serializes a message object of type '<AsctecCommand>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command_type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'thrust))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_byte)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AsctecCommand>) istream)
  "Deserializes a message object of type '<AsctecCommand>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command_type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thrust) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ctrl_byte)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AsctecCommand>)))
  "Returns string type for a message object of type '<AsctecCommand>"
  "freyja_msgs/AsctecCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AsctecCommand)))
  "Returns string type for a message object of type 'AsctecCommand"
  "freyja_msgs/AsctecCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AsctecCommand>)))
  "Returns md5sum for a message object of type '<AsctecCommand>"
  "56ac1fe81e2a3c53f5aeb626327e1b63")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AsctecCommand)))
  "Returns md5sum for a message object of type 'AsctecCommand"
  "56ac1fe81e2a3c53f5aeb626327e1b63")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AsctecCommand>)))
  "Returns full string definition for message of type '<AsctecCommand>"
  (cl:format cl:nil "# asctec handler common message structure that contains everything commandable~%## command_type =   1   :   this message is to turn motors on or off~%##                  2   :   this message is to idle the motors~%##                  3   :   this message is to command attitudes~%~%uint8 command_type~%float64 roll~%float64 pitch~%float64 yaw~%float64 thrust~%uint8 ctrl_byte~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AsctecCommand)))
  "Returns full string definition for message of type 'AsctecCommand"
  (cl:format cl:nil "# asctec handler common message structure that contains everything commandable~%## command_type =   1   :   this message is to turn motors on or off~%##                  2   :   this message is to idle the motors~%##                  3   :   this message is to command attitudes~%~%uint8 command_type~%float64 roll~%float64 pitch~%float64 yaw~%float64 thrust~%uint8 ctrl_byte~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AsctecCommand>))
  (cl:+ 0
     1
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AsctecCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'AsctecCommand
    (cl:cons ':command_type (command_type msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':thrust (thrust msg))
    (cl:cons ':ctrl_byte (ctrl_byte msg))
))
