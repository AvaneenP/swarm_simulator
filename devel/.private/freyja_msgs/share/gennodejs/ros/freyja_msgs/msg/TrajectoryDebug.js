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

class TrajectoryDebug {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.system_state = null;
      this.hover_z_target = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('system_state')) {
        this.system_state = initObj.system_state
      }
      else {
        this.system_state = 0;
      }
      if (initObj.hasOwnProperty('hover_z_target')) {
        this.hover_z_target = initObj.hover_z_target
      }
      else {
        this.hover_z_target = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrajectoryDebug
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [system_state]
    bufferOffset = _serializer.uint8(obj.system_state, buffer, bufferOffset);
    // Serialize message field [hover_z_target]
    bufferOffset = _serializer.float32(obj.hover_z_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrajectoryDebug
    let len;
    let data = new TrajectoryDebug(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [system_state]
    data.system_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [hover_z_target]
    data.hover_z_target = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/TrajectoryDebug';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5095b0ba555b2f0c0ee575842a1ee607';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Debug message for trajectory generation
    
    Header header
    uint8 system_state
    float32 hover_z_target
    
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
    const resolved = new TrajectoryDebug(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.system_state !== undefined) {
      resolved.system_state = msg.system_state;
    }
    else {
      resolved.system_state = 0
    }

    if (msg.hover_z_target !== undefined) {
      resolved.hover_z_target = msg.hover_z_target;
    }
    else {
      resolved.hover_z_target = 0.0
    }

    return resolved;
    }
};

module.exports = TrajectoryDebug;
