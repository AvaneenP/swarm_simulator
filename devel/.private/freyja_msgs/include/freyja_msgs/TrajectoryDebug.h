// Generated by gencpp from file freyja_msgs/TrajectoryDebug.msg
// DO NOT EDIT!


#ifndef FREYJA_MSGS_MESSAGE_TRAJECTORYDEBUG_H
#define FREYJA_MSGS_MESSAGE_TRAJECTORYDEBUG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace freyja_msgs
{
template <class ContainerAllocator>
struct TrajectoryDebug_
{
  typedef TrajectoryDebug_<ContainerAllocator> Type;

  TrajectoryDebug_()
    : header()
    , system_state(0)
    , hover_z_target(0.0)  {
    }
  TrajectoryDebug_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , system_state(0)
    , hover_z_target(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint8_t _system_state_type;
  _system_state_type system_state;

   typedef float _hover_z_target_type;
  _hover_z_target_type hover_z_target;





  typedef boost::shared_ptr< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> const> ConstPtr;

}; // struct TrajectoryDebug_

typedef ::freyja_msgs::TrajectoryDebug_<std::allocator<void> > TrajectoryDebug;

typedef boost::shared_ptr< ::freyja_msgs::TrajectoryDebug > TrajectoryDebugPtr;
typedef boost::shared_ptr< ::freyja_msgs::TrajectoryDebug const> TrajectoryDebugConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator1> & lhs, const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.system_state == rhs.system_state &&
    lhs.hover_z_target == rhs.hover_z_target;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator1> & lhs, const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace freyja_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5095b0ba555b2f0c0ee575842a1ee607";
  }

  static const char* value(const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5095b0ba555b2f0cULL;
  static const uint64_t static_value2 = 0x0ee575842a1ee607ULL;
};

template<class ContainerAllocator>
struct DataType< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "freyja_msgs/TrajectoryDebug";
  }

  static const char* value(const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Debug message for trajectory generation\n"
"\n"
"Header header\n"
"uint8 system_state\n"
"float32 hover_z_target\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.system_state);
      stream.next(m.hover_z_target);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TrajectoryDebug_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::freyja_msgs::TrajectoryDebug_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::freyja_msgs::TrajectoryDebug_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "system_state: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.system_state);
    s << indent << "hover_z_target: ";
    Printer<float>::stream(s, indent + "  ", v.hover_z_target);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FREYJA_MSGS_MESSAGE_TRAJECTORYDEBUG_H
