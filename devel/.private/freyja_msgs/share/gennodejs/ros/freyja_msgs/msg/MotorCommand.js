// Auto-generated. Do not edit!

// (in-package freyja_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motors_state = null;
      this.motors_idle = null;
    }
    else {
      if (initObj.hasOwnProperty('motors_state')) {
        this.motors_state = initObj.motors_state
      }
      else {
        this.motors_state = 0;
      }
      if (initObj.hasOwnProperty('motors_idle')) {
        this.motors_idle = initObj.motors_idle
      }
      else {
        this.motors_idle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorCommand
    // Serialize message field [motors_state]
    bufferOffset = _serializer.uint8(obj.motors_state, buffer, bufferOffset);
    // Serialize message field [motors_idle]
    bufferOffset = _serializer.uint8(obj.motors_idle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorCommand
    let len;
    let data = new MotorCommand(null);
    // Deserialize message field [motors_state]
    data.motors_state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [motors_idle]
    data.motors_idle = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'freyja_msgs/MotorCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '47aca326185da674507cd7254ba460ca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # command asctec vehicle to do discrete things
    ## motors_state : on(1) or off(0)
    ## motors_idle   : (1) forces the motor to idle, (0) does nothing
    uint8 motors_state
    uint8 motors_idle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorCommand(null);
    if (msg.motors_state !== undefined) {
      resolved.motors_state = msg.motors_state;
    }
    else {
      resolved.motors_state = 0
    }

    if (msg.motors_idle !== undefined) {
      resolved.motors_idle = msg.motors_idle;
    }
    else {
      resolved.motors_idle = 0
    }

    return resolved;
    }
};

module.exports = MotorCommand;
