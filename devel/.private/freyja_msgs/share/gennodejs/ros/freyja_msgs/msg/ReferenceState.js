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

class ReferenceState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pn = null;
      this.pe = null;
      this.pd = null;
      this.vn = null;
      this.ve = null;
      this.vd = null;
      this.yaw = null;
      this.an = null;
      this.ae = null;
      this.ad = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pn')) {
        this.pn = initObj.pn
      }
      else {
        this.pn = 0.0;
      }
      if (initObj.hasOwnProperty('pe')) {
        this.pe = initObj.pe
      }
      else {
        this.pe = 0.0;
      }
      if (initObj.hasOwnProperty('pd')) {
        this.pd = initObj.pd
      }
      else {
        this.pd = 0.0;
      }
      if (initObj.hasOwnProperty('vn')) {
        this.vn = initObj.vn
      }
      else {
        this.vn = 0.0;
      }
      if (initObj.hasOwnProperty('ve')) {
        this.ve = initObj.ve
      }
      else {
        this.ve = 0.0;
      }
      if (initObj.hasOwnProperty('vd')) {
        this.vd = initObj.vd
      }
      else {
        this.vd = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('an')) {
        this.an = initObj.an
      }
      else {
        this.an = 0.0;
      }
      if (initObj.hasOwnProperty('ae')) {
        this.ae = initObj.ae
      }
      else {
        this.ae = 0.0;
      }
      if (initObj.hasOwnProperty('ad')) {
        this.ad = initObj.ad
      }
      else {
        this.ad = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ReferenceState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pn]
    bufferOffset = _serializer.float64(obj.pn, buffer, bufferOffset);
    // Serialize message field [pe]
    bufferOffset = _serializer.float64(obj.pe, buffer, bufferOffset);
    // Serialize message field [pd]
    bufferOffset = _serializer.float64(obj.pd, buffer, bufferOffset);
    // Serialize message field [vn]
    bufferOffset = _serializer.float64(obj.vn, buffer, bufferOffset);
    // Serialize message field [ve]
    bufferOffset = _serializer.float64(obj.ve, buffer, bufferOffset);
    // Serialize message field [vd]
    bufferOffset = _serializer.float64(obj.vd, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [an]
    bufferOffset = _serializer.float64(obj.an, buffer, bufferOffset);
    // Serialize message field [ae]
    bufferOffset = _serializer.float64(obj.ae, buffer, bufferOffset);
    // Serialize message field [ad]
    bufferOffset = _serializer.float64(obj.ad, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReferenceState
    let len;
    let data = new ReferenceState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pn]
    data.pn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pe]
    data.pe = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pd]
    data.pd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vn]
    data.vn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ve]
    data.ve = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vd]
    data.vd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [an]
    data.an = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ae]
    data.ae = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ad]
    data.ad = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 80;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/ReferenceState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '01a1c8686cad14cd024a0eabf82f6a91';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Reference 10-element state for the controller to follow.
    Header header
    
    float64 pn
    float64 pe
    float64 pd
    float64 vn
    float64 ve
    float64 vd
    float64 yaw
    float64 an
    float64 ae
    float64 ad
    
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
    const resolved = new ReferenceState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pn !== undefined) {
      resolved.pn = msg.pn;
    }
    else {
      resolved.pn = 0.0
    }

    if (msg.pe !== undefined) {
      resolved.pe = msg.pe;
    }
    else {
      resolved.pe = 0.0
    }

    if (msg.pd !== undefined) {
      resolved.pd = msg.pd;
    }
    else {
      resolved.pd = 0.0
    }

    if (msg.vn !== undefined) {
      resolved.vn = msg.vn;
    }
    else {
      resolved.vn = 0.0
    }

    if (msg.ve !== undefined) {
      resolved.ve = msg.ve;
    }
    else {
      resolved.ve = 0.0
    }

    if (msg.vd !== undefined) {
      resolved.vd = msg.vd;
    }
    else {
      resolved.vd = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.an !== undefined) {
      resolved.an = msg.an;
    }
    else {
      resolved.an = 0.0
    }

    if (msg.ae !== undefined) {
      resolved.ae = msg.ae;
    }
    else {
      resolved.ae = 0.0
    }

    if (msg.ad !== undefined) {
      resolved.ad = msg.ad;
    }
    else {
      resolved.ad = 0.0
    }

    return resolved;
    }
};

module.exports = ReferenceState;
