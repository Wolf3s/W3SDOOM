cmake_minimum_required(VERSION 3.15)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(GAME_SOURCE_FILES
am_map.c	i_main.c	p_ceilng.c	p_setup.c	r_sky.c
d_deh.c		i_net.c		p_doors.c	p_sight.c	r_things.c
d_items.c	i_sound.c	p_enemy.c	p_spec.c	s_sound.c
d_main.c	i_system.c	p_floor.c	p_switch.c	sounds.c
d_net.c		i_video.c	p_genlin.c	p_telept.c	st_lib.c
doomdef.c	info.c		p_inter.c	p_tick.c	st_stuff.c
doomstat.c	m_argv.c	p_lights.c	p_user.c	tables.c
dstrings.c	m_bbox.c	p_map.c		r_bsp.c		v_video.c
f_finale.c	m_cheat.c	p_maputl.c	r_data.c	version.c
f_wipe.c	m_menu.c	p_mobj.c	r_draw.c	w_wad.c
g_game.c	m_misc.c	p_plats.c	r_main.c	wi_stuff.c
hu_lib.c	m_random.c	p_pspr.c	r_plane.c	z_zone.c
hu_stuff.c	mmus2mid.c	p_saveg.c	r_segs.c)
set(GAME_INCLUDE_DIRS "${CMAKE_CURRENT_BINARY_DIR}")
project("Pooch")

# Any settings that should apply to all targets in this directory and all
# subdirectories should go here.  Use judiciously.
if(MSVC)
    add_definitions("/D_CRT_SECURE_NO_WARNINGS" "/D_CRT_SECURE_NO_DEPRECATE"
                    "/D_CRT_NONSTDC_NO_DEPRECATE")
	set_target_properties("pooch" PROPERTIES
                          LINK_FLAGS "/MANIFEST:NO")				
else()
    add_compile_options("-Wall" "-Wdeclaration-after-statement"
                        "-Wredundant-decls")
endif()

find_package(SDL2 2.0.7)
find_package(SDL2_mixer 2.0.2)
find_package(SDL2_net 2.0.0)
find_package(m)

if( NOT WIN32 OR NOT MSVC )
add_compile_definitions(pooch UNIX=1 DOGS=1)
add_executable("pooch" ${SOURCE_FILES_WITH_DEH})
else( WIN32 OR MSVC )
add_compile_definitions(pooch WINDOWS=1 DOGS=1)
add_executable("${PROGRAM_PREFIX}pooch" WIN32 ${SOURCE_FILES_WITH_DEH} "${CMAKE_CURRENT_BINARY_DIR}/win32/pooch.rc")
endif( NOT WIN32 OR NOT MSVC )

include(CheckSymbolExists)
include(CheckIncludeFile)
check_symbol_exists(strcasecmp "strings.h" HAVE_DECL_STRCASECMP)
check_symbol_exists(strncasecmp "strings.h" HAVE_DECL_STRNCASECMP)
check_include_file("dirent.h" HAVE_DIRENT_H)

# Without a hyphen. This is used for the bash-completion scripts.
string(TOLOWER "pooch" PROGRAM_SPREFIX)

# With a hyphen, used almost everywhere else.
set(PROGRAM_PREFIX "pooch")

foreach(SUBDIR ./)
    add_subdirectory("${SUBDIR}")
endforeach()

set(GAME_INCLUDE_DIRS "${CMAKE_CURRENT_BINARY_DIR}")

# Some games support dehacked patches, some don't:

set(SOURCE_FILES ${COMMON_SOURCE_FILES} ${GAME_SOURCE_FILES})
set(SOURCE_FILES_WITH_DEH ${SOURCE_FILES} ${DEHACKED_SOURCE_FILES})

set(EXTRA_LIBS SDL2::SDL2main SDL2::SDL2 SDL2::mixer SDL2::net)

