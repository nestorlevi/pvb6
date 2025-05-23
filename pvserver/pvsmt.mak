#############################################################################
# Makefile for building: libpvsmt.so.1.0.0
# Generated by qmake (3.1) (Qt 6.4.2)
# Project:  pvsmt.pro
# Template: lib
# Command: /usr/bin/qmake6 -o pvsmt.mak pvsmt.pro -spec linux-clang
#############################################################################

MAKEFILE      = pvsmt.mak

EQ            = =

####### Compiler, tools and options

CC            = clang
CXX           = clang++
DEFINES       = 
CFLAGS        = -pipe -O2 -Wall -Wextra -fPIC $(DEFINES)
CXXFLAGS      = -pipe -O2 -std=gnu++1z -Wall -Wextra -fPIC $(DEFINES)
INCPATH       = -I. -I/usr/lib64/qt6/mkspecs/linux-clang
QMAKE         = /usr/bin/qmake6
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = cp -f
COPY_DIR      = cp -f -R
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = cp -f -R
QINSTALL      = /usr/bin/qmake6 -install qinstall
QINSTALL_PROGRAM = /usr/bin/qmake6 -install qinstall -exe
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
TAR           = tar -cf
COMPRESS      = gzip -9f
DISTNAME      = pvsmt1.0.0
DISTDIR = /home/lehrig/pvb6/pvserver/.tmp/pvsmt1.0.0
LINK          = clang++
LFLAGS        = -Wl,--undefined -shared -lpthread -ldl -Wl,-soname,libpvsmt.so.1
LIBS          = $(SUBLIBS) -ldl -lpthread   
AR            = ar cqs
RANLIB        = 
SED           = sed
STRIP         = strip

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = glencode.cpp \
		pvbImage.cpp \
		util.cpp \
		wthread.cpp 
OBJECTS       = glencode.o \
		pvbImage.o \
		util.o \
		wthread.o
DIST          = /usr/lib64/qt6/mkspecs/features/spec_pre.prf \
		/usr/lib64/qt6/mkspecs/common/unix.conf \
		/usr/lib64/qt6/mkspecs/common/linux.conf \
		/usr/lib64/qt6/mkspecs/common/sanitize.conf \
		/usr/lib64/qt6/mkspecs/common/gcc-base.conf \
		/usr/lib64/qt6/mkspecs/common/gcc-base-unix.conf \
		/usr/lib64/qt6/mkspecs/common/clang.conf \
		/usr/lib64/qt6/mkspecs/qconfig.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core5compat.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_designer.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_gbm_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_kms_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_multimedia.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_network.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_openglwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_positioning.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qml_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlcore.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlintegration.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmllocalstorage.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlworkerscript.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quick_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicklayouts.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_svg.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_svgwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_uiplugin.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_uitools.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webchannel.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginecore.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginewidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webview.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib64/qt6/mkspecs/features/qt_functions.prf \
		/usr/lib64/qt6/mkspecs/features/qt_config.prf \
		/usr/lib64/qt6/mkspecs/linux-clang/qmake.conf \
		/usr/lib64/qt6/mkspecs/features/spec_post.prf \
		.qmake.stash \
		/usr/lib64/qt6/mkspecs/features/exclusive_builds.prf \
		/usr/lib64/qt6/mkspecs/features/toolchain.prf \
		/usr/lib64/qt6/mkspecs/features/default_pre.prf \
		/usr/lib64/qt6/mkspecs/features/resolve_config.prf \
		/usr/lib64/qt6/mkspecs/features/default_post.prf \
		/usr/lib64/qt6/mkspecs/features/warn_on.prf \
		/usr/lib64/qt6/mkspecs/features/qmake_use.prf \
		/usr/lib64/qt6/mkspecs/features/file_copies.prf \
		/usr/lib64/qt6/mkspecs/features/testcase_targets.prf \
		/usr/lib64/qt6/mkspecs/features/exceptions.prf \
		/usr/lib64/qt6/mkspecs/features/yacc.prf \
		/usr/lib64/qt6/mkspecs/features/lex.prf \
		pvsmt.pro BMP.h \
		processviewserver.h \
		pvbImage.h \
		wthread.h glencode.cpp \
		pvbImage.cpp \
		util.cpp \
		wthread.cpp
