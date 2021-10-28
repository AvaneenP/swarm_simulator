;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::CtrlCommand)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'CtrlCommand (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::CTRLCOMMAND")
  (make-package "FREYJA_MSGS::CTRLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude CtrlCommand.msg.html


(defclass freyja_msgs::CtrlCommand
  :super ros::object
  :slots (_roll _pitch _yaw _thrust _ctrl_mode ))

(defmethod freyja_msgs::CtrlCommand
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:thrust __thrust) 0.0)
    ((:ctrl_mode __ctrl_mode) 0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _thrust (float __thrust))
   (setq _ctrl_mode (round __ctrl_mode))
   self)
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
  (:ctrl_mode
   (&optional __ctrl_mode)
   (if __ctrl_mode (setq _ctrl_mode __ctrl_mode)) _ctrl_mode)
  (:serialization-length
   ()
   (+
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _thrust
    8
    ;; uint8 _ctrl_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _thrust
       (sys::poke _thrust (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _ctrl_mode
       (write-byte _ctrl_mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _thrust
     (setq _thrust (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _ctrl_mode
     (setq _ctrl_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::CtrlCommand :md5sum-) "3bc13e173942b7e37b7a6e38ce8e178c")
(setf (get freyja_msgs::CtrlCommand :datatype-) "freyja_msgs/CtrlCommand")
(setf (get freyja_msgs::CtrlCommand :definition-)
      "# Control commands for the attitude controller.
# Need to translate differently for AscTec HLP/LLP, PX4, AC etc.
# Attitude in radians, thrust in *Newtons*. No scaling!
# ctrl_mode is:
#    8 bits (asctec): [ x x gps height thrust yaw roll pitch ]
#    8 bits (apm)   : [ x x x x x x yawrate ctrlvalid]
float64 roll
float64 pitch
float64 yaw
float64 thrust
uint8 ctrl_mode

")



(provide :freyja_msgs/CtrlCommand "3bc13e173942b7e37b7a6e38ce8e178c")


