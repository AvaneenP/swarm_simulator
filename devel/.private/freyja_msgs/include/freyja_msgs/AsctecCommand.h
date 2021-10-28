// Generated by gencpp from file freyja_msgs/AsctecCommand.msg
// DO NOT EDIT!


#ifndef FREYJA_MSGS_MESSAGE_ASCTECCOMMAND_H
#define FREYJA_MSGS_MESSAGE_ASCTECCOMMAND_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace freyja_msgs
{
template <class ContainerAllocator>
struct AsctecCommand_
{
  typedef AsctecCommand_<ContainerAllocator> Type;

  AsctecCommand_()
    : command_type(0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , thrust(0.0)
    , ctrl_byte(0)  {
    }
  AsctecCommand_(const ContainerAllocator& _alloc)
    : command_type(0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , thrust(0.0)
    , ctrl_byte(0)  {
  (void)_alloc;
    }



   typedef uint8_t _command_type_type;
  _command_type_type command_type;

   typedef double _roll_type;
  _roll_type roll;

   typedef double _pitch_type;
  _pitch_type pitch;

   typedef double _yaw_type;
  _yaw_type yaw;

   typedef double _thrust_type;
  _thrust_type thrust;

   typedef uint8_t _ctrl_byte_type;
  _ctrl_byte_type ctrl_byte;





  typedef boost::shared_ptr< ::freyja_msgs::AsctecCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::freyja_msgs::AsctecCommand_<ContainerAllocator> const> ConstPtr;

}; // struct AsctecCommand_

typedef ::freyja_msgs::AsctecCommand_<std::allocator<void> > AsctecCommand;

typedef boost::shared_ptr< ::freyja_msgs::AsctecCommand > AsctecCommandPtr;
typedef boost::shared_ptr< ::freyja_msgs::AsctecCommand const> AsctecCommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::freyja_msgs::AsctecCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::freyja_msgs::AsctecCommand_<ContainerAllocator1> & lhs, const ::freyja_msgs::AsctecCommand_<ContainerAllocator2> & rhs)
{
  return lhs.command_type == rhs.command_type &&
    lhs.roll == rhs.roll &&
    lhs.pitch == rhs.pitch &&
    lhs.yaw == rhs.yaw &&
    lhs.thrust == rhs.thrust &&
    lhs.ctrl_byte == rhs.ctrl_byte;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::freyja_msgs::AsctecCommand_<ContainerAllocator1> & lhs, const ::freyja_msgs::AsctecCommand_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace freyja_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::freyja_msgs::AsctecCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::freyja_msgs::AsctecCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::freyja_msgs::AsctecCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "56ac1fe81e2a3c53f5aeb626327e1b63";
  }

  static const char* value(const ::freyja_msgs::AsctecCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x56ac1fe81e2a3c53ULL;
  static const uint64_t static_value2 = 0xf5aeb626327e1b63ULL;
};

template<class ContainerAllocator>
struct DataType< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "freyja_msgs/AsctecCommand";
  }

  static const char* value(const ::freyja_msgs::AsctecCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# asctec handler common message structure that contains everything commandable\n"
"## command_type =   1   :   this message is to turn motors on or off\n"
"##                  2   :   this message is to idle the motors\n"
"##                  3   :   this message is to command attitudes\n"
"\n"
"uint8 command_type\n"
"float64 roll\n"
"float64 pitch\n"
"float64 yaw\n"
"float64 thrust\n"
"uint8 ctrl_byte\n"
;
  }

  static const char* value(const ::freyja_msgs::AsctecCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.command_type);
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.yaw);
      stream.next(m.thrust);
      stream.next(m.ctrl_byte);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AsctecCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::freyja_msgs::AsctecCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::freyja_msgs::AsctecCommand_<ContainerAllocator>& v)
  {
    s << indent << "command_type: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.command_type);
    s << indent << "roll: ";
    Printer<double>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<double>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
    s << indent << "thrust: ";
    Printer<double>::stream(s, indent + "  ", v.thrust);
    s << indent << "ctrl_byte: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.ctrl_byte);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FREYJA_MSGS_MESSAGE_ASCTECCOMMAND_H
