#include "logos/arch_small.h"
//define colors
#define BLACK  "\e[1;30m"
#define RED    "\e[1;31m"
#define GREEN  "\e[1;32m"
#define YELLOW "\e[1;33m"
#define BLUE   "\e[1;34m"
#define PURPLE "\e[1;35m"
#define CYAN   "\e[1;36m"
#define WHITE  "\e[1;37m"


//define display colors
#define COLOR BLUE
#define LOGOCOLOR CYAN
#define TITLECOLOR BLUE

#define CONFIG \
{ \
   /* name            function                 cached */\
/*  SPACER */\
    { "",             get_title,               false }, \
/*  { "",             get_bar,                 false }, */\
    { "OS: ",         get_os,                  true  }, \
/*  { "Host: ",       get_host,                true  }, */\
    { "Kernel: ",     get_kernel,              true  }, \
    { "Uptime: ",     get_uptime,              false }, \
/*  { "Battery: ",    get_battery_percentage,  false }, */\
    { "Packages: ",   get_packages_pacman,   false }, \
/*  { "Shell: ",      get_shell,             false }, */\
/*  { "Resolution: ", get_resolution,        false }, */\
    { "Terminal: ",   get_terminal,          false }, \
/*    { "CPU: ",        get_cpu,                 true  }, */\
/*    { "GPU: ",        get_gpu1,                true }, */\
    { "Memory: ",     get_memory,              false }, \
/*    SPACER */\
/*    { "",             get_colors1,             false }, */\
/*    { "",             get_colors2,             false }, */\
}

#define CPU_CONFIG \
{ \
   REMOVE("(R)"), \
   REMOVE("(TM)"), \
   REMOVE("Dual-Core"), \
   REMOVE("Quad-Core"), \
   REMOVE("Six-Core"), \
   REMOVE("Eight-Core"), \
   REMOVE("Core"), \
   REMOVE("CPU"), \
}

#define GPU_CONFIG \
{ \
    REMOVE("Corporation"), \
    REMOVE("Controller"), \
    REMOVE("Graphics"), \
    REMOVE("Integrated"), \
}
