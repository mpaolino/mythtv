include ( ../../../../settings.pro )

QT += xml sql network

contains(QT_VERSION, ^4\\.[0-9]\\..*) {
CONFIG += qtestlib
}
contains(QT_VERSION, ^5\\.[0-9]\\..*) {
QT += testlib
}

TEMPLATE = app
TARGET = test_mythsystemlegacy
DEPENDPATH += . ../.. ../../logging
INCLUDEPATH += . ../.. ../../logging
LIBS += -L../.. -lmythbase-$$LIBVERSION
LIBS += -Wl,-rpath,$${PWD}/../..

contains(QMAKE_CXX, "g++") {
  QMAKE_CXXFLAGS += -O0 -fprofile-arcs -ftest-coverage 
  QMAKE_LFLAGS += -fprofile-arcs 
}

macx {
QMAKE_LFLAGS += -Wl,-rpath,$(PWD)/../../../../external/zeromq/src/.libs/
QMAKE_LFLAGS += -Wl,-rpath,$(PWD)/../../../../external/nzmqt/src/
QMAKE_LFLAGS += -Wl,-rpath,$(PWD)/../../../../external/qjson/lib/
QMAKE_LFLAGS += -Wl,-rpath,$(PWD)/../..
}

linux | freebsd {
QMAKE_LFLAGS += -Wl,-rpath=$(PWD)/../../../../external/zeromq/src/.libs/
QMAKE_LFLAGS += -Wl,-rpath=$(PWD)/../../../../external/nzmqt/src/
QMAKE_LFLAGS += -Wl,-rpath=$(PWD)/../../../../external/qjson/lib/
QMAKE_LFLAGS += -Wl,-rpath=$(PWD)/../..
}

# Input
HEADERS += test_mythsystemlegacy.h
SOURCES += test_mythsystemlegacy.cpp

QMAKE_CLEAN += $(TARGET) $(TARGETA) $(TARGETD) $(TARGET0) $(TARGET1) $(TARGET2)
QMAKE_CLEAN += ; rm -f *.gcov *.gcda *.gcno

LIBS += $$EXTRA_LIBS $$LATE_LIBS