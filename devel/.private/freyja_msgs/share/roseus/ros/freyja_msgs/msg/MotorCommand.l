;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::MotorCommand)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'MotorCommand (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::MOTORCOMMAND")
  (make-package "FREYJA_MSGS::MOTORCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude MotorCommand.msg.html


(defclass freyja_msgs::MotorCommand
  :super ros::object
  :slots (_motors_state _motors_idle ))

(defmethod freyja_msgs::MotorCommand
  (:init
   (&key
    ((:motors_state __motors_state) 0)
    ((:motors_idle __motors_idle) 0)
    )
   (send-super :init)
   (setq _motors_state (round __motors_state))
   (setq _motors_idle (round __motors_idle))
   self)
  (:motors_state
   (&optional __motors_state)
   (if __motors_state (setq _motors_state __motors_state)) _motors_state)
  (:motors_idle
   (&optional __motors_idle)
   (if __motors_idle (setq _motors_idle __motors_idle)) _motors_idle)
  (:serialization-length
   ()
   (+
    ;; uint8 _motors_state
    1
    ;; uint8 _motors_idle
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _motors_state
       (write-byte _motors_state s)
     ;; uint8 _motors_idle
       (write-byte _motors_idle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _motors_state
     (setq _motors_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motors_idle
     (setq _motors_idle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::MotorCommand :md5sum-) "47aca326185da674507cd7254ba460ca")
(setf (get freyja_msgs::MotorCommand :datatype-) "freyja_msgs/MotorCommand")
(setf (get freyja_msgs::MotorCommand :definition-)
      "# command asctec vehicle to do discrete things
## motors_state : on(1) or off(0)
## motors_idle   : (1) forces the motor to idle, (0) does nothing
uint8 motors_state
uint8 motors_idle

")



(provide :freyja_msgs/MotorCommand "47aca326185da674507cd7254ba460ca")


