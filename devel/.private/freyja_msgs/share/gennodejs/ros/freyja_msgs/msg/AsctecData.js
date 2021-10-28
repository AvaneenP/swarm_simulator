// Auto-generated. Do not edit!

// (in-package freyja_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class AsctecData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lat = null;
      this.lon = null;
      this.best_lat = null;
      this.best_lon = null;
      this.hgt = null;
      this.sp_x = null;
      this.sp_y = null;
      this.best_sp_x = null;
      this.best_sp_y = null;
      this.best_sp_z = null;
      this.heading_angle = null;
      this.pitch_angle = null;
      this.roll_angle = null;
      this.yaw_angle = null;
      this.pitch_anglevel = null;
      this.roll_anglevel = null;
      this.yaw_anglevel = null;
      this.accx = null;
      this.accy = null;
      this.accz = null;
      this.motor1rpm = null;
      this.motor2rpm = null;
      this.motor3rpm = null;
      this.motor4rpm = null;
      this.motor5rpm = null;
      this.motor6rpm = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lat')) {
        this.lat = initObj.lat
      }
      else {
        this.lat = 0;
      }
      if (initObj.hasOwnProperty('lon')) {
        this.lon = initObj.lon
      }
      else {
        this.lon = 0;
      }
      if (initObj.hasOwnProperty('best_lat')) {
        this.best_lat = initObj.best_lat
      }
      else {
        this.best_lat = 0;
      }
      if (initObj.hasOwnProperty('best_lon')) {
        this.best_lon = initObj.best_lon
      }
      else {
        this.best_lon = 0;
      }
      if (initObj.hasOwnProperty('hgt')) {
        this.hgt = initObj.hgt
      }
      else {
        this.hgt = 0;
      }
      if (initObj.hasOwnProperty('sp_x')) {
        this.sp_x = initObj.sp_x
      }
      else {
        this.sp_x = 0;
      }
      if (initObj.hasOwnProperty('sp_y')) {
        this.sp_y = initObj.sp_y
      }
      else {
        this.sp_y = 0;
      }
      if (initObj.hasOwnProperty('best_sp_x')) {
        this.best_sp_x = initObj.best_sp_x
      }
      else {
        this.best_sp_x = 0;
      }
      if (initObj.hasOwnProperty('best_sp_y')) {
        this.best_sp_y = initObj.best_sp_y
      }
      else {
        this.best_sp_y = 0;
      }
      if (initObj.hasOwnProperty('best_sp_z')) {
        this.best_sp_z = initObj.best_sp_z
      }
      else {
        this.best_sp_z = 0;
      }
      if (initObj.hasOwnProperty('heading_angle')) {
        this.heading_angle = initObj.heading_angle
      }
      else {
        this.heading_angle = 0;
      }
      if (initObj.hasOwnProperty('pitch_angle')) {
        this.pitch_angle = initObj.pitch_angle
      }
      else {
        this.pitch_angle = 0;
      }
      if (initObj.hasOwnProperty('roll_angle')) {
        this.roll_angle = initObj.roll_angle
      }
      else {
        this.roll_angle = 0;
      }
      if (initObj.hasOwnProperty('yaw_angle')) {
        this.yaw_angle = initObj.yaw_angle
      }
      else {
        this.yaw_angle = 0;
      }
      if (initObj.hasOwnProperty('pitch_anglevel')) {
        this.pitch_anglevel = initObj.pitch_anglevel
      }
      else {
        this.pitch_anglevel = 0;
      }
      if (initObj.hasOwnProperty('roll_anglevel')) {
        this.roll_anglevel = initObj.roll_anglevel
      }
      else {
        this.roll_anglevel = 0;
      }
      if (initObj.hasOwnProperty('yaw_anglevel')) {
        this.yaw_anglevel = initObj.yaw_anglevel
      }
      else {
        this.yaw_anglevel = 0;
      }
      if (initObj.hasOwnProperty('accx')) {
        this.accx = initObj.accx
      }
      else {
        this.accx = 0;
      }
      if (initObj.hasOwnProperty('accy')) {
        this.accy = initObj.accy
      }
      else {
        this.accy = 0;
      }
      if (initObj.hasOwnProperty('accz')) {
        this.accz = initObj.accz
      }
      else {
        this.accz = 0;
      }
      if (initObj.hasOwnProperty('motor1rpm')) {
        this.motor1rpm = initObj.motor1rpm
      }
      else {
        this.motor1rpm = 0;
      }
      if (initObj.hasOwnProperty('motor2rpm')) {
        this.motor2rpm = initObj.motor2rpm
      }
      else {
        this.motor2rpm = 0;
      }
      if (initObj.hasOwnProperty('motor3rpm')) {
        this.motor3rpm = initObj.motor3rpm
      }
      else {
        this.motor3rpm = 0;
      }
      if (initObj.hasOwnProperty('motor4rpm')) {
        this.motor4rpm = initObj.motor4rpm
      }
      else {
        this.motor4rpm = 0;
      }
      if (initObj.hasOwnProperty('motor5rpm')) {
        this.motor5rpm = initObj.motor5rpm
      }
      else {
        this.motor5rpm = 0;
      }
      if (initObj.hasOwnProperty('motor6rpm')) {
        this.motor6rpm = initObj.motor6rpm
      }
      else {
        this.motor6rpm = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AsctecData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lat]
    bufferOffset = _serializer.int64(obj.lat, buffer, bufferOffset);
    // Serialize message field [lon]
    bufferOffset = _serializer.int64(obj.lon, buffer, bufferOffset);
    // Serialize message field [best_lat]
    bufferOffset = _serializer.int64(obj.best_lat, buffer, bufferOffset);
    // Serialize message field [best_lon]
    bufferOffset = _serializer.int64(obj.best_lon, buffer, bufferOffset);
    // Serialize message field [hgt]
    bufferOffset = _serializer.int64(obj.hgt, buffer, bufferOffset);
    // Serialize message field [sp_x]
    bufferOffset = _serializer.int64(obj.sp_x, buffer, bufferOffset);
    // Serialize message field [sp_y]
    bufferOffset = _serializer.int64(obj.sp_y, buffer, bufferOffset);
    // Serialize message field [best_sp_x]
    bufferOffset = _serializer.int64(obj.best_sp_x, buffer, bufferOffset);
    // Serialize message field [best_sp_y]
    bufferOffset = _serializer.int64(obj.best_sp_y, buffer, bufferOffset);
    // Serialize message field [best_sp_z]
    bufferOffset = _serializer.int64(obj.best_sp_z, buffer, bufferOffset);
    // Serialize message field [heading_angle]
    bufferOffset = _serializer.int64(obj.heading_angle, buffer, bufferOffset);
    // Serialize message field [pitch_angle]
    bufferOffset = _serializer.int64(obj.pitch_angle, buffer, bufferOffset);
    // Serialize message field [roll_angle]
    bufferOffset = _serializer.int64(obj.roll_angle, buffer, bufferOffset);
    // Serialize message field [yaw_angle]
    bufferOffset = _serializer.int64(obj.yaw_angle, buffer, bufferOffset);
    // Serialize message field [pitch_anglevel]
    bufferOffset = _serializer.int64(obj.pitch_anglevel, buffer, bufferOffset);
    // Serialize message field [roll_anglevel]
    bufferOffset = _serializer.int64(obj.roll_anglevel, buffer, bufferOffset);
    // Serialize message field [yaw_anglevel]
    bufferOffset = _serializer.int64(obj.yaw_anglevel, buffer, bufferOffset);
    // Serialize message field [accx]
    bufferOffset = _serializer.int64(obj.accx, buffer, bufferOffset);
    // Serialize message field [accy]
    bufferOffset = _serializer.int64(obj.accy, buffer, bufferOffset);
    // Serialize message field [accz]
    bufferOffset = _serializer.int64(obj.accz, buffer, bufferOffset);
    // Serialize message field [motor1rpm]
    bufferOffset = _serializer.uint8(obj.motor1rpm, buffer, bufferOffset);
    // Serialize message field [motor2rpm]
    bufferOffset = _serializer.uint8(obj.motor2rpm, buffer, bufferOffset);
    // Serialize message field [motor3rpm]
    bufferOffset = _serializer.uint8(obj.motor3rpm, buffer, bufferOffset);
    // Serialize message field [motor4rpm]
    bufferOffset = _serializer.uint8(obj.motor4rpm, buffer, bufferOffset);
    // Serialize message field [motor5rpm]
    bufferOffset = _serializer.uint8(obj.motor5rpm, buffer, bufferOffset);
    // Serialize message field [motor6rpm]
    bufferOffset = _serializer.uint8(obj.motor6rpm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AsctecData
    let len;
    let data = new AsctecData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lat]
    data.lat = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [lon]
    data.lon = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [best_lat]
    data.best_lat = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [best_lon]
    data.best_lon = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [hgt]
    data.hgt = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [sp_x]
    data.sp_x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [sp_y]
    data.sp_y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [best_sp_x]
    data.best_sp_x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [best_sp_y]
    data.best_sp_y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [best_sp_z]
    data.best_sp_z = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [heading_angle]
    data.heading_angle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [pitch_angle]
    data.pitch_angle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [roll_angle]
    data.roll_angle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [yaw_angle]
    data.yaw_angle = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [pitch_anglevel]
    data.pitch_anglevel = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [roll_anglevel]
    data.roll_anglevel = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [yaw_anglevel]
    data.yaw_anglevel = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [accx]
    data.accx = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [accy]
    data.accy = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [accz]
    data.accz = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [motor1rpm]
    data.motor1rpm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor2rpm]
    data.motor2rpm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor3rpm]
    data.motor3rpm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor4rpm]
    data.motor4rpm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor5rpm]
    data.motor5rpm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motor6rpm]
    data.motor6rpm = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 166;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/AsctecData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ad7a94e1bacdc1e59233f1b26a5c94c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AsctecData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lat !== undefined) {
      resolved.lat = msg.lat;
    }
    else {
      resolved.lat = 0
    }

    if (msg.lon !== undefined) {
      resolved.lon = msg.lon;
    }
    else {
      resolved.lon = 0
    }

    if (msg.best_lat !== undefined) {
      resolved.best_lat = msg.best_lat;
    }
    else {
      resolved.best_lat = 0
    }

    if (msg.best_lon !== undefined) {
      resolved.best_lon = msg.best_lon;
    }
    else {
      resolved.best_lon = 0
    }

    if (msg.hgt !== undefined) {
      resolved.hgt = msg.hgt;
    }
    else {
      resolved.hgt = 0
    }

    if (msg.sp_x !== undefined) {
      resolved.sp_x = msg.sp_x;
    }
    else {
      resolved.sp_x = 0
    }

    if (msg.sp_y !== undefined) {
      resolved.sp_y = msg.sp_y;
    }
    else {
      resolved.sp_y = 0
    }

    if (msg.best_sp_x !== undefined) {
      resolved.best_sp_x = msg.best_sp_x;
    }
    else {
      resolved.best_sp_x = 0
    }

    if (msg.best_sp_y !== undefined) {
      resolved.best_sp_y = msg.best_sp_y;
    }
    else {
      resolved.best_sp_y = 0
    }

    if (msg.best_sp_z !== undefined) {
      resolved.best_sp_z = msg.best_sp_z;
    }
    else {
      resolved.best_sp_z = 0
    }

    if (msg.heading_angle !== undefined) {
      resolved.heading_angle = msg.heading_angle;
    }
    else {
      resolved.heading_angle = 0
    }

    if (msg.pitch_angle !== undefined) {
      resolved.pitch_angle = msg.pitch_angle;
    }
    else {
      resolved.pitch_angle = 0
    }

    if (msg.roll_angle !== undefined) {
      resolved.roll_angle = msg.roll_angle;
    }
    else {
      resolved.roll_angle = 0
    }

    if (msg.yaw_angle !== undefined) {
      resolved.yaw_angle = msg.yaw_angle;
    }
    else {
      resolved.yaw_angle = 0
    }

    if (msg.pitch_anglevel !== undefined) {
      resolved.pitch_anglevel = msg.pitch_anglevel;
    }
    else {
      resolved.pitch_anglevel = 0
    }

    if (msg.roll_anglevel !== undefined) {
      resolved.roll_anglevel = msg.roll_anglevel;
    }
    else {
      resolved.roll_anglevel = 0
    }

    if (msg.yaw_anglevel !== undefined) {
      resolved.yaw_anglevel = msg.yaw_anglevel;
    }
    else {
      resolved.yaw_anglevel = 0
    }

    if (msg.accx !== undefined) {
      resolved.accx = msg.accx;
    }
    else {
      resolved.accx = 0
    }

    if (msg.accy !== undefined) {
      resolved.accy = msg.accy;
    }
    else {
      resolved.accy = 0
    }

    if (msg.accz !== undefined) {
      resolved.accz = msg.accz;
    }
    else {
      resolved.accz = 0
    }

    if (msg.motor1rpm !== undefined) {
      resolved.motor1rpm = msg.motor1rpm;
    }
    else {
      resolved.motor1rpm = 0
    }

    if (msg.motor2rpm !== undefined) {
      resolved.motor2rpm = msg.motor2rpm;
    }
    else {
      resolved.motor2rpm = 0
    }

    if (msg.motor3rpm !== undefined) {
      resolved.motor3rpm = msg.motor3rpm;
    }
    else {
      resolved.motor3rpm = 0
    }

    if (msg.motor4rpm !== undefined) {
      resolved.motor4rpm = msg.motor4rpm;
    }
    else {
      resolved.motor4rpm = 0
    }

    if (msg.motor5rpm !== undefined) {
      resolved.motor5rpm = msg.motor5rpm;
    }
    else {
      resolved.motor5rpm = 0
    }

    if (msg.motor6rpm !== undefined) {
      resolved.motor6rpm = msg.motor6rpm;
    }
    else {
      resolved.motor6rpm = 0
    }

    return resolved;
    }
};

module.exports = AsctecData;
