FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/rlbot3/msg"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/Drive.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Drive.lisp"
  "../msg_gen/lisp/motorsPWM.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_motorsPWM.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
