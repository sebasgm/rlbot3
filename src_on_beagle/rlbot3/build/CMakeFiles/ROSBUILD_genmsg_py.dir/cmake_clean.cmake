FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/rlbot3/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/rlbot3/msg/__init__.py"
  "../src/rlbot3/msg/_Drive.py"
  "../src/rlbot3/msg/_motorsPWM.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
