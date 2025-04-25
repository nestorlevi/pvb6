# adjust for webkit / webengine
#QT     += printsupport opengl svg webkit
#CONFIG += uitools warn_on release
#QT     += printsupport uitools webenginewidgets widgets opengl svg webengine
QT     += printsupport uitools widgets opengl svg
CONFIG += warn_on release
   
contains(QMAKE_CXX, g++) {
  QMAKE_LFLAGS += -static-libgcc
}
INCLUDEPATH  += ../pvbrowser
#INCLUDEPATH  += ../qwt/include
INCLUDEPATH  += ../qwt/src
unix:LIBS    += ../qwt/lib/libqwt.a
win32:LIBS   += ../build-qwt-Desktop_Qt_6_8_1_MSVC2022_64bit-Debug/lib/qwt.lib
win32:LIBS   += ws2_32.lib
win32:LIBS   += imm32.lib
win32:LIBS   += opengl32.lib
win32:LIBS   += glu32.lib
win32:LIBS   += advapi32.lib
DEFINES      += PVB_FOOTPRINT_BASIC
DEFINES      += PVDEVELOP
DEFINES      += NO_WEBKIT
#DEFINES     += NO_QWT
macx:DEFINES += PVMAC
macx:DEFINES += unix
unix:LIBS    += -ldl

HEADERS       = mainwindow.h \
                opt.h \
                editor.h \
                designer.h \
                syntax.h \
                cutil.h \
                dlgopt.h \
                dlgnewprj.h \
                dlgsearchreplace.h \
                dlginsertFunction.h \
                dlgpastewidget.h \
                ../pvbrowser/dlgtextbrowser.h \
                dlgdaemon.h \
                dlgproperty.h \
                dlginsertwidget.h \
                dlgeditlayout.h \
                widgetgenerator.h \
                generatepython.h \
                generatephp.h \
                generateperl.h \
                generatetcl.h \
                generatelua.h \
                ui_dlgnewprj.h \
                ui_dlgsearchreplace.h \
                ui_dlginsertfunction.h \
                ui_dlgpastewidget.h \
                ../pvbrowser/webkit_ui_dlgtextbrowser.h \
                ui_dlgdaemon.h \
                ui_dlgproperty.h \
                ui_dlginsertwidget.h \
                ui_dlgeditlayout.h \
                ../pvbrowser/opt.h \
                ../pvbrowser/MyWidgets.h \
                ../pvbrowser/MyTextBrowser_without_www.h \
                ../pvbrowser/qwtwidgets.h \
                ../pvbrowser/qwtplotwidget.h \
                ../pvbrowser/qdrawwidget.h \
                ../pvbrowser/qimagewidget.h \
                ../pvbrowser/pvglwidget.h \
                ../pvbrowser/interpreter.h \
                ../pvbrowser/pvserver.h

SOURCES       = main.cpp \
                mainwindow.cpp \
                opt.cpp \
                editor.cpp \
                designer.cpp \
                syntax.cpp \
                cutil.cpp \
                dlgopt.cpp \
                dlgnewprj.cpp \
                dlgsearchreplace.cpp \
                dlginsertFunction.cpp \
                dlgpastewidget.cpp \
                ../pvbrowser/dlgtextbrowser.cpp \
                dlgdaemon.cpp \
                dlgproperty.cpp \
                dlginsertwidget.cpp \
                dlgeditlayout.cpp \
                gmodbus.cpp \
                gppi.cpp \
                gsiemens.cpp \
                widgetgenerator.cpp \
                ../pvbrowser/MyWidgets.cpp \
                ../pvbrowser/MyTextBrowser_without_www.cpp \
                ../pvbrowser/qwtplotwidget.cpp \
                ../pvbrowser/QImageWidget.cpp \
                ../pvbrowser/QDrawWidget.cpp \
                ../pvbrowser/pvglwidget.cpp \
                ../pvbrowser/tcputil.cpp

FORMS         = dlgnewprj.ui \
                dlgsearchreplace.ui \
                dlginsertfunction.ui \
                dlgpastewidget.ui \
                dlgdaemon.ui \
                dlgproperty.ui \
                dlginsertwidget.ui \
                dlgeditlayout.ui
#               ../pvbrowser/dlgtextbrowser.ui \

RESOURCES     = pvdevelop.qrc

# install
target.path   = /usr/local/bin
sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS pvdevelop.pro images
sources.path  = /opt/pvb/pvdevelop
INSTALLS     += target sources
