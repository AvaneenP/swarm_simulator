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

class CurrentStateBiasEst {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.state_vector = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('state_vector')) {
        this.state_vector = initObj.state_vector
      }
      else {
        this.state_vector = new Array(12).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CurrentStateBiasEst
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Check that the constant length array field [state_vector] has the right length
    if (obj.state_vector.length !== 12) {
      throw new Error('Unable to serialize array field state_vector - length must be 12')
    }
    // Serialize message field [state_vector]
    bufferOffset = _arraySerializer.float64(obj.state_vector, buffer, bufferOffset, 12);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CurrentStateBiasEst
    let len;
    let data = new CurrentStateBiasEst(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [state_vector]
    data.state_vector = _arrayDeserializer.float64(buffer, bufferOffset, 12)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/CurrentStateBiasEst';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1ab5d62c27ac2f41f121e92a2fdaa3ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Estimated state augmented with bias estimates
    # [pn, pe, pd, vn, ve, vd, bn, be, bd, debug1, debug2, debug3]
    # Use debug to monitor the variance of estimator, for instance.
    Header header
    float64[12] state_vector
    
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
    const resolved = new CurrentStateBiasEst(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.state_vector !== undefined) {
      resolved.state_vector = msg.state_vector;
    }
    else {
      resolved.state_vector = new Array(12).fill(0)
    }

    return resolved;
    }
};

module.exports = CurrentStateBiasEst;
