; Auto-generated. Do not edit!


(cl:in-package freyja_msgs-msg)


;//! \htmlinclude MotorCommand.msg.html

(cl:defclass <MotorCommand> (roslisp-msg-protocol:ros-message)
  ((motors_state
    :reader motors_state
    :initarg :motors_state
    :type cl:fixnum
    :initform 0)
   (motors_idle
    :reader motors_idle
    :initarg :motors_idle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MotorCommand (<MotorCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name freyja_msgs-msg:<MotorCommand> is deprecated: use freyja_msgs-msg:MotorCommand instead.")))

(cl:ensure-generic-function 'motors_state-val :lambda-list '(m))
(cl:defmethod motors_state-val ((m <MotorCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:motors_state-val is deprecated.  Use freyja_msgs-msg:motors_state instead.")
  (motors_state m))

(cl:ensure-generic-function 'motors_idle-val :lambda-list '(m))
(cl:defmethod motors_idle-val ((m <MotorCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader freyja_msgs-msg:motors_idle-val is deprecated.  Use freyja_msgs-msg:motors_idle instead.")
  (motors_idle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorCommand>) ostream)
  "Serializes a message object of type '<MotorCommand>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motors_state)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motors_idle)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorCommand>) istream)
  "Deserializes a message object of type '<MotorCommand>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motors_state)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motors_idle)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorCommand>)))
  "Returns string type for a message object of type '<MotorCommand>"
  "freyja_msgs/MotorCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorCommand)))
  "Returns string type for a message object of type 'MotorCommand"
  "freyja_msgs/MotorCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorCommand>)))
  "Returns md5sum for a message object of type '<MotorCommand>"
  "47aca326185da674507cd7254ba460ca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorCommand)))
  "Returns md5sum for a message object of type 'MotorCommand"
  "47aca326185da674507cd7254ba460ca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorCommand>)))
  "Returns full string definition for message of type '<MotorCommand>"
  (cl:format cl:nil "# command asctec vehicle to do discrete things~%## motors_state : on(1) or off(0)~%## motors_idle   : (1) forces the motor to idle, (0) does nothing~%uint8 motors_state~%uint8 motors_idle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorCommand)))
  "Returns full string definition for message of type 'MotorCommand"
  (cl:format cl:nil "# command asctec vehicle to do discrete things~%## motors_state : on(1) or off(0)~%## motors_idle   : (1) forces the motor to idle, (0) does nothing~%uint8 motors_state~%uint8 motors_idle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorCommand>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorCommand
    (cl:cons ':motors_state (motors_state msg))
    (cl:cons ':motors_idle (motors_idle msg))
))
