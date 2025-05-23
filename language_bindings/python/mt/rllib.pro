######################################################################
# generated by pvdevelop at: Mi Nov 8 11:58:45 2006
######################################################################

TEMPLATE = lib
CONFIG  += warn_on release qt
QT      += sql

# Input
HEADERS      +=
SOURCES      += ../../language_binding_rllib_wrap_python.cxx
#CONFIG       += INCLUDE_OBJECTS_OF_REAL_RLLIB    
INCLUDE_OBJECTS_OF_REAL_RLLIB {
OBJECTS      += ../../../rllib/lib/rlspawn.o                   \
                ../../../rllib/lib/rlwthread.o                 \
                ../../../rllib/lib/rlthread.o                  \
                ../../../rllib/lib/rlsocket.o                  \
                ../../../rllib/lib/rltime.o                    \
                ../../../rllib/lib/rlmailbox.o                 \
                ../../../rllib/lib/rlfifo.o                    \
                ../../../rllib/lib/rlsharedmemory.o            \
                ../../../rllib/lib/rlspreadsheet.o             \
                ../../../rllib/lib/rlinifile.o                 \
                ../../../rllib/lib/rlinterpreter.o             \
                ../../../rllib/lib/rlpcontrol.o                \
                ../../../rllib/lib/rlcutil.o                   \
                ../../../rllib/lib/rlevent.o                   \
                ../../../rllib/lib/rleventlogserver.o          \
                ../../../rllib/lib/rldataprovider.o            \
                ../../../rllib/lib/rlserial.o                  \
                ../../../rllib/lib/rlmodbus.o                  \
                ../../../rllib/lib/rlmodbusclient.o            \
                ../../../rllib/lib/rl3964r.o                   \
                ../../../rllib/lib/rlsiemenstcp.o              \
                ../../../rllib/lib/rlsiemenstcpclient.o        \
                ../../../rllib/lib/rlcontroller.o              \
                ../../../rllib/lib/rlppiclient.o               \
                ../../../rllib/lib/rlsvganimator.o             \
                ../../../rllib/lib/rlsvgcat.o                  \
                ../../../rllib/lib/rlfileload.o                \
                ../../../rllib/lib/rlhistorylogger.o           \
                ../../../rllib/lib/rlhistoryreader.o           \
                ../../../rllib/lib/rlhilschercif.o             \
                ../../../rllib/lib/rludpsocket.o               \
                ../../../rllib/lib/rleibnetip.o                \
                ../../../rllib/lib/rlopcxmlda.o                \
                ../../../rllib/lib/rldataacquisition.o         \
                ../../../rllib/lib/rldataacquisitionprovider.o \
                ../../../rllib/lib/rlstring.o                  \
                ../../../rllib/lib/rlplc.o                     \
                ../../../rllib/lib/rlwebcam.o                  \
                ../../../rllib/lib/rlcommandlineinterface.o    \
                ../../../rllib/lib/rlreport.o                  \
                ../../../rllib/lib/nodave.o                    \
                ../../../rllib/lib/setport.o
}

INCLUDEPATH  += ${PYTHON_INCLUDE}
INCLUDEPATH  += ../../../pvserver

#DEFINES += USE_INETD
TARGET = _rllib
