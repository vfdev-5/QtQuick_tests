#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
//    viewer.setMainQmlFile(QStringLiteral("qml/test3/MessageBox.qml"));
    viewer.setMainQmlFile(QStringLiteral("qml/test3/DrawingGame.qml"));
//    viewer.setMainQmlFile(QStringLiteral("qml/test3/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
