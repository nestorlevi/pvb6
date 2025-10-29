TEMPLATE = subdirs
CONFIG += ordered

# Subproyecto condicional por plataforma
win32 {
    SUBDIRS += ../../rllib/lib/lib_staticlib.pro  # Biblioteca estática para Windows
} else:unix {
    SUBDIRS += ../../rllib/lib/lib.pro            # Biblioteca compartida para Unix
}

# Lista de subproyectos comunes
SUBDIRS += \
    ../../qwt/src/src.pro \
    ../../rllib/rlfind/rlfind.pro \
    ../../rllib/rlhistory/rlhistory.pro \
    ../../rllib/rlhtml2pdf/rlhtml2pdf.pro \
    ../../rllib/rlsvg/rlsvgcat.pro \
    ../../fake_qmake/fake_qmake.pro \
    ../../pvserver/pvsmt.pro \
    ../../pvdevelop/pvdevelop-with-qwt62.pro \
    ../../language_bindings/lua/pvapplua/pvapplua.pro \
    ../../language_bindings/lua/lua-5.4.0/src/src.pro \
    ../../language_bindings/lua/pvslua/pvslua.pro \
    ../../pvbrowser/pvbrowser-with-basic-footprint.pro

#Nota:
#-El proyecto src.pro se modificó para que la librería generada se guarde en qwt/lib (DESTDIR = $${QWT_ROOT}/lib)
