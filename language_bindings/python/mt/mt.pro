######################################################################
# generated by pvdevelop at: Mi Nov 8 11:58:45 2006
######################################################################

TEMPLATE = lib
CONFIG  += warn_on release qt
QT      += sql

# Input
HEADERS      += ../../sql/qtdatabase.h
SOURCES      += ../../sql/qtdatabase.cpp            \
                ../../language_binding_wrap_mt.cxx  \
                ../../pvmain.cpp
INCLUDEPATH  += ${PYTHON_INCLUDE}
INCLUDEPATH  += ../../../pvserver

#DEFINES += USE_INETD
TARGET = _pv 
