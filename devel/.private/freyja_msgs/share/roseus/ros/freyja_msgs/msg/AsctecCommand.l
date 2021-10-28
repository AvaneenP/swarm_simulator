;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::AsctecCommand)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'AsctecCommand (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::ASCTECCOMMAND")
  (make-package "FREYJA_MSGS::ASCTECCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude AsctecCommand.msg.html


(defclass freyja_msgs::AsctecCommand
  :super ros::object
  :slots (_command_type _roll _pitch _yaw _thrust _ctrl_byte ))

(defmethod freyja_msgs::AsctecCommand
  (:init
   (&key
    ((:command_type __command_type) 0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:thrust __thrust) 0.0)
    ((:ctrl_byte __ctrl_byte) 0)
    )
   (send-super :init)
   (setq _command_type (round __command_type))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _thrust (float __thrust))
   (setq _ctrl_byte (round __ctrl_byte))
   self)
  (:command_type
   (&optional __command_type)
   (if __command_type (setq _command_type __command_type)) _command_type)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:thrust
   (&optional __thrust)
   (if __thrust (setq _thrust __thrust)) _thrust)
  (:ctrl_byte
   (&optional __ctrl_byte)
   (if __ctrl_byte (setq _ctrl_byte __ctrl_byte)) _ctrl_byte)
  (:serialization-length
   ()
   (+
    ;; uint8 _command_type
    1
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _thrust
    8
    ;; uint8 _ctrl_byte
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _command_type
       (write-byte _command_type s)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _thrust
       (sys::poke _thrust (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _ctrl_byte
       (write-byte _ctrl_byte s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _command_type
     (setq _command_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _thrust
     (setq _thrust (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _ctrl_byte
     (setq _ctrl_byte (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::AsctecCommand :md5sum-) "56ac1fe81e2a3c53f5aeb626327e1b63")
(setf (get freyja_msgs::AsctecCommand :datatype-) "freyja_msgs/AsctecCommand")
(setf (get freyja_msgs::AsctecCommand :definition-)
      "# asctec handler common message structure that contains everything commandable
## command_type =   1   :   this message is to turn motors on or off
##                  2   :   this message is to idle the motors
##                  3   :   this message is to command attitudes

uint8 command_type
float64 roll
float64 pitch
float64 yaw
float64 thrust
uint8 ctrl_byte

")



(provide :freyja_msgs/AsctecCommand "56ac1fe81e2a3c53f5aeb626327e1b63")


