# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "freyja_msgs: 10 messages, 0 services")

set(MSG_I_FLAGS "-Ifreyja_msgs:/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(freyja_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" ""
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" ""
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" ""
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_custom_target(_freyja_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "freyja_msgs" "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_cpp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(freyja_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(freyja_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(freyja_msgs_generate_messages freyja_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_cpp _freyja_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(freyja_msgs_gencpp)
add_dependencies(freyja_msgs_gencpp freyja_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS freyja_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)
_generate_msg_eus(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(freyja_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(freyja_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(freyja_msgs_generate_messages freyja_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_eus _freyja_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(freyja_msgs_geneus)
add_dependencies(freyja_msgs_geneus freyja_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS freyja_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)
_generate_msg_lisp(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(freyja_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(freyja_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(freyja_msgs_generate_messages freyja_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_lisp _freyja_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(freyja_msgs_genlisp)
add_dependencies(freyja_msgs_genlisp freyja_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS freyja_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)
_generate_msg_nodejs(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(freyja_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(freyja_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(freyja_msgs_generate_messages freyja_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_nodejs _freyja_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(freyja_msgs_gennodejs)
add_dependencies(freyja_msgs_gennodejs freyja_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS freyja_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)
_generate_msg_py(freyja_msgs
  "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(freyja_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(freyja_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(freyja_msgs_generate_messages freyja_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/ControllerDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/AsctecData.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/asctec_handler/MotorCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentStateBiasEst.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/lqr_ctrl/CtrlCommand.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/WaypointTarget.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/state_manager/CurrentState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/ReferenceState.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lesslab5/Documents/simulator_ws/src/Freyja/freyja_msgs/msg/trajectory_provider/TrajectoryDebug.msg" NAME_WE)
add_dependencies(freyja_msgs_generate_messages_py _freyja_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(freyja_msgs_genpy)
add_dependencies(freyja_msgs_genpy freyja_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS freyja_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/freyja_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(freyja_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(freyja_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/freyja_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(freyja_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(freyja_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/freyja_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(freyja_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(freyja_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/freyja_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(freyja_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(freyja_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/freyja_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(freyja_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(freyja_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