QMAKE_TARGET  = pvsmt
DESTDIR       = 
TARGET        = libpvsmt.so.1.0.0
TARGETA       = libpvsmt.a
TARGET0       = libpvsmt.so
TARGETD       = libpvsmt.so.1.0.0
TARGET1       = libpvsmt.so.1
TARGET2       = libpvsmt.so.1.0


first: all
####### Build rules

libpvsmt.so.1.0.0:  $(OBJECTS) $(SUBLIBS) $(OBJCOMP)  
	-$(DEL_FILE) $(TARGET) $(TARGET0) $(TARGET1) $(TARGET2)
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS) $(OBJCOMP)
	-ln -s $(TARGET) $(TARGET0)
	-ln -s $(TARGET) $(TARGET1)
	-ln -s $(TARGET) $(TARGET2)



staticlib: libpvsmt.a

libpvsmt.a:  $(OBJECTS) $(OBJCOMP) 
	-$(DEL_FILE) $(TARGETA) 
	$(AR) $(TARGETA) $(OBJECTS)

pvsmt.mak: pvsmt.pro /usr/lib64/qt6/mkspecs/linux-clang/qmake.conf /usr/lib64/qt6/mkspecs/features/spec_pre.prf \
		/usr/lib64/qt6/mkspecs/common/unix.conf \
		/usr/lib64/qt6/mkspecs/common/linux.conf \
		/usr/lib64/qt6/mkspecs/common/sanitize.conf \
		/usr/lib64/qt6/mkspecs/common/gcc-base.conf \
		/usr/lib64/qt6/mkspecs/common/gcc-base-unix.conf \
		/usr/lib64/qt6/mkspecs/common/clang.conf \
		/usr/lib64/qt6/mkspecs/qconfig.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_concurrent.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core5compat.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_core_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_dbus.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_designer.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_gbm_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_gui.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_gui_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_kms_support_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_multimedia.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_network.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_openglwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_positioning.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_printsupport.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qml.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qml_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlcore.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlintegration.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmllocalstorage.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmltest.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlworkerscript.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quick.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quick_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicklayouts.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_quickwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_sql.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_svg.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_svgwidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_testlib.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_uiplugin.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_uitools.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webchannel.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginecore.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginewidgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_webview.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_widgets.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri \
		/usr/lib64/qt6/mkspecs/modules/qt_lib_xml.pri \
		/usr/lib64/qt6/mkspecs/features/qt_functions.prf \
		/usr/lib64/qt6/mkspecs/features/qt_config.prf \
		/usr/lib64/qt6/mkspecs/linux-clang/qmake.conf \
		/usr/lib64/qt6/mkspecs/features/spec_post.prf \
		.qmake.stash \
		/usr/lib64/qt6/mkspecs/features/exclusive_builds.prf \
		/usr/lib64/qt6/mkspecs/features/toolchain.prf \
		/usr/lib64/qt6/mkspecs/features/default_pre.prf \
		/usr/lib64/qt6/mkspecs/features/resolve_config.prf \
		/usr/lib64/qt6/mkspecs/features/default_post.prf \
		/usr/lib64/qt6/mkspecs/features/warn_on.prf \
		/usr/lib64/qt6/mkspecs/features/qmake_use.prf \
		/usr/lib64/qt6/mkspecs/features/file_copies.prf \
		/usr/lib64/qt6/mkspecs/features/testcase_targets.prf \
		/usr/lib64/qt6/mkspecs/features/exceptions.prf \
		/usr/lib64/qt6/mkspecs/features/yacc.prf \
		/usr/lib64/qt6/mkspecs/features/lex.prf \
		pvsmt.pro
	$(QMAKE) -o pvsmt.mak pvsmt.pro -spec linux-clang
