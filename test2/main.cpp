// Qt
#include <QtGui/QGuiApplication>

// Project
#include "qtquick2applicationviewer.h"
#include "cpp/Polygon.h"
#include "cpp/CutterTracker.h"
#include "cpp/CustomGraphicsItem.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<test2::Polygon>("Polygon", 1, 0, "Polygon");
    qmlRegisterType<test2::CutterTracker>("CutterTracker", 1, 0, "CutterTracker");
    qmlRegisterType<test2::CustomGraphicsItem>("CustomGraphicsItem", 1, 0, "CustomGraphicsItem");

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/test2/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
