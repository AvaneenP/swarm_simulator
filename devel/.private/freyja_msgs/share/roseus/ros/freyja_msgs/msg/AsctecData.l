;; Auto-generated. Do not edit!


(when (boundp 'freyja_msgs::AsctecData)
  (if (not (find-package "FREYJA_MSGS"))
    (make-package "FREYJA_MSGS"))
  (shadow 'AsctecData (find-package "FREYJA_MSGS")))
(unless (find-package "FREYJA_MSGS::ASCTECDATA")
  (make-package "FREYJA_MSGS::ASCTECDATA"))

(in-package "ROS")
;;//! \htmlinclude AsctecData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass freyja_msgs::AsctecData
  :super ros::object
  :slots (_header _lat _lon _best_lat _best_lon _hgt _sp_x _sp_y _best_sp_x _best_sp_y _best_sp_z _heading_angle _pitch_angle _roll_angle _yaw_angle _pitch_anglevel _roll_anglevel _yaw_anglevel _accx _accy _accz _motor1rpm _motor2rpm _motor3rpm _motor4rpm _motor5rpm _motor6rpm ))

(defmethod freyja_msgs::AsctecData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lat __lat) 0)
    ((:lon __lon) 0)
    ((:best_lat __best_lat) 0)
    ((:best_lon __best_lon) 0)
    ((:hgt __hgt) 0)
    ((:sp_x __sp_x) 0)
    ((:sp_y __sp_y) 0)
    ((:best_sp_x __best_sp_x) 0)
    ((:best_sp_y __best_sp_y) 0)
    ((:best_sp_z __best_sp_z) 0)
    ((:heading_angle __heading_angle) 0)
    ((:pitch_angle __pitch_angle) 0)
    ((:roll_angle __roll_angle) 0)
    ((:yaw_angle __yaw_angle) 0)
    ((:pitch_anglevel __pitch_anglevel) 0)
    ((:roll_anglevel __roll_anglevel) 0)
    ((:yaw_anglevel __yaw_anglevel) 0)
    ((:accx __accx) 0)
    ((:accy __accy) 0)
    ((:accz __accz) 0)
    ((:motor1rpm __motor1rpm) 0)
    ((:motor2rpm __motor2rpm) 0)
    ((:motor3rpm __motor3rpm) 0)
    ((:motor4rpm __motor4rpm) 0)
    ((:motor5rpm __motor5rpm) 0)
    ((:motor6rpm __motor6rpm) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lat (round __lat))
   (setq _lon (round __lon))
   (setq _best_lat (round __best_lat))
   (setq _best_lon (round __best_lon))
   (setq _hgt (round __hgt))
   (setq _sp_x (round __sp_x))
   (setq _sp_y (round __sp_y))
   (setq _best_sp_x (round __best_sp_x))
   (setq _best_sp_y (round __best_sp_y))
   (setq _best_sp_z (round __best_sp_z))
   (setq _heading_angle (round __heading_angle))
   (setq _pitch_angle (round __pitch_angle))
   (setq _roll_angle (round __roll_angle))
   (setq _yaw_angle (round __yaw_angle))
   (setq _pitch_anglevel (round __pitch_anglevel))
   (setq _roll_anglevel (round __roll_anglevel))
   (setq _yaw_anglevel (round __yaw_anglevel))
   (setq _accx (round __accx))
   (setq _accy (round __accy))
   (setq _accz (round __accz))
   (setq _motor1rpm (round __motor1rpm))
   (setq _motor2rpm (round __motor2rpm))
   (setq _motor3rpm (round __motor3rpm))
   (setq _motor4rpm (round __motor4rpm))
   (setq _motor5rpm (round __motor5rpm))
   (setq _motor6rpm (round __motor6rpm))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lat
   (&optional __lat)
   (if __lat (setq _lat __lat)) _lat)
  (:lon
   (&optional __lon)
   (if __lon (setq _lon __lon)) _lon)
  (:best_lat
   (&optional __best_lat)
   (if __best_lat (setq _best_lat __best_lat)) _best_lat)
  (:best_lon
   (&optional __best_lon)
   (if __best_lon (setq _best_lon __best_lon)) _best_lon)
  (:hgt
   (&optional __hgt)
   (if __hgt (setq _hgt __hgt)) _hgt)
  (:sp_x
   (&optional __sp_x)
   (if __sp_x (setq _sp_x __sp_x)) _sp_x)
  (:sp_y
   (&optional __sp_y)
   (if __sp_y (setq _sp_y __sp_y)) _sp_y)
  (:best_sp_x
   (&optional __best_sp_x)
   (if __best_sp_x (setq _best_sp_x __best_sp_x)) _best_sp_x)
  (:best_sp_y
   (&optional __best_sp_y)
   (if __best_sp_y (setq _best_sp_y __best_sp_y)) _best_sp_y)
  (:best_sp_z
   (&optional __best_sp_z)
   (if __best_sp_z (setq _best_sp_z __best_sp_z)) _best_sp_z)
  (:heading_angle
   (&optional __heading_angle)
   (if __heading_angle (setq _heading_angle __heading_angle)) _heading_angle)
  (:pitch_angle
   (&optional __pitch_angle)
   (if __pitch_angle (setq _pitch_angle __pitch_angle)) _pitch_angle)
  (:roll_angle
   (&optional __roll_angle)
   (if __roll_angle (setq _roll_angle __roll_angle)) _roll_angle)
  (:yaw_angle
   (&optional __yaw_angle)
   (if __yaw_angle (setq _yaw_angle __yaw_angle)) _yaw_angle)
  (:pitch_anglevel
   (&optional __pitch_anglevel)
   (if __pitch_anglevel (setq _pitch_anglevel __pitch_anglevel)) _pitch_anglevel)
  (:roll_anglevel
   (&optional __roll_anglevel)
   (if __roll_anglevel (setq _roll_anglevel __roll_anglevel)) _roll_anglevel)
  (:yaw_anglevel
   (&optional __yaw_anglevel)
   (if __yaw_anglevel (setq _yaw_anglevel __yaw_anglevel)) _yaw_anglevel)
  (:accx
   (&optional __accx)
   (if __accx (setq _accx __accx)) _accx)
  (:accy
   (&optional __accy)
   (if __accy (setq _accy __accy)) _accy)
  (:accz
   (&optional __accz)
   (if __accz (setq _accz __accz)) _accz)
  (:motor1rpm
   (&optional __motor1rpm)
   (if __motor1rpm (setq _motor1rpm __motor1rpm)) _motor1rpm)
  (:motor2rpm
   (&optional __motor2rpm)
   (if __motor2rpm (setq _motor2rpm __motor2rpm)) _motor2rpm)
  (:motor3rpm
   (&optional __motor3rpm)
   (if __motor3rpm (setq _motor3rpm __motor3rpm)) _motor3rpm)
  (:motor4rpm
   (&optional __motor4rpm)
   (if __motor4rpm (setq _motor4rpm __motor4rpm)) _motor4rpm)
  (:motor5rpm
   (&optional __motor5rpm)
   (if __motor5rpm (setq _motor5rpm __motor5rpm)) _motor5rpm)
  (:motor6rpm
   (&optional __motor6rpm)
   (if __motor6rpm (setq _motor6rpm __motor6rpm)) _motor6rpm)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int64 _lat
    8
    ;; int64 _lon
    8
    ;; int64 _best_lat
    8
    ;; int64 _best_lon
    8
    ;; int64 _hgt
    8
    ;; int64 _sp_x
    8
    ;; int64 _sp_y
    8
    ;; int64 _best_sp_x
    8
    ;; int64 _best_sp_y
    8
    ;; int64 _best_sp_z
    8
    ;; int64 _heading_angle
    8
    ;; int64 _pitch_angle
    8
    ;; int64 _roll_angle
    8
    ;; int64 _yaw_angle
    8
    ;; int64 _pitch_anglevel
    8
    ;; int64 _roll_anglevel
    8
    ;; int64 _yaw_anglevel
    8
    ;; int64 _accx
    8
    ;; int64 _accy
    8
    ;; int64 _accz
    8
    ;; uint8 _motor1rpm
    1
    ;; uint8 _motor2rpm
    1
    ;; uint8 _motor3rpm
    1
    ;; uint8 _motor4rpm
    1
    ;; uint8 _motor5rpm
    1
    ;; uint8 _motor6rpm
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int64 _lat
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lat (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lat) (= (length (_lat . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lat . bv) 0) 0) s)
              (write-long (ash (elt (_lat . bv) 1) -1) s))
             ((and (class _lat) (= (length (_lat . bv)) 1)) ;; big1
              (write-long (elt (_lat . bv) 0) s)
              (write-long (if (>= _lat 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lat s)(write-long (if (>= _lat 0) 0 #xffffffff) s)))
     ;; int64 _lon
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _lon (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _lon) (= (length (_lon . bv)) 2)) ;; bignum
              (write-long (ash (elt (_lon . bv) 0) 0) s)
              (write-long (ash (elt (_lon . bv) 1) -1) s))
             ((and (class _lon) (= (length (_lon . bv)) 1)) ;; big1
              (write-long (elt (_lon . bv) 0) s)
              (write-long (if (>= _lon 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _lon s)(write-long (if (>= _lon 0) 0 #xffffffff) s)))
     ;; int64 _best_lat
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _best_lat (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _best_lat) (= (length (_best_lat . bv)) 2)) ;; bignum
              (write-long (ash (elt (_best_lat . bv) 0) 0) s)
              (write-long (ash (elt (_best_lat . bv) 1) -1) s))
             ((and (class _best_lat) (= (length (_best_lat . bv)) 1)) ;; big1
              (write-long (elt (_best_lat . bv) 0) s)
              (write-long (if (>= _best_lat 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _best_lat s)(write-long (if (>= _best_lat 0) 0 #xffffffff) s)))
     ;; int64 _best_lon
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _best_lon (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _best_lon) (= (length (_best_lon . bv)) 2)) ;; bignum
              (write-long (ash (elt (_best_lon . bv) 0) 0) s)
              (write-long (ash (elt (_best_lon . bv) 1) -1) s))
             ((and (class _best_lon) (= (length (_best_lon . bv)) 1)) ;; big1
              (write-long (elt (_best_lon . bv) 0) s)
              (write-long (if (>= _best_lon 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _best_lon s)(write-long (if (>= _best_lon 0) 0 #xffffffff) s)))
     ;; int64 _hgt
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _hgt (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _hgt) (= (length (_hgt . bv)) 2)) ;; bignum
              (write-long (ash (elt (_hgt . bv) 0) 0) s)
              (write-long (ash (elt (_hgt . bv) 1) -1) s))
             ((and (class _hgt) (= (length (_hgt . bv)) 1)) ;; big1
              (write-long (elt (_hgt . bv) 0) s)
              (write-long (if (>= _hgt 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _hgt s)(write-long (if (>= _hgt 0) 0 #xffffffff) s)))
     ;; int64 _sp_x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sp_x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sp_x) (= (length (_sp_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sp_x . bv) 0) 0) s)
              (write-long (ash (elt (_sp_x . bv) 1) -1) s))
             ((and (class _sp_x) (= (length (_sp_x . bv)) 1)) ;; big1
              (write-long (elt (_sp_x . bv) 0) s)
              (write-long (if (>= _sp_x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sp_x s)(write-long (if (>= _sp_x 0) 0 #xffffffff) s)))
     ;; int64 _sp_y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _sp_y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _sp_y) (= (length (_sp_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_sp_y . bv) 0) 0) s)
              (write-long (ash (elt (_sp_y . bv) 1) -1) s))
             ((and (class _sp_y) (= (length (_sp_y . bv)) 1)) ;; big1
              (write-long (elt (_sp_y . bv) 0) s)
              (write-long (if (>= _sp_y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _sp_y s)(write-long (if (>= _sp_y 0) 0 #xffffffff) s)))
     ;; int64 _best_sp_x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _best_sp_x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _best_sp_x) (= (length (_best_sp_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_best_sp_x . bv) 0) 0) s)
              (write-long (ash (elt (_best_sp_x . bv) 1) -1) s))
             ((and (class _best_sp_x) (= (length (_best_sp_x . bv)) 1)) ;; big1
              (write-long (elt (_best_sp_x . bv) 0) s)
              (write-long (if (>= _best_sp_x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _best_sp_x s)(write-long (if (>= _best_sp_x 0) 0 #xffffffff) s)))
     ;; int64 _best_sp_y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _best_sp_y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _best_sp_y) (= (length (_best_sp_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_best_sp_y . bv) 0) 0) s)
              (write-long (ash (elt (_best_sp_y . bv) 1) -1) s))
             ((and (class _best_sp_y) (= (length (_best_sp_y . bv)) 1)) ;; big1
              (write-long (elt (_best_sp_y . bv) 0) s)
              (write-long (if (>= _best_sp_y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _best_sp_y s)(write-long (if (>= _best_sp_y 0) 0 #xffffffff) s)))
     ;; int64 _best_sp_z
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _best_sp_z (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _best_sp_z) (= (length (_best_sp_z . bv)) 2)) ;; bignum
              (write-long (ash (elt (_best_sp_z . bv) 0) 0) s)
              (write-long (ash (elt (_best_sp_z . bv) 1) -1) s))
             ((and (class _best_sp_z) (= (length (_best_sp_z . bv)) 1)) ;; big1
              (write-long (elt (_best_sp_z . bv) 0) s)
              (write-long (if (>= _best_sp_z 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _best_sp_z s)(write-long (if (>= _best_sp_z 0) 0 #xffffffff) s)))
     ;; int64 _heading_angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _heading_angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _heading_angle) (= (length (_heading_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_heading_angle . bv) 0) 0) s)
              (write-long (ash (elt (_heading_angle . bv) 1) -1) s))
             ((and (class _heading_angle) (= (length (_heading_angle . bv)) 1)) ;; big1
              (write-long (elt (_heading_angle . bv) 0) s)
              (write-long (if (>= _heading_angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _heading_angle s)(write-long (if (>= _heading_angle 0) 0 #xffffffff) s)))
     ;; int64 _pitch_angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _pitch_angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _pitch_angle) (= (length (_pitch_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_pitch_angle . bv) 0) 0) s)
              (write-long (ash (elt (_pitch_angle . bv) 1) -1) s))
             ((and (class _pitch_angle) (= (length (_pitch_angle . bv)) 1)) ;; big1
              (write-long (elt (_pitch_angle . bv) 0) s)
              (write-long (if (>= _pitch_angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _pitch_angle s)(write-long (if (>= _pitch_angle 0) 0 #xffffffff) s)))
     ;; int64 _roll_angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _roll_angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _roll_angle) (= (length (_roll_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_roll_angle . bv) 0) 0) s)
              (write-long (ash (elt (_roll_angle . bv) 1) -1) s))
             ((and (class _roll_angle) (= (length (_roll_angle . bv)) 1)) ;; big1
              (write-long (elt (_roll_angle . bv) 0) s)
              (write-long (if (>= _roll_angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _roll_angle s)(write-long (if (>= _roll_angle 0) 0 #xffffffff) s)))
     ;; int64 _yaw_angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _yaw_angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _yaw_angle) (= (length (_yaw_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_yaw_angle . bv) 0) 0) s)
              (write-long (ash (elt (_yaw_angle . bv) 1) -1) s))
             ((and (class _yaw_angle) (= (length (_yaw_angle . bv)) 1)) ;; big1
              (write-long (elt (_yaw_angle . bv) 0) s)
              (write-long (if (>= _yaw_angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _yaw_angle s)(write-long (if (>= _yaw_angle 0) 0 #xffffffff) s)))
     ;; int64 _pitch_anglevel
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _pitch_anglevel (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _pitch_anglevel) (= (length (_pitch_anglevel . bv)) 2)) ;; bignum
              (write-long (ash (elt (_pitch_anglevel . bv) 0) 0) s)
              (write-long (ash (elt (_pitch_anglevel . bv) 1) -1) s))
             ((and (class _pitch_anglevel) (= (length (_pitch_anglevel . bv)) 1)) ;; big1
              (write-long (elt (_pitch_anglevel . bv) 0) s)
              (write-long (if (>= _pitch_anglevel 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _pitch_anglevel s)(write-long (if (>= _pitch_anglevel 0) 0 #xffffffff) s)))
     ;; int64 _roll_anglevel
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _roll_anglevel (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _roll_anglevel) (= (length (_roll_anglevel . bv)) 2)) ;; bignum
              (write-long (ash (elt (_roll_anglevel . bv) 0) 0) s)
              (write-long (ash (elt (_roll_anglevel . bv) 1) -1) s))
             ((and (class _roll_anglevel) (= (length (_roll_anglevel . bv)) 1)) ;; big1
              (write-long (elt (_roll_anglevel . bv) 0) s)
              (write-long (if (>= _roll_anglevel 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _roll_anglevel s)(write-long (if (>= _roll_anglevel 0) 0 #xffffffff) s)))
     ;; int64 _yaw_anglevel
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _yaw_anglevel (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _yaw_anglevel) (= (length (_yaw_anglevel . bv)) 2)) ;; bignum
              (write-long (ash (elt (_yaw_anglevel . bv) 0) 0) s)
              (write-long (ash (elt (_yaw_anglevel . bv) 1) -1) s))
             ((and (class _yaw_anglevel) (= (length (_yaw_anglevel . bv)) 1)) ;; big1
              (write-long (elt (_yaw_anglevel . bv) 0) s)
              (write-long (if (>= _yaw_anglevel 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _yaw_anglevel s)(write-long (if (>= _yaw_anglevel 0) 0 #xffffffff) s)))
     ;; int64 _accx
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _accx (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _accx) (= (length (_accx . bv)) 2)) ;; bignum
              (write-long (ash (elt (_accx . bv) 0) 0) s)
              (write-long (ash (elt (_accx . bv) 1) -1) s))
             ((and (class _accx) (= (length (_accx . bv)) 1)) ;; big1
              (write-long (elt (_accx . bv) 0) s)
              (write-long (if (>= _accx 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _accx s)(write-long (if (>= _accx 0) 0 #xffffffff) s)))
     ;; int64 _accy
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _accy (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _accy) (= (length (_accy . bv)) 2)) ;; bignum
              (write-long (ash (elt (_accy . bv) 0) 0) s)
              (write-long (ash (elt (_accy . bv) 1) -1) s))
             ((and (class _accy) (= (length (_accy . bv)) 1)) ;; big1
              (write-long (elt (_accy . bv) 0) s)
              (write-long (if (>= _accy 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _accy s)(write-long (if (>= _accy 0) 0 #xffffffff) s)))
     ;; int64 _accz
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _accz (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _accz) (= (length (_accz . bv)) 2)) ;; bignum
              (write-long (ash (elt (_accz . bv) 0) 0) s)
              (write-long (ash (elt (_accz . bv) 1) -1) s))
             ((and (class _accz) (= (length (_accz . bv)) 1)) ;; big1
              (write-long (elt (_accz . bv) 0) s)
              (write-long (if (>= _accz 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _accz s)(write-long (if (>= _accz 0) 0 #xffffffff) s)))
     ;; uint8 _motor1rpm
       (write-byte _motor1rpm s)
     ;; uint8 _motor2rpm
       (write-byte _motor2rpm s)
     ;; uint8 _motor3rpm
       (write-byte _motor3rpm s)
     ;; uint8 _motor4rpm
       (write-byte _motor4rpm s)
     ;; uint8 _motor5rpm
       (write-byte _motor5rpm s)
     ;; uint8 _motor6rpm
       (write-byte _motor6rpm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int64 _lat
#+(or :alpha :irix6 :x86_64)
      (setf _lat (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lat (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _lon
#+(or :alpha :irix6 :x86_64)
      (setf _lon (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _lon (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _best_lat
#+(or :alpha :irix6 :x86_64)
      (setf _best_lat (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _best_lat (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _best_lon
#+(or :alpha :irix6 :x86_64)
      (setf _best_lon (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _best_lon (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _hgt
#+(or :alpha :irix6 :x86_64)
      (setf _hgt (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _hgt (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _sp_x
#+(or :alpha :irix6 :x86_64)
      (setf _sp_x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sp_x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _sp_y
#+(or :alpha :irix6 :x86_64)
      (setf _sp_y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _sp_y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _best_sp_x
#+(or :alpha :irix6 :x86_64)
      (setf _best_sp_x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _best_sp_x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _best_sp_y
#+(or :alpha :irix6 :x86_64)
      (setf _best_sp_y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _best_sp_y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _best_sp_z
#+(or :alpha :irix6 :x86_64)
      (setf _best_sp_z (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _best_sp_z (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _heading_angle
#+(or :alpha :irix6 :x86_64)
      (setf _heading_angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _heading_angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _pitch_angle
#+(or :alpha :irix6 :x86_64)
      (setf _pitch_angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _pitch_angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _roll_angle
#+(or :alpha :irix6 :x86_64)
      (setf _roll_angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _roll_angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _yaw_angle
#+(or :alpha :irix6 :x86_64)
      (setf _yaw_angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _yaw_angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _pitch_anglevel
#+(or :alpha :irix6 :x86_64)
      (setf _pitch_anglevel (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _pitch_anglevel (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _roll_anglevel
#+(or :alpha :irix6 :x86_64)
      (setf _roll_anglevel (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _roll_anglevel (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _yaw_anglevel
#+(or :alpha :irix6 :x86_64)
      (setf _yaw_anglevel (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _yaw_anglevel (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _accx
#+(or :alpha :irix6 :x86_64)
      (setf _accx (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _accx (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _accy
#+(or :alpha :irix6 :x86_64)
      (setf _accy (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _accy (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _accz
#+(or :alpha :irix6 :x86_64)
      (setf _accz (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _accz (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8 _motor1rpm
     (setq _motor1rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motor2rpm
     (setq _motor2rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motor3rpm
     (setq _motor3rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motor4rpm
     (setq _motor4rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motor5rpm
     (setq _motor5rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _motor6rpm
     (setq _motor6rpm (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get freyja_msgs::AsctecData :md5sum-) "8ad7a94e1bacdc1e59233f1b26a5c94c")
(setf (get freyja_msgs::AsctecData :datatype-) "freyja_msgs/AsctecData")
(setf (get freyja_msgs::AsctecData :definition-)
      "Header header

int64 lat
int64 lon
int64 best_lat
int64 best_lon

int64 hgt 
  
int64 sp_x
int64 sp_y
int64 best_sp_x
int64 best_sp_y
int64 best_sp_z
  
int64 heading_angle

int64 pitch_angle
int64 roll_angle
int64 yaw_angle
int64 pitch_anglevel
int64 roll_anglevel
int64 yaw_anglevel

int64 accx
int64 accy
int64 accz

uint8 motor1rpm
uint8 motor2rpm
uint8 motor3rpm
uint8 motor4rpm
uint8 motor5rpm
uint8 motor6rpm

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :freyja_msgs/AsctecData "8ad7a94e1bacdc1e59233f1b26a5c94c")