/usr/lib64/qt6/mkspecs/features/spec_pre.prf:
/usr/lib64/qt6/mkspecs/common/unix.conf:
/usr/lib64/qt6/mkspecs/common/linux.conf:
/usr/lib64/qt6/mkspecs/common/sanitize.conf:
/usr/lib64/qt6/mkspecs/common/gcc-base.conf:
/usr/lib64/qt6/mkspecs/common/gcc-base-unix.conf:
/usr/lib64/qt6/mkspecs/common/clang.conf:
/usr/lib64/qt6/mkspecs/qconfig.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_concurrent.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_core.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_core5compat.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_core_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_dbus.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_designer.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_gbm_support_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfs_kms_support_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_eglfsdeviceintegration_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_gui.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_gui_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_kms_support_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_multimedia.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_network.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_opengl_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_openglwidgets.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_positioning.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_printsupport.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qml.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qml_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlcore.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlintegration.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmllocalstorage.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlmodels_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmltest.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_qmlworkerscript.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quick.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quick_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickcontrols2impl_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2quickimpl_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickdialogs2utils_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quicklayouts.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quicktemplates2_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_quickwidgets.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_sql.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_svg.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_svgwidgets.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_testlib.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_uiplugin.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_uitools.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_webchannel.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginecore.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_webenginewidgets.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_webview.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_widgets.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_xcb_qpa_lib_private.pri:
/usr/lib64/qt6/mkspecs/modules/qt_lib_xml.pri:
/usr/lib64/qt6/mkspecs/features/qt_functions.prf:
/usr/lib64/qt6/mkspecs/features/qt_config.prf:
/usr/lib64/qt6/mkspecs/linux-clang/qmake.conf:
/usr/lib64/qt6/mkspecs/features/spec_post.prf:
.qmake.stash:
/usr/lib64/qt6/mkspecs/features/exclusive_builds.prf:
/usr/lib64/qt6/mkspecs/features/toolchain.prf:
/usr/lib64/qt6/mkspecs/features/default_pre.prf:
/usr/lib64/qt6/mkspecs/features/resolve_config.prf:
/usr/lib64/qt6/mkspecs/features/default_post.prf:
/usr/lib64/qt6/mkspecs/features/warn_on.prf:
/usr/lib64/qt6/mkspecs/features/qmake_use.prf:
/usr/lib64/qt6/mkspecs/features/file_copies.prf:
/usr/lib64/qt6/mkspecs/features/testcase_targets.prf:
/usr/lib64/qt6/mkspecs/features/exceptions.prf:
/usr/lib64/qt6/mkspecs/features/yacc.prf:
/usr/lib64/qt6/mkspecs/features/lex.prf:
pvsmt.pro:
qmake: FORCE
	@$(QMAKE) -o pvsmt.mak pvsmt.pro -spec linux-clang

qmake_all: FORCE


all: pvsmt.mak libpvsmt.so.1.0.0

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`/$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: FORCE
	@test -d $(DISTDIR) || mkdir -p $(DISTDIR)
	$(COPY_FILE) --parents $(DIST) $(DISTDIR)/


clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) $(TARGET0) $(TARGET1) $(TARGET2) $(TARGETA)
	-$(DEL_FILE) .qmake.stash
	-$(DEL_FILE) pvsmt.mak


####### Sub-libraries

check: first

benchmark: first

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: 

####### Compile

glencode.o: glencode.cpp processviewserver.h \
		vmsgl.h \
		vmsglext.h \
		wthread.h \
		pvbImage.h \
		BMP.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o glencode.o glencode.cpp

pvbImage.o: pvbImage.cpp processviewserver.h \
		vmsgl.h \
		vmsglext.h \
		wthread.h \
		pvbImage.h \
		BMP.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o pvbImage.o pvbImage.cpp

util.o: util.cpp processviewserver.h \
		vmsgl.h \
		vmsglext.h \
		wthread.h \
		pvbImage.h \
		BMP.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o util.o util.cpp

wthread.o: wthread.cpp processviewserver.h \
		vmsgl.h \
		vmsglext.h \
		wthread.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o wthread.o wthread.cpp

####### Install

install:  FORCE

uninstall:  FORCE

FORCE:

.SUFFIXES:

