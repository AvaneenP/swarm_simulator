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

class WaypointTarget {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.terminal_pn = null;
      this.terminal_pe = null;
      this.terminal_pd = null;
      this.terminal_vn = null;
      this.terminal_ve = null;
      this.terminal_vd = null;
      this.terminal_yaw = null;
      this.allocated_time = null;
      this.translational_speed = null;
      this.waypoint_mode = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('terminal_pn')) {
        this.terminal_pn = initObj.terminal_pn
      }
      else {
        this.terminal_pn = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_pe')) {
        this.terminal_pe = initObj.terminal_pe
      }
      else {
        this.terminal_pe = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_pd')) {
        this.terminal_pd = initObj.terminal_pd
      }
      else {
        this.terminal_pd = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_vn')) {
        this.terminal_vn = initObj.terminal_vn
      }
      else {
        this.terminal_vn = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_ve')) {
        this.terminal_ve = initObj.terminal_ve
      }
      else {
        this.terminal_ve = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_vd')) {
        this.terminal_vd = initObj.terminal_vd
      }
      else {
        this.terminal_vd = 0.0;
      }
      if (initObj.hasOwnProperty('terminal_yaw')) {
        this.terminal_yaw = initObj.terminal_yaw
      }
      else {
        this.terminal_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('allocated_time')) {
        this.allocated_time = initObj.allocated_time
      }
      else {
        this.allocated_time = 0.0;
      }
      if (initObj.hasOwnProperty('translational_speed')) {
        this.translational_speed = initObj.translational_speed
      }
      else {
        this.translational_speed = 0.0;
      }
      if (initObj.hasOwnProperty('waypoint_mode')) {
        this.waypoint_mode = initObj.waypoint_mode
      }
      else {
        this.waypoint_mode = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaypointTarget
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [terminal_pn]
    bufferOffset = _serializer.float64(obj.terminal_pn, buffer, bufferOffset);
    // Serialize message field [terminal_pe]
    bufferOffset = _serializer.float64(obj.terminal_pe, buffer, bufferOffset);
    // Serialize message field [terminal_pd]
    bufferOffset = _serializer.float64(obj.terminal_pd, buffer, bufferOffset);
    // Serialize message field [terminal_vn]
    bufferOffset = _serializer.float64(obj.terminal_vn, buffer, bufferOffset);
    // Serialize message field [terminal_ve]
    bufferOffset = _serializer.float64(obj.terminal_ve, buffer, bufferOffset);
    // Serialize message field [terminal_vd]
    bufferOffset = _serializer.float64(obj.terminal_vd, buffer, bufferOffset);
    // Serialize message field [terminal_yaw]
    bufferOffset = _serializer.float64(obj.terminal_yaw, buffer, bufferOffset);
    // Serialize message field [allocated_time]
    bufferOffset = _serializer.float32(obj.allocated_time, buffer, bufferOffset);
    // Serialize message field [translational_speed]
    bufferOffset = _serializer.float32(obj.translational_speed, buffer, bufferOffset);
    // Serialize message field [waypoint_mode]
    bufferOffset = _serializer.uint8(obj.waypoint_mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaypointTarget
    let len;
    let data = new WaypointTarget(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [terminal_pn]
    data.terminal_pn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_pe]
    data.terminal_pe = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_pd]
    data.terminal_pd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_vn]
    data.terminal_vn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_ve]
    data.terminal_ve = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_vd]
    data.terminal_vd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [terminal_yaw]
    data.terminal_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [allocated_time]
    data.allocated_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [translational_speed]
    data.translational_speed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [waypoint_mode]
    data.waypoint_mode = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 65;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/WaypointTarget';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a15b2f6401b97924332941dc39790f93';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Discrete waypoint for a waypoint handler to convert into ReferenceState.
    
    Header header
    float64 terminal_pn
    float64 terminal_pe
    float64 terminal_pd
    float64 terminal_vn
    float64 terminal_ve
    float64 terminal_vd
    float64 terminal_yaw
    
    # time allocated to travel from 'here' to the target
    float32 allocated_time
    # use a constant speed instead of allocated_time(see flag below)
    float32 translational_speed
    
    # use allocated_time OR use translational_speed
    uint8 TIME  = 0
    uint8 SPEED = 1
    uint8 waypoint_mode
    
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
    const resolved = new WaypointTarget(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.terminal_pn !== undefined) {
      resolved.terminal_pn = msg.terminal_pn;
    }
    else {
      resolved.terminal_pn = 0.0
    }

    if (msg.terminal_pe !== undefined) {
      resolved.terminal_pe = msg.terminal_pe;
    }
    else {
      resolved.terminal_pe = 0.0
    }

    if (msg.terminal_pd !== undefined) {
      resolved.terminal_pd = msg.terminal_pd;
    }
    else {
      resolved.terminal_pd = 0.0
    }

    if (msg.terminal_vn !== undefined) {
      resolved.terminal_vn = msg.terminal_vn;
    }
    else {
      resolved.terminal_vn = 0.0
    }

    if (msg.terminal_ve !== undefined) {
      resolved.terminal_ve = msg.terminal_ve;
    }
    else {
      resolved.terminal_ve = 0.0
    }

    if (msg.terminal_vd !== undefined) {
      resolved.terminal_vd = msg.terminal_vd;
    }
    else {
      resolved.terminal_vd = 0.0
    }

    if (msg.terminal_yaw !== undefined) {
      resolved.terminal_yaw = msg.terminal_yaw;
    }
    else {
      resolved.terminal_yaw = 0.0
    }

    if (msg.allocated_time !== undefined) {
      resolved.allocated_time = msg.allocated_time;
    }
    else {
      resolved.allocated_time = 0.0
    }

    if (msg.translational_speed !== undefined) {
      resolved.translational_speed = msg.translational_speed;
    }
    else {
      resolved.translational_speed = 0.0
    }

    if (msg.waypoint_mode !== undefined) {
      resolved.waypoint_mode = msg.waypoint_mode;
    }
    else {
      resolved.waypoint_mode = 0
    }

    return resolved;
    }
};

// Constants for message
WaypointTarget.Constants = {
  TIME: 0,
  SPEED: 1,
}

module.exports = WaypointTarget;
